// SPDX-License-Identifier: MIT
pragma solidity ^0.8.34;

// ================================================================
// OpenZeppelin imports (v5.0+)
// ================================================================
import "@openzeppelin/contracts/access/Ownable2Step.sol";
import "@openzeppelin/contracts/utils/Pausable.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

/**
 * @title IUniswapV2Router02
 * @dev Interface for the QuickSwap/Uniswap V2 router on Polygon.
 *      Used for swapping USDT → WMATIC → PNJC.
 */
interface IUniswapV2Router02 {
    function getAmountsOut(uint256 amountIn, address[] calldata path)
        external
        view
        returns (uint256[] memory amounts);

    function swapExactTokensForTokens(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);
}

/**
 * @title IBurnable
 * @dev Interface for tokens that support burn() (PNJC implements ERC20Burnable).
 */
interface IBurnable {
    function burn(uint256 amount) external;
}

/**
 * @title PNJC_GoldenPhoenixProtocol
 * @notice Golden Phoenix Protocol – Automated buyback, burn, and reward mechanism for PNJC.
 * @dev Fully compliant with:
 *      - Whitepaper v1.0 (section 8.2 “GoldenPhoenixProtocol”)
 *      - Tokenomics v1.0 (section 4 “Deflationary Mechanism”)
 *      - Multi‑Sig Operations Manual v3.0 (for emergency procedures)
 *
 * ## Core Mechanism (as per Whitepaper)
 * 1. USDT is deposited into the contract (from partners, NFT marketplace fees, donations).
 * 2. A fixed percentage (`insurancePercent`, 3–10%) of the total USDT balance is
 *    reserved into the Insurance Fund.
 * 3. Another percentage (`buybackPercent`, 15–35%) is used to swap USDT for PNJC
 *    via QuickSwap V2.  **Invariant:** `insurancePercent + buybackPercent == 30` (i.e.,
 *    30% of total USDT is split between insurance and buyback; the remaining 70%
 *    stays in the contract as accumulated capital for future cycles).
 * 4. The bought PNJC is split: `burnPercent` (30–70%) is permanently burned,
 *    and `rewardPercent` (30–70%) is sent to the Reward Pool.  **Invariant:**
 *    `burnPercent + rewardPercent == 100`.
 * 5. If the market price falls below `priceFloor`, the owner (multisig) can trigger
 *    `protectPrice()`, using up to 50% of the Insurance Fund to buy back and burn PNJC.
 *
 * ## Governance & Security
 * - The contract is owned by a 3/5 multisig (executing DAO decisions).
 * - All critical parameters are adjustable only by the owner after DAO votes.
 * - Emergency withdrawal functions are provided for crisis scenarios, with mandatory
 *   public reporting (as per Multi‑Sig Manual).
 * - ReentrancyGuard and Pausable ensure safety.
 *
 * ## Parameter Constraints (enforced by code, aligned with docs)
 * - `insurancePercent`  : 3% – 10%
 * - `buybackPercent`    : 15% – 35%
 * - `insurancePercent + buybackPercent == 30`  (invariant from Whitepaper)
 * - `burnPercent`       : 30% – 70%
 * - `rewardPercent`     : 30% – 70%
 * - `burnPercent + rewardPercent == 100`
 * - `minExecutionAmount`: 50 – 10 000 USDT
 * - `maxSlippageBps`    : 50 – 1000 bps
 *
 * @author PanjoCoin Engineering Team
 */
contract PNJC_GoldenPhoenixProtocol is Ownable2Step, Pausable, ReentrancyGuard {
    using SafeERC20 for IERC20;

    // ================================================================
    // Constants – Polygon Mainnet Addresses (immutable)
    // ================================================================

    /// @notice Basis points denominator (100% = 10_000 bps).
    uint256 public constant BPS = 10_000;

    /// @notice USDT decimal base (6 decimals on Polygon).
    uint256 public constant USDT_DECIMALS_BASE = 1e6;

    /// @notice Standard dead address for burning when `burn()` is unavailable (fallback).
    address public constant DEAD_ADDRESS = 0x000000000000000000000000000000000000dEaD;

    /// @notice WMATIC address on Polygon.
    address public constant WMATIC_POLYGON = 0x0d500B1d8E8eF31E21C99d1Db9A6444d3ADf1270;

    /// @notice QuickSwap V2 Router address (Polygon) – compatible with Uniswap V2 interface.
    address public constant POLYGON_UNISWAP_V2_ROUTER = 0xedf6066a2b290C185783862C7F4776A2C8077AD1;

    /// @notice USDT (ERC20) address on Polygon.
    address public constant USDT_POLYGON = 0xc2132D05D31c914a87C6611C10748AEb04B58e8F;

    // ================================================================
    // Immutable State
    // ================================================================

    /// @notice The PNJC token contract (implements ERC20 + Burnable).
    IERC20 public immutable pnjcToken;

    /// @notice The USDT token contract.
    IERC20 public immutable usdtToken;

    /// @notice The DEX router (QuickSwap V2).
    IUniswapV2Router02 public immutable router;

    // ================================================================
    // Mutable State (governed by DAO via multisig)
    // ================================================================

    /// @notice Address where reward tokens are sent (e.g., community pool).
    address public rewardPool;

    /// @notice Percentage of total USDT reserved for insurance fund (3–10%).
    uint256 public insurancePercent = 5;

    /// @notice Percentage of total USDT used for buyback (15–35%).
    /// @dev Invariant: insurancePercent + buybackPercent == 30.
    uint256 public buybackPercent = 25;

    /// @notice Percentage of bought PNJC that is burned (30–70%).
    uint256 public burnPercent = 50;

    /// @notice Percentage of bought PNJC sent to reward pool (30–70%).
    /// @dev Invariant: burnPercent + rewardPercent == 100.
    uint256 public rewardPercent = 50;

    /// @notice Minimum USDT balance required to trigger execution (50–10 000 USDT).
    uint256 public minExecutionAmount = 100 * USDT_DECIMALS_BASE;

    /// @notice Maximum allowed slippage during swap (in bps, 50–1000).
    uint256 public maxSlippageBps = 300;

    /// @notice Price floor in wei per PNJC (as specified in Tokenomics v1.0).
    uint256 public priceFloor = 1e9; // 0.000000001 PNJC = 1e9 wei

    // ================================================================
    // Accounting
    // ================================================================

    /// @notice Total USDT accumulated in the insurance fund.
    uint256 public insuranceFund;

    /// @notice Total USDT used for buybacks (cumulative).
    uint256 public totalUSDTCollected;

    /// @notice Total PNJC bought (cumulative).
    uint256 public totalPNJCBought;

    /// @notice Total PNJC burned (cumulative).
    uint256 public totalPNJCBurned;

    /// @notice Total PNJC sent to reward pool (cumulative).
    uint256 public totalPNJCRewarded;

    /// @notice Number of successful executions.
    uint256 public executionCount;

    // ================================================================
    // Events – for transparency and off‑chain monitoring
    // ================================================================

    /// @notice Emitted after each successful execution cycle.
    event GoldenExecution(
        uint256 usdtSpent,
        uint256 pnjcBought,
        uint256 pnjcBurned,
        uint256 pnjcRewarded,
        uint256 insuranceAdded,
        uint256 timestamp
    );

    /// @notice Emitted when insurance fund is used for price protection.
    event InsuranceUsed(uint256 amount, string reason);

    /// @notice Emitted when priceFloor is updated.
    event PriceFloorUpdated(uint256 oldFloor, uint256 newFloor);

    /// @notice Emitted when protocol parameters are updated.
    event ParametersUpdated(
        uint256 insurancePercent,
        uint256 buybackPercent,
        uint256 burnPercent,
        uint256 rewardPercent
    );

    /// @notice Emitted when the reward pool address changes.
    event RewardPoolUpdated(address oldPool, address newPool);

    /// @notice Emitted when USDT is deposited.
    event FundsDeposited(address indexed from, uint256 amount, string source);

    /// @notice Emitted when max slippage is updated.
    event MaxSlippageUpdated(uint256 oldBps, uint256 newBps);

    /// @notice Emitted when emergency withdrawal occurs.
    event EmergencyWithdrawal(address indexed token, address indexed to, uint256 amount, string reason);

    // ================================================================
    // Modifiers
    // ================================================================

    /// @dev Ensures the protocol is not paused.
    modifier whenProtocolActive() {
        require(!paused(), "Protocol is paused");
        _;
    }

    // ================================================================
    // Constructor
    // ================================================================

    /**
     * @notice Sets up the protocol with the PNJC token and initial reward pool.
     * @param _pnjcToken Address of the PNJC ERC20 contract.
     * @param _rewardPool Address where reward tokens will be sent.
     * @dev The owner is set to the deployer (typically a multisig) via Ownable2Step.
     */
    constructor(address _pnjcToken, address _rewardPool) Ownable(msg.sender) {
        require(_pnjcToken != address(0), "PNJC address cannot be zero");
        require(_rewardPool != address(0), "Reward pool cannot be zero");

        pnjcToken = IERC20(_pnjcToken);
        usdtToken = IERC20(USDT_POLYGON);
        rewardPool = _rewardPool;
        router = IUniswapV2Router02(POLYGON_UNISWAP_V2_ROUTER);
    }

    // ================================================================
    // Core Logic – Golden Execution Cycle
    // ================================================================

    /**
     * @notice Executes a full buyback-and-burn cycle using the current USDT balance.
     * @dev Can be called by anyone (bot, keeper, or multisig) when conditions are met.
     *      ReentrancyGuard protects against nested calls.
     *
     * Steps (aligned with Whitepaper §8.2):
     * 1. Calculate insuranceAmount = usdtBalance * insurancePercent / 100
     * 2. Calculate usdtForBuyback = usdtBalance * buybackPercent / 100
     * 3. Invariant: insurancePercent + buybackPercent == 30 (i.e., 30% of total is used)
     * 4. Transfer insuranceAmount to insuranceFund.
     * 5. Swap usdtForBuyback → PNJC via QuickSwap.
     * 6. Split bought PNJC: burnPercent burned, rewardPercent sent to rewardPool.
     * 7. The remaining USDT (70%) stays in the contract as accumulated capital.
     */
    function executeGoldenBurn() external nonReentrant whenProtocolActive {
        uint256 usdtBalance = usdtToken.balanceOf(address(this));
        require(usdtBalance >= minExecutionAmount, "Insufficient USDT balance");

        // 1. Insurance portion (percent of total balance)
        uint256 insuranceAmount = (usdtBalance * insurancePercent) / 100;
        // 2. Buyback portion (percent of total balance)
        uint256 usdtForBuyback = (usdtBalance * buybackPercent) / 100;
        require(usdtForBuyback > 0, "Buyback amount is zero");

        // 3. Update insurance fund
        insuranceFund += insuranceAmount;

        // 4. Swap USDT -> PNJC via QuickSwap V2
        uint256 pnjcBought = _swapUSDTToPNJC(usdtForBuyback);
        require(pnjcBought > 0, "Swap failed");

        // 5. Split bought tokens: burn and reward
        uint256 pnjcToBurn = (pnjcBought * burnPercent) / 100;
        uint256 pnjcToReward = pnjcBought - pnjcToBurn;

        if (pnjcToBurn > 0) {
            _burnPNJC(pnjcToBurn);
        }
        if (pnjcToReward > 0) {
            pnjcToken.safeTransfer(rewardPool, pnjcToReward);
        }

        // 6. Update statistics
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

    /**
     * @notice Uses up to 50% of the Insurance Fund to buy back and burn PNJC if price drops below floor.
     * @dev Only callable by owner (multisig) after verifying the price condition.
     *      This is the primary mechanism for price protection as described in Tokenomics §4.2.
     */
    function protectPrice() external onlyOwner nonReentrant whenNotPaused {
        require(insuranceFund > 0, "Insurance fund is empty");

        uint256 currentPrice = _getCurrentPrice();
        require(currentPrice < priceFloor, "Price is above or equal to floor");

        // Use up to 50% of the fund in one go to avoid market impact.
        uint256 usdtToUse = insuranceFund / 2;
        require(usdtToUse > 0, "Amount too small");

        insuranceFund -= usdtToUse;

        uint256 pnjcBought = _swapUSDTToPNJC(usdtToUse);
        if (pnjcBought > 0) {
            _burnPNJC(pnjcBought);
        }

        emit InsuranceUsed(usdtToUse, "Price floor protection");
    }

    // ================================================================
    // Deposit Functions – for receiving USDT
    // ================================================================

    /**
     * @notice Deposits USDT into the contract (used by partners, NFT marketplace, donations).
     * @param amount Amount of USDT (with 6 decimals) to deposit.
     */
    function depositUSDT(uint256 amount) external nonReentrant {
        require(amount > 0, "Amount must be > 0");
        usdtToken.safeTransferFrom(msg.sender, address(this), amount);
        emit FundsDeposited(msg.sender, amount, "USDT");
    }

    /**
     * @notice Deposits USDT with an optional source label for transparency.
     * @param amount Amount of USDT (with 6 decimals).
     * @param source Human‑readable string describing the origin (e.g., "NFT marketplace").
     */
    function depositUSDTWithSource(uint256 amount, string calldata source) external nonReentrant {
        require(amount > 0, "Amount must be > 0");
        usdtToken.safeTransferFrom(msg.sender, address(this), amount);
        emit FundsDeposited(msg.sender, amount, source);
    }

    // ================================================================
    // Parameter Updates – only owner (multisig) after DAO vote
    // ================================================================

    /**
     * @notice Updates the core percentages of the protocol.
     * @dev All constraints are enforced inline. Must be called after a successful DAO vote.
     *      Parameters are aligned with Whitepaper §8.2 and Tokenomics §4.1.
     */
    function updateParameters(
        uint256 _insurancePercent,
        uint256 _buybackPercent,
        uint256 _burnPercent,
        uint256 _rewardPercent
    ) external onlyOwner {
        // Enforce invariant: insurance + buyback = 30 (Whitepaper §8.2)
        require(_insurancePercent + _buybackPercent == 30, "insurance + buyback must equal 30");
        // Enforce invariant: burn + reward = 100
        require(_burnPercent + _rewardPercent == 100, "burn + reward must equal 100");

        // Range checks (as per Whitepaper and Tokenomics)
        require(_insurancePercent >= 3 && _insurancePercent <= 10, "insurance out of range (3–10)");
        require(_buybackPercent >= 15 && _buybackPercent <= 35, "buyback out of range (15–35)");
        require(_burnPercent >= 30 && _burnPercent <= 70, "burn out of range (30–70)");
        require(_rewardPercent >= 30 && _rewardPercent <= 70, "reward out of range (30–70)");

        insurancePercent = _insurancePercent;
        buybackPercent = _buybackPercent;
        burnPercent = _burnPercent;
        rewardPercent = _rewardPercent;

        emit ParametersUpdated(_insurancePercent, _buybackPercent, _burnPercent, _rewardPercent);
    }

    /**
     * @notice Updates the minimum execution threshold.
     * @param _minAmount New minimum USDT amount (with 6 decimals).
     */
    function setMinExecutionAmount(uint256 _minAmount) external onlyOwner {
        require(_minAmount >= 50 * USDT_DECIMALS_BASE, "Minimum is 50 USDT");
        require(_minAmount <= 10000 * USDT_DECIMALS_BASE, "Maximum is 10 000 USDT");
        minExecutionAmount = _minAmount;
    }

    /**
     * @notice Updates the price floor (in wei per PNJC).
     * @param _priceFloor New floor value (must be > 0).
     */
    function updatePriceFloor(uint256 _priceFloor) external onlyOwner {
        require(_priceFloor > 0, "Floor must be > 0");
        uint256 oldFloor = priceFloor;
        priceFloor = _priceFloor;
        emit PriceFloorUpdated(oldFloor, _priceFloor);
    }

    /**
     * @notice Changes the reward pool address.
     * @param _newPool New address for receiving reward tokens.
     */
    function updateRewardPool(address _newPool) external onlyOwner {
        require(_newPool != address(0), "Reward pool cannot be zero");
        address oldPool = rewardPool;
        rewardPool = _newPool;
        emit RewardPoolUpdated(oldPool, _newPool);
    }

    /**
     * @notice Updates the maximum acceptable slippage during swaps.
     * @param _newSlippageBps New slippage in basis points (50–1000).
     */
    function setMaxSlippageBps(uint256 _newSlippageBps) external onlyOwner {
        require(_newSlippageBps >= 50 && _newSlippageBps <= 1000, "Slippage out of range (50–1000 bps)");
        uint256 oldBps = maxSlippageBps;
        maxSlippageBps = _newSlippageBps;
        emit MaxSlippageUpdated(oldBps, _newSlippageBps);
    }

    // ================================================================
    // Pause Control
    // ================================================================

    /**
     * @notice Pauses the protocol (disables executeGoldenBurn).
     * @dev Only owner (multisig) can pause, typically during emergencies.
     */
    function pauseProtocol() external onlyOwner {
        _pause();
    }

    /**
     * @notice Unpauses the protocol.
     */
    function unpauseProtocol() external onlyOwner {
        _unpause();
    }

    // ================================================================
    // Emergency Withdrawals (as described in Multi‑Sig Manual v3.0)
    // ================================================================

    /**
     * @notice Emergency withdrawal of any ERC20 token from the contract.
     * @dev Only callable by owner (multisig) in case of critical vulnerabilities or other emergencies.
     *      Must be accompanied by a public report within 24 hours (governance requirement).
     * @param token Address of the token to withdraw (use address(0) for native).
     * @param amount Amount to withdraw.
     * @param reason Human‑readable explanation (for transparency).
     */
    function emergencyWithdraw(
        address token,
        uint256 amount,
        string calldata reason
    ) external onlyOwner nonReentrant {
        require(amount > 0, "Amount must be > 0");
        require(bytes(reason).length > 0, "Reason required");

        if (token == address(0)) {
            // Native currency (MATIC/POL)
            (bool success, ) = payable(owner()).call{value: amount}("");
            require(success, "Native transfer failed");
        } else {
            IERC20(token).safeTransfer(owner(), amount);
        }

        emit EmergencyWithdrawal(token, owner(), amount, reason);
    }

    /**
     * @notice Emergency withdrawal of native currency (MATIC/POL).
     * @dev Convenience wrapper around emergencyWithdraw.
     */
    function rescueETH(uint256 amount, string calldata reason) external onlyOwner nonReentrant {
        require(amount > 0, "Amount must be > 0");
        require(bytes(reason).length > 0, "Reason required");
        (bool success, ) = payable(owner()).call{value: amount}("");
        require(success, "Native transfer failed");
        emit EmergencyWithdrawal(address(0), owner(), amount, reason);
    }

    // ================================================================
    // View Functions – for transparency and monitoring
    // ================================================================

    /**
     * @notice Returns comprehensive protocol statistics.
     * @return usdtCollected – total USDT used for buybacks.
     * @return pnjcBought – total PNJC acquired.
     * @return pnjcBurned – total PNJC burned.
     * @return pnjcRewarded – total PNJC sent to reward pool.
     * @return insurance – current insurance fund balance.
     * @return executions – number of successful cycles.
     */
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

    /**
     * @notice Estimates the outcome of the next execution without performing the swap.
     * @return usdtToUse – USDT that will be swapped (buyback portion).
     * @return estimatedPnjcBought – Estimated PNJC received.
     * @return estimatedPnjcBurned – Estimated PNJC burned.
     * @return estimatedPnjcRewarded – Estimated PNJC sent to reward pool.
     */
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

        // Buyback amount is a fixed percent of total balance (invariant enforced)
        usdtToUse = (usdtBalance * buybackPercent) / 100;

        // Price quote via router
        address[] memory path = new address[](3);
        path[0] = address(usdtToken);
        path[1] = WMATIC_POLYGON;
        path[2] = address(pnjcToken);

        uint256[] memory amounts = router.getAmountsOut(usdtToUse, path);
        estimatedPnjcBought = amounts[2];
        estimatedPnjcBurned = (estimatedPnjcBought * burnPercent) / 100;
        estimatedPnjcRewarded = estimatedPnjcBought - estimatedPnjcBurned;
    }

    /**
     * @notice Checks whether the protocol is ready to execute.
     * @return true if not paused and USDT balance >= minExecutionAmount.
     */
    function isReadyToExecute() external view returns (bool) {
        return !paused() && usdtToken.balanceOf(address(this)) >= minExecutionAmount;
    }

    /**
     * @notice Returns the current price of PNJC in wei per 1 USDT.
     * @return Price in wei (18 decimals).
     */
    function getCurrentPrice() external view returns (uint256) {
        return _getCurrentPrice();
    }

    // ================================================================
    // Internal Helpers
    // ================================================================

    /**
     * @dev Swaps USDT for PNJC via QuickSwap V2 (path: USDT → WMATIC → PNJC).
     * @param amountIn Amount of USDT (6 decimals) to swap.
     * @return Amount of PNJC received (18 decimals).
     */
    function _swapUSDTToPNJC(uint256 amountIn) internal returns (uint256) {
        address[] memory path = new address[](3);
        path[0] = address(usdtToken);
        path[1] = WMATIC_POLYGON;
        path[2] = address(pnjcToken);

        // Compute minimum output with slippage protection
        uint256[] memory expected = router.getAmountsOut(amountIn, path);
        uint256 minOut = (expected[2] * (BPS - maxSlippageBps)) / BPS;

        // Approve router to spend USDT
        usdtToken.forceApprove(address(router), amountIn);

        // Execute swap
        uint256[] memory amounts = router.swapExactTokensForTokens(
            amountIn,
            minOut,
            path,
            address(this),
            block.timestamp + 300 // 5 min deadline
        );

        return amounts[2];
    }

    /**
     * @dev Burns PNJC or sends to dead address if burn() is not available (fallback).
     * @param amount Amount of PNJC to burn.
     */
    function _burnPNJC(uint256 amount) internal {
        require(amount > 0, "Cannot burn zero");
        // Try calling burn() on the token contract; fallback to dead address.
        try IBurnable(address(pnjcToken)).burn(amount) {
            // Success
        } catch {
            pnjcToken.safeTransfer(DEAD_ADDRESS, amount);
        }
    }

    /**
     * @dev Queries the current price of PNJC per 1 USDT from the router.
     * @return Price in wei (18 decimals).
     */
    function _getCurrentPrice() internal view returns (uint256) {
        address[] memory path = new address[](3);
        path[0] = address(usdtToken);
        path[1] = WMATIC_POLYGON;
        path[2] = address(pnjcToken);

        uint256[] memory amounts = router.getAmountsOut(1e6, path);
        return amounts[2];
    }

    // ================================================================
    // Receive Ether (native currency)
    // ================================================================

    /**
     * @notice Fallback function to accept native currency (MATIC/POL) deposits.
     */
    receive() external payable {}
}
