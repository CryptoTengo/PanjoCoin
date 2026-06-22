// SPDX-License-Identifier: MIT
pragma solidity ^0.8.34;

/// @title PNJC Golden Phoenix Protocol
/// @notice Treasury automation for USDT -> PNJC buyback, burn, and rewards.
/// @dev Polygon deployment. Uses Uniswap V2 router on Polygon and defensive ERC20 handling.
contract PNJC_GoldenPhoenixProtocol is Ownable2Step, Pausable, ReentrancyGuard {
    using SafeERC20 for IERC20;

    uint256 public constant BPS = 10_000;
    uint256 public constant USDT_DECIMALS_BASE = 1e6;

    address public constant DEAD_ADDRESS = 0x000000000000000000000000000000000000dEaD;
    address public constant WMATIC_POLYGON = 0x0d500B1d8E8eF31E21C99d1Db9A6444d3ADf1270;
    address public constant POLYGON_UNISWAP_V2_ROUTER = 0xedf6066a2b290C185783862C7F4776A2C8077AD1;
    address public constant USDT_POLYGON = 0xc2132D05D31c914a87C6611C10748AEb04B58e8F;

    IERC20 public immutable pnjcToken;
    IERC20 public immutable usdtToken;
    IUniswapV2Router02 public immutable router;

    address public rewardPool;

    uint256 public insurancePercent = 5;
    uint256 public buybackPercent = 25;
    uint256 public burnPercent = 50;
    uint256 public rewardPercent = 50;

    uint256 public minExecutionAmount = 100 * USDT_DECIMALS_BASE;
    uint256 public maxSlippageBps = 300;
    uint256 public priceFloor = 1e12;

    uint256 public insuranceFund;
    uint256 public totalUSDTCollected;
    uint256 public totalPNJCBought;
    uint256 public totalPNJCBurned;
    uint256 public totalPNJCRewarded;
    uint256 public executionCount;

    event GoldenExecution(
        uint256 usdtSpent,
        uint256 pnjcBought,
        uint256 pnjcBurned,
        uint256 pnjcRewarded,
        uint256 insuranceAdded,
        uint256 timestamp
    );

    event InsuranceUsed(uint256 amount, string reason);
    event PriceFloorUpdated(uint256 oldFloor, uint256 newFloor);
    event ParametersUpdated(uint256 insurancePercent, uint256 buybackPercent, uint256 burnPercent, uint256 rewardPercent);
    event RewardPoolUpdated(address oldPool, address newPool);
    event FundsDeposited(address indexed from, uint256 amount, string source);
    event MaxSlippageUpdated(uint256 oldBps, uint256 newBps);

    constructor(address _pnjcToken, address _rewardPool) Ownable(msg.sender) {
        require(_pnjcToken != address(0), "PNJC_ZERO");
        require(_rewardPool != address(0), "POOL_ZERO");

        pnjcToken = IERC20(_pnjcToken);
        usdtToken = IERC20(USDT_POLYGON);
        rewardPool = _rewardPool;
        router = IUniswapV2Router02(POLYGON_UNISWAP_V2_ROUTER);
    }

    modifier whenProtocolActive() {
        require(!paused(), "PAUSED");
        _;
    }

    /// @notice Main automation entrypoint.
    /// @dev Uses the current USDT balance held by the contract. Part of the funds are reserved as insurance.
    function executeGoldenBurn() external nonReentrant whenProtocolActive {
        uint256 usdtBalance = usdtToken.balanceOf(address(this));
        require(usdtBalance >= minExecutionAmount, "INSUFFICIENT_USDT");

        uint256 insuranceAmount = (usdtBalance * insurancePercent) / 100;
        uint256 usdtAfterInsurance = usdtBalance - insuranceAmount;
        uint256 usdtForBuyback = (usdtAfterInsurance * buybackPercent) / 100;
        require(usdtForBuyback > 0, "ZERO_BUYBACK");

        insuranceFund += insuranceAmount;

        uint256 pnjcBought = _swapUSDTToPNJC(usdtForBuyback);
        require(pnjcBought > 0, "SWAP_FAILED");

        uint256 pnjcToBurn = (pnjcBought * burnPercent) / 100;
        uint256 pnjcToReward = pnjcBought - pnjcToBurn;

        if (pnjcToBurn > 0) {
            _burnPNJC(pnjcToBurn);
        }

        if (pnjcToReward > 0) {
            pnjcToken.safeTransfer(rewardPool, pnjcToReward);
        }

        totalUSDTCollected += usdtForBuyback;
        totalPNJCBought += pnjcBought;
        totalPNJCBurned += pnjcToBurn;
        totalPNJCRewarded += pnjcToReward;
        executionCount += 1;

        emit GoldenExecution(
            usdtForBuyback,
            pnjcBought,
            pnjcToBurn,
            pnjcToReward,
            insuranceAmount,
            block.timestamp
        );
    }

    /// @notice Uses insurance funds to support price when the floor is breached.
    function protectPrice() external onlyOwner nonReentrant whenNotPaused {
        require(insuranceFund > 0, "NO_INSURANCE");

        uint256 currentPrice = _getCurrentPrice();
        require(currentPrice < priceFloor, "ABOVE_FLOOR");

        uint256 usdtToUse = insuranceFund / 2;
        require(usdtToUse > 0, "TOO_SMALL");

        insuranceFund -= usdtToUse;

        uint256 pnjcBought = _swapUSDTToPNJC(usdtToUse);
        if (pnjcBought > 0) {
            _burnPNJC(pnjcBought);
        }

        emit InsuranceUsed(usdtToUse, "PRICE_PROTECTION");
    }

    /// @notice Deposits USDT into the contract.
    function depositUSDT(uint256 amount) external nonReentrant {
        require(amount > 0, "AMOUNT_ZERO");
        usdtToken.safeTransferFrom(msg.sender, address(this), amount);
        emit FundsDeposited(msg.sender, amount, "USDT");
    }

    /// @notice Deposits USDT and records a source label.
    function depositUSDTWithSource(uint256 amount, string calldata source) external nonReentrant {
        require(amount > 0, "AMOUNT_ZERO");
        usdtToken.safeTransferFrom(msg.sender, address(this), amount);
        emit FundsDeposited(msg.sender, amount, source);
    }

    /// @notice Updates the execution split.
    function updateParameters(
        uint256 _insurancePercent,
        uint256 _buybackPercent,
        uint256 _burnPercent,
        uint256 _rewardPercent
    ) external onlyOwner {
        require(_insurancePercent + _buybackPercent == 30, "INS_BUYBACK_30");
        require(_burnPercent + _rewardPercent == 100, "BURN_REWARD_100");
        require(_insurancePercent >= 3 && _insurancePercent <= 10, "INS_RANGE");
        require(_buybackPercent >= 15 && _buybackPercent <= 35, "BUYBACK_RANGE");
        require(_burnPercent >= 30 && _burnPercent <= 70, "BURN_RANGE");
        require(_rewardPercent >= 30 && _rewardPercent <= 70, "REWARD_RANGE");

        insurancePercent = _insurancePercent;
        buybackPercent = _buybackPercent;
        burnPercent = _burnPercent;
        rewardPercent = _rewardPercent;

        emit ParametersUpdated(_insurancePercent, _buybackPercent, _burnPercent, _rewardPercent);
    }

    /// @notice Updates the minimum USDT balance for an execution.
    function setMinExecutionAmount(uint256 _minAmount) external onlyOwner {
        require(_minAmount >= 50 * USDT_DECIMALS_BASE, "MIN_50");
        require(_minAmount <= 10000 * USDT_DECIMALS_BASE, "MAX_10K");
        minExecutionAmount = _minAmount;
    }

    /// @notice Updates the floor price.
    function updatePriceFloor(uint256 _priceFloor) external onlyOwner {
        require(_priceFloor > 0, "FLOOR_ZERO");
        uint256 oldFloor = priceFloor;
        priceFloor = _priceFloor;
        emit PriceFloorUpdated(oldFloor, _priceFloor);
    }

    /// @notice Updates the reward distribution address.
    function updateRewardPool(address _newPool) external onlyOwner {
        require(_newPool != address(0), "POOL_ZERO");
        address oldPool = rewardPool;
        rewardPool = _newPool;
        emit RewardPoolUpdated(oldPool, _newPool);
    }

    /// @notice Sets the maximum tolerated slippage in basis points.
    function setMaxSlippageBps(uint256 _newSlippageBps) external onlyOwner {
        require(_newSlippageBps >= 50 && _newSlippageBps <= 1000, "SLIPPAGE_RANGE");
        uint256 oldBps = maxSlippageBps;
        maxSlippageBps = _newSlippageBps;
        emit MaxSlippageUpdated(oldBps, _newSlippageBps);
    }

    /// @notice Pauses protocol execution.
    function pauseProtocol() external onlyOwner {
        _pause();
    }

    /// @notice Unpauses protocol execution.
    function unpauseProtocol() external onlyOwner {
        _unpause();
    }

    /// @notice Emergency token withdrawal by owner.
    function emergencyWithdraw(address token, uint256 amount) external onlyOwner nonReentrant {
        require(amount > 0, "AMOUNT_ZERO");
        if (token == address(0)) {
            (bool ok, ) = payable(owner()).call{value: amount}("");
            require(ok, "ETH_SEND_FAIL");
        } else {
            IERC20(token).safeTransfer(owner(), amount);
        }
    }

    /// @notice Emergency native token withdrawal.
    function rescueETH(uint256 amount) external onlyOwner nonReentrant {
        require(amount > 0, "AMOUNT_ZERO");
        (bool ok, ) = payable(owner()).call{value: amount}("");
        require(ok, "ETH_SEND_FAIL");
    }

    /// @notice Returns protocol statistics.
    function getStats()
        external
        view
        returns (
            uint256 usdtCollected,
            uint256 pnjcBought,
            uint256 pnjcBurned,
            uint256 pnjcRewarded,
            uint256 insurance,
            uint256 executions
        )
    {
        return (
            totalUSDTCollected,
            totalPNJCBought,
            totalPNJCBurned,
            totalPNJCRewarded,
            insuranceFund,
            executionCount
        );
    }

    /// @notice Estimates the next execution outcome using router quotes.
    function calculateNextBurn()
        external
        view
        returns (
            uint256 usdtToUse,
            uint256 estimatedPnjcBought,
            uint256 estimatedPnjcBurned,
            uint256 estimatedPnjcRewarded
        )
    {
        uint256 usdtBalance = usdtToken.balanceOf(address(this));
        if (usdtBalance < minExecutionAmount) {
            return (0, 0, 0, 0);
        }

        uint256 insuranceAmount = (usdtBalance * insurancePercent) / 100;
        uint256 usdtAfterInsurance = usdtBalance - insuranceAmount;
        usdtToUse = (usdtAfterInsurance * buybackPercent) / 100;

        address[] memory path = new address[](3);
        path[0] = address(usdtToken);
        path[1] = WMATIC_POLYGON;
        path[2] = address(pnjcToken);

        uint256[] memory amounts = router.getAmountsOut(usdtToUse, path);
        estimatedPnjcBought = amounts[2];
        estimatedPnjcBurned = (estimatedPnjcBought * burnPercent) / 100;
        estimatedPnjcRewarded = estimatedPnjcBought - estimatedPnjcBurned;
    }

    /// @notice Returns whether the protocol is ready to run.
    function isReadyToExecute() external view returns (bool) {
        return !paused() && usdtToken.balanceOf(address(this)) >= minExecutionAmount;
    }

    /// @notice Returns the current router quote for 1 USDT.
    function getCurrentPrice() external view returns (uint256) {
        return _getCurrentPrice();
    }

    /// @dev Swaps USDT into PNJC through WMATIC on Polygon.
    function _swapUSDTToPNJC(uint256 amountIn) internal returns (uint256) {
        address[] memory path = new address[](3);
        path[0] = address(usdtToken);
        path[1] = WMATIC_POLYGON;
        path[2] = address(pnjcToken);

        uint256[] memory expected = router.getAmountsOut(amountIn, path);
        uint256 minOut = (expected[2] * (BPS - maxSlippageBps)) / BPS;

        usdtToken.forceApprove(address(router), amountIn);

        uint256[] memory amounts = router.swapExactTokensForTokens(
            amountIn,
            minOut,
            path,
            address(this),
            block.timestamp + 300
        );

        return amounts[2];
    }

    /// @dev Burns PNJC or sends it to the dead address if burn(uint256) is unavailable.
    function _burnPNJC(uint256 amount) internal {
        require(amount > 0, "BURN_ZERO");
        try IBurnable(address(pnjcToken)).burn(amount) {
        } catch {
            pnjcToken.safeTransfer(DEAD_ADDRESS, amount);
        }
    }

    /// @dev Returns the current router quote for 1 USDT.
    function _getCurrentPrice() internal view returns (uint256) {
        address[] memory path = new address[](3);
        path[0] = address(usdtToken);
        path[1] = WMATIC_POLYGON;
        path[2] = address(pnjcToken);

        uint256[] memory amounts = router.getAmountsOut(1e6, path);
        return amounts[2];
    }

    receive() external payable {}
}
