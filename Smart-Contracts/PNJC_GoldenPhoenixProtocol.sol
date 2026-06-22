// SPDX-License-Identifier: MIT
pragma solidity ^0.8.34;

/// @title PanjoCoin Golden Phoenix Protocol
/// @notice Buyback, burn, and reward execution layer for PNJC funded by USDT.
/// @dev Remix-ready single-file version with OpenZeppelin-style security primitives.
contract PanjoGoldenPhoenix is Ownable2Step, Pausable, ReentrancyGuard {
    using SafeERC20 for IERC20;

    uint256 public constant BPS = 10_000;
    address public constant BURN_ADDRESS = 0x000000000000000000000000000000000000dEaD;
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

    uint256 public minExecutionAmount = 100 * 1e6;
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

    function depositUSDT(uint256 amount) external nonReentrant {
        require(amount > 0, "AMOUNT_ZERO");
        usdtToken.safeTransferFrom(msg.sender, address(this), amount);
        emit FundsDeposited(msg.sender, amount, "USDT");
    }

    function depositUSDTWithSource(uint256 amount, string calldata source) external nonReentrant {
        require(amount > 0, "AMOUNT_ZERO");
        usdtToken.safeTransferFrom(msg.sender, address(this), amount);
        emit FundsDeposited(msg.sender, amount, source);
    }

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

    function updatePriceFloor(uint256 _priceFloor) external onlyOwner {
        require(_priceFloor > 0, "FLOOR_ZERO");
        uint256 oldFloor = priceFloor;
        priceFloor = _priceFloor;
        emit PriceFloorUpdated(oldFloor, _priceFloor);
    }

    function updateRewardPool(address _newPool) external onlyOwner {
        require(_newPool != address(0), "POOL_ZERO");
        address oldPool = rewardPool;
        rewardPool = _newPool;
        emit RewardPoolUpdated(oldPool, _newPool);
    }

    function setMaxSlippageBps(uint256 _newSlippageBps) external onlyOwner {
        require(_newSlippageBps >= 50 && _newSlippageBps <= 1000, "SLIPPAGE_RANGE");
        uint256 oldBps = maxSlippageBps;
        maxSlippageBps = _newSlippageBps;
        emit MaxSlippageUpdated(oldBps, _newSlippageBps);
    }

    function setMinExecutionAmount(uint256 _minAmount) external onlyOwner {
        require(_minAmount >= 50 * 1e6, "MIN_50");
        require(_minAmount <= 10000 * 1e6, "MAX_10K");
        minExecutionAmount = _minAmount;
    }

    function emergencyWithdraw(address token, uint256 amount) external onlyOwner nonReentrant {
        require(amount > 0, "AMOUNT_ZERO");
        if (token == address(0)) {
            (bool ok, ) = payable(owner()).call{value: amount}("");
            require(ok, "ETH_SEND_FAIL");
        } else {
            IERC20(token).safeTransfer(owner(), amount);
        }
    }

    function rescueETH(uint256 amount) external onlyOwner nonReentrant {
        require(amount > 0, "AMOUNT_ZERO");
        (bool ok, ) = payable(owner()).call{value: amount}("");
        require(ok, "ETH_SEND_FAIL");
    }

    function transferOwnership(address newOwner) public override onlyOwner {
        super.transferOwnership(newOwner);
    }

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

    function isReadyToExecute() external view returns (bool) {
        return !paused() && usdtToken.balanceOf(address(this)) >= minExecutionAmount;
    }

    function getCurrentPrice() external view returns (uint256) {
        return _getCurrentPrice();
    }

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

    function _burnPNJC(uint256 amount) internal {
        require(amount > 0, "BURN_ZERO");
        try IBurnable(address(pnjcToken)).burn(amount) {
        } catch {
            pnjcToken.safeTransfer(BURN_ADDRESS, amount);
        }
    }

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

interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
}

interface IUniswapV2Router02 {
    function swapExactTokensForTokens(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);

    function getAmountsOut(uint256 amountIn, address[] calldata path) external view returns (uint256[] memory amounts);
}

interface IBurnable {
    function burn(uint256 amount) external;
}

library SafeERC20 {
    function safeTransfer(IERC20 token, address to, uint256 amount) internal {
        require(token.transfer(to, amount), "TRANSFER_FAILED");
    }

    function safeTransferFrom(IERC20 token, address from, address to, uint256 amount) internal {
        require(token.transferFrom(from, to, amount), "TRANSFER_FROM_FAILED");
    }

    function forceApprove(IERC20 token, address spender, uint256 amount) internal {
        require(token.approve(spender, 0), "APPROVE_RESET_FAILED");
        require(token.approve(spender, amount), "APPROVE_FAILED");
    }
}

abstract contract Ownable2Step {
    address private _owner;
    address private _pendingOwner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    event OwnershipTransferStarted(address indexed previousOwner, address indexed newOwner);

    constructor(address initialOwner) {
        require(initialOwner != address(0), "OWNER_ZERO");
        _owner = initialOwner;
        emit OwnershipTransferred(address(0), initialOwner);
    }

    modifier onlyOwner() {
        require(msg.sender == _owner, "NOT_OWNER");
        _;
    }

    function owner() public view returns (address) {
        return _owner;
    }

    function pendingOwner() public view returns (address) {
        return _pendingOwner;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "NEW_OWNER_ZERO");
        _pendingOwner = newOwner;
        emit OwnershipTransferStarted(_owner, newOwner);
    }

    function acceptOwnership() public {
        require(msg.sender == _pendingOwner, "NOT_PENDING_OWNER");
        address oldOwner = _owner;
        _owner = _pendingOwner;
        _pendingOwner = address(0);
        emit OwnershipTransferred(oldOwner, _owner);
    }
}

abstract contract ReentrancyGuard {
    uint256 private constant _NOT_ENTERED = 1;
    uint256 private constant _ENTERED = 2;
    uint256 private _status = _NOT_ENTERED;

    modifier nonReentrant() {
        require(_status != _ENTERED, "REENTRANCY");
        _status = _ENTERED;
        _;
        _status = _NOT_ENTERED;
    }
}

abstract contract Pausable {
    bool private _paused;

    event Paused(address account);
    event Unpaused(address account);

    constructor() {
        _paused = false;
    }

    modifier whenNotPaused() {
        require(!_paused, "PAUSED");
        _;
    }

    modifier whenPaused() {
        require(_paused, "NOT_PAUSED");
        _;
    }

    function paused() public view returns (bool) {
        return _paused;
    }

    function _pause() internal whenNotPaused {
        _paused = true;
        emit Paused(msg.sender);
    }

    function _unpause() internal whenPaused {
        _paused = false;
        emit Unpaused(msg.sender);
    }
}
