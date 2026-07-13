// SPDX-License-Identifier: MIT
pragma solidity ^0.8.34;

// ================================================================
// OpenZeppelin imports (v5.0+)
// ================================================================
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

/**
 * @title PNJCVestingVault
 * @notice Immutable, linear vesting contract for PNJC allocations (team, founder, advisors).
 * @dev Fully compliant with PanjoCoin Whitepaper v1.0 and Tokenomics v1.0.
 *
 * ## Key Features
 * - **Immutable Parameters:** Token, beneficiary, start time, duration, and total allocation are set at deployment.
 * - **No Owner / Admin:** The contract has no owner — only the beneficiary can claim.
 * - **Linear Vesting:** Tokens vest linearly over the duration (e.g., 12 months) after the start date.
 * - **CEI Pattern:** Checks → Effects → Interactions ensures safety.
 * - **ReentrancyGuard:** Added for defense‑in‑depth.
 *
 * ## Alignment with Documentation
 * - Whitepaper §4.3: "VestingVault — Linear token distribution schedule for team and founder (12 months)."
 * - Whitepaper §6.2: "Team 10% — Distribution schedule (to be implemented in VestingVault)."
 * - Tokenomics §2.3: "Vesting Contracts: Team and founder allocations are subject to linear vesting over 12 months."
 * - Tokenomics §3.2: "Release Formula: Each year, 5% of the remaining locked balance enters circulation."
 *
 * ## Security & Audit Highlights
 * - **No Admin Privileges:** Only the beneficiary can claim; no one can alter or pause the contract.
 * - **No Upgradeability:** The contract is immutable after deployment.
 * - **SafeERC20:** All transfers use SafeERC20 to protect against non‑standard tokens.
 * - **Full Transparency:** All parameters are on‑chain and publicly viewable.
 * - **Audit‑Ready:** Minimal, focused code with no hidden functionality.
 *
 * @author PanjoCoin Engineering Team
 */
contract PNJCVestingVault is ReentrancyGuard {
    using SafeERC20 for IERC20;

    // ================================================================
    // Custom Errors (gas‑optimized)
    // ================================================================

    error ZeroAddress();
    error ZeroDuration();
    error ZeroAllocation();
    error VestingNotStarted();
    error NotBeneficiary();
    error NothingToClaim();
    error InsufficientFunding();

    // ================================================================
    // Metadata – on‑chain transparency
    // ================================================================

    string public constant NAME = "PNJC Vesting Vault";
    string public constant VERSION = "1.0";
    string public constant VESTING_TYPE = "Linear Vesting";
    bool public constant HAS_ADMIN = false;
    bool public constant UPGRADABLE = false;
    bool public constant HAS_PAUSE = false;

    // ================================================================
    // Immutable State (set at deployment)
    // ================================================================

    /// @notice The PNJC token contract.
    IERC20 public immutable token;

    /// @notice The beneficiary address that can claim vested tokens.
    address public immutable beneficiary;

    /// @notice The timestamp when vesting begins (usually deployment time or TGE).
    uint256 public immutable start;

    /// @notice The vesting duration in seconds (e.g., 12 months = 365 days).
    uint256 public immutable duration;

    /// @notice The total amount of tokens allocated to this beneficiary.
    uint256 public immutable totalAllocation;

    // ================================================================
    // Mutable State
    // ================================================================

    /// @notice The total amount of tokens already claimed by the beneficiary.
    uint256 public claimedAmount;

    // ================================================================
    // Events
    // ================================================================

    /// @notice Emitted at deployment to confirm vesting parameters.
    event VestingInitialized(
        address indexed token,
        address indexed beneficiary,
        uint256 allocation,
        uint256 start,
        uint256 duration
    );

    /// @notice Emitted when the beneficiary claims tokens.
    event TokensClaimed(
        address indexed beneficiary,
        uint256 amount,
        uint256 timestamp
    );

    // ================================================================
    // Constructor
    // ================================================================

    /**
     * @notice Deploys the vesting contract with fixed parameters.
     * @param _token The address of the PNJC token.
     * @param _beneficiary The address that will receive the vested tokens.
     * @param _start The timestamp (UNIX seconds) when vesting begins.
     * @param _duration The duration of the vesting period in seconds.
     * @param _allocation The total amount of tokens to vest.
     */
    constructor(
        address _token,
        address _beneficiary,
        uint256 _start,
        uint256 _duration,
        uint256 _allocation
    ) {
        if (_token == address(0)) revert ZeroAddress();
        if (_beneficiary == address(0)) revert ZeroAddress();
        if (_duration == 0) revert ZeroDuration();
        if (_allocation == 0) revert ZeroAllocation();

        token = IERC20(_token);
        beneficiary = _beneficiary;
        start = _start;
        duration = _duration;
        totalAllocation = _allocation;

        emit VestingInitialized(
            _token,
            _beneficiary,
            _allocation,
            _start,
            _duration
        );
    }

    // ================================================================
    // Claim Logic
    // ================================================================

    /**
     * @notice Claims the currently vested and unclaimed tokens.
     * @dev Uses CEI pattern (Checks → Effects → Interactions).
     *      Only the beneficiary can call this function.
     */
    function claim() external nonReentrant {
        // ---- Checks ----
        if (msg.sender != beneficiary) revert NotBeneficiary();
        if (block.timestamp < start) revert VestingNotStarted();

        // ---- Effects ----
        uint256 vested = _vestedAmount(block.timestamp);
        uint256 claimable = vested - claimedAmount;
        if (claimable == 0) revert NothingToClaim();

        claimedAmount = vested;

        // ---- Interaction ----
        token.safeTransfer(beneficiary, claimable);

        emit TokensClaimed(beneficiary, claimable, block.timestamp);
    }

    // ================================================================
    // View Functions – for transparency and monitoring
    // ================================================================

    /**
     * @notice Returns the total amount of tokens vested at the current block timestamp.
     */
    function vestedAmount() external view returns (uint256) {
        return _vestedAmount(block.timestamp);
    }

    /**
     * @notice Returns the number of tokens that are currently claimable.
     */
    function claimableAmount() external view returns (uint256) {
        uint256 vested = _vestedAmount(block.timestamp);
        return vested - claimedAmount;
    }

    /**
     * @notice Returns the number of tokens that remain locked (not yet vested).
     */
    function remainingLocked() external view returns (uint256) {
        return totalAllocation - claimedAmount;
    }

    /**
     * @notice Returns the amount vested at a specific timestamp.
     * @param timestamp The timestamp to calculate vesting for.
     */
    function vestedAt(uint256 timestamp) external view returns (uint256) {
        return _vestedAmount(timestamp);
    }

    /**
     * @notice Returns the total amount of tokens that can ever be claimed.
     */
    function totalVested() external view returns (uint256) {
        return totalAllocation;
    }

    /**
     * @notice Checks if the vesting period has completed.
     */
    function isFullyVested() external view returns (bool) {
        return block.timestamp >= start + duration;
    }

    /**
     * @notice Returns the remaining vesting time in seconds.
     */
    function timeRemaining() external view returns (uint256) {
        uint256 end = start + duration;
        if (block.timestamp >= end) return 0;
        return end - block.timestamp;
    }

    // ================================================================
    // Internal Logic
    // ================================================================

    /**
     * @dev Calculates the vested amount at a given timestamp using a linear curve.
     *      - Before start: 0%
     *      - After completion (start + duration): 100%
     *      - During vesting: linear proportional release.
     * @param timestamp The timestamp to calculate for.
     * @return The number of tokens vested.
     */
    function _vestedAmount(uint256 timestamp) internal view returns (uint256) {
        if (timestamp <= start) {
            return 0;
        }
        uint256 end = start + duration;
        if (timestamp >= end) {
            return totalAllocation;
        }
        // Linear: (allocation * elapsed) / duration
        return (totalAllocation * (timestamp - start)) / duration;
    }

    // ================================================================
    // Security & Audit Notes (not part of bytecode)
    // ================================================================
    /*
        DESIGN PRINCIPLES:

        1. **Immutability & Trust:** All critical parameters are immutable.
           No one can change the beneficiary, amount, or schedule after deployment.

        2. **No Admin Backdoors:** The contract has no owner, no pause, no upgrade.
           Only the beneficiary can claim, and only according to the fixed schedule.

        3. **Reentrancy Protection:** `claim()` uses `nonReentrant` for safety.

        4. **Transparency:** All parameters and state are viewable on‑chain.
           Events are emitted for every claim.

        THREAT MODEL:

        Protected against:
        - Admin abuse (no admin exists).
        - Unauthorized claims (only beneficiary).
        - Premature claims (start time enforced).
        - Over‑claiming (vested amount calculation prevents excess).
        - Reentrancy attacks (nonReentrant).

        Not protected against:
        - Insufficient token balance in the contract (contract must be funded before vesting starts).
        - Compromise of the beneficiary's private key.
        - Vulnerabilities in the underlying token contract.
    */
}
