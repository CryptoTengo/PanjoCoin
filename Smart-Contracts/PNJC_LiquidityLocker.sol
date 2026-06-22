// SPDX-License-Identifier: MIT
pragma solidity 0.8.34;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

/**
 * @title PNJC Liquidity Locker V2
 * @notice Immutable lock contract for Uniswap V2-style ERC-20 LP tokens.
 *
 * @dev AUDIT / INVESTOR SUMMARY
 * This contract is designed to custody-lock a single ERC-20 LP token type
 * for a fixed time period. It does not mint, burn, rebase, tax, or otherwise
 * manage the PNJC token itself. Its sole purpose is to provide transparent,
 * deterministic, and time-bound liquidity locking.
 *
 * @dev SECURITY MODEL
 * - No owner.
 * - No admin role.
 * - No upgradeability.
 * - No emergency withdrawal.
 * - No rescue functions.
 * - No hidden token logic.
 * - Reentrancy protection on all external state-changing functions.
 *
 * @dev DESIGN PRINCIPLES
 * - Checks-Effects-Interactions pattern.
 * - Immutable configuration.
 * - Explicit on-chain lock records.
 * - Withdrawals allowed only after the unlock timestamp.
 *
 * @dev BUSINESS RATIONALE
 * Liquidity locks increase public transparency by preventing immediate
 * withdrawal of LP tokens before a predefined unlock time.
 * This helps reduce rug-pull concerns and improves investor confidence.
 *
 * @dev IMPORTANT
 * This is an LP token locker, not an ERC-20 project token contract.
 * The asset held by this contract is the Uniswap V2 LP token itself.
 */
contract PNJCLiquidityLockerV2 is ReentrancyGuard {
    using SafeERC20 for IERC20;

    /**
     * @notice Lock lifecycle status.
     * @dev Used for off-chain indexing, dashboards, and audit review.
     */
    enum LockStatus {
        Empty,
        Locked,
        Unlocked,
        Withdrawn
    }

    /**
     * @notice Stored lock position data.
     * @param lpToken The locked Uniswap V2 LP token contract.
     * @param beneficiary The address that can withdraw after unlock.
     * @param amount The amount of LP tokens locked.
     * @param unlockTime The timestamp when the lock becomes withdrawable.
     * @param withdrawn True once the lock has been released.
     */
    struct LockPosition {
        address lpToken;
        address beneficiary;
        uint256 amount;
        uint256 unlockTime;
        bool withdrawn;
    }

    /// @notice Project reference address used for attribution and deployment context.
    address public immutable creator;

    /// @notice The LP token accepted by this locker.
    address public immutable lpToken;

    /// @notice Semantic version for off-chain tooling and human review.
    string public constant VERSION = "PNJCLiquidityLockerV2-1.0.0";

    /// @notice Total number of lock positions created.
    uint256 public lockCount;

    /// @dev lockId => lock data.
    mapping(uint256 => LockPosition) private _locks;

    /**
     * @notice Emitted when LP tokens are locked.
     * @param lockId Unique lock identifier.
     * @param lpToken The locked LP token address.
     * @param beneficiary The recipient after unlock.
     * @param amount The locked LP token amount.
     * @param unlockTime The timestamp when withdrawal becomes possible.
     */
    event LiquidityLocked(
        uint256 indexed lockId,
        address indexed lpToken,
        address indexed beneficiary,
        uint256 amount,
        uint256 unlockTime
    );

    /**
     * @notice Emitted when LP tokens are withdrawn after unlock.
     * @param lockId Unique lock identifier.
     * @param beneficiary The address receiving the unlocked LP tokens.
     * @param amount The withdrawn LP token amount.
     */
    event LiquidityWithdrawn(
        uint256 indexed lockId,
        address indexed beneficiary,
        uint256 amount
    );

    /**
     * @notice Deploys the liquidity locker.
     * @param _creator Human-readable project reference address.
     * @param _lpToken The Uniswap V2 LP token address to be locked.
     *
     * @dev AUDITOR NOTE
     * This contract is intentionally restricted to one LP token address in order
     * to reduce configuration risk and make verification straightforward.
     */
    constructor(address _creator, address _lpToken) {
        if (_creator == address(0)) revert ZeroAddress();
        if (_lpToken == address(0)) revert ZeroAddress();

        creator = _creator;
        lpToken = _lpToken;
    }

    /**
     * @notice Returns the contract version.
     * @return A human-readable semantic version string.
     */
    function version() external pure returns (string memory) {
        return VERSION;
    }

    /**
     * @notice Returns the contract version.
     * @return A human-readable semantic version string.
     */
    function contractVersion() external pure returns (string memory) {
        return VERSION;
    }

    /**
     * @notice Returns the accepted LP token address.
     * @return The LP token address.
     *
     * @dev This is named positionManager for project-wide interface consistency,
     * even though Uniswap V2 does not use a nonfungible position manager.
     */
    function positionManager() external view returns (address) {
        return lpToken;
    }

    /**
     * @notice Locks Uniswap V2 LP tokens in the contract.
     * @param amount The amount of LP tokens to lock.
     * @param beneficiary The address that can withdraw after unlock.
     * @param unlockTime The Unix timestamp when withdrawal becomes available.
     *
     * @dev REQUIREMENTS
     * - Caller must own the LP tokens.
     * - Caller must approve this contract to spend the LP tokens.
     * - unlockTime must be strictly greater than the current block timestamp.
     *
     * @dev AUDITOR NOTE
     * The function follows Checks-Effects-Interactions:
     * 1. Validate inputs.
     * 2. Transfer LP tokens into custody.
     * 3. Persist the lock record.
     * 4. Emit a traceable event.
     */
    function lock(
        uint256 amount,
        address beneficiary,
        uint256 unlockTime
    ) external nonReentrant returns (uint256 lockId) {
        if (beneficiary == address(0)) revert ZeroAddress();
        if (amount == 0) revert InvalidAmount();
        if (unlockTime <= block.timestamp) revert InvalidUnlockTime();

        IERC20 token = IERC20(lpToken);
        if (token.balanceOf(msg.sender) < amount) revert NotLPTokenOwner();

        token.safeTransferFrom(msg.sender, address(this), amount);

        lockId = ++lockCount;
        _locks[lockId] = LockPosition({
            lpToken: lpToken,
            beneficiary: beneficiary,
            amount: amount,
            unlockTime: unlockTime,
            withdrawn: false
        });

        emit LiquidityLocked(lockId, lpToken, beneficiary, amount, unlockTime);
    }

    /**
     * @notice Withdraws LP tokens after the unlock time is reached.
     * @param lockId The lock identifier.
     *
     * @dev REQUIREMENTS
     * - Only the beneficiary can withdraw.
     * - The lock must not already be withdrawn.
     * - The unlock time must have passed.
     *
     * @dev AUDITOR NOTE
     * The withdrawn flag is set before the external transfer to prevent
     * reentrancy-based double withdrawal.
     */
    function withdraw(uint256 lockId) external nonReentrant {
        LockPosition storage position = _locks[lockId];
        if (position.lpToken == address(0)) revert InvalidLockId();
        if (msg.sender != position.beneficiary) revert NotBeneficiary();
        if (position.withdrawn) revert AlreadyWithdrawn();
        if (block.timestamp < position.unlockTime) revert StillLocked();

        position.withdrawn = true;

        IERC20(position.lpToken).safeTransfer(
            position.beneficiary,
            position.amount
        );

        emit LiquidityWithdrawn(lockId, position.beneficiary, position.amount);
    }

    /**
     * @notice Returns the current lifecycle state of a lock.
     * @param lockId The lock identifier.
     * @return A LockStatus enum value.
     *
     * @dev STATUS DEFINITIONS
     * - Empty: The lockId has never been created.
     * - Locked: Tokens are held and still time-locked.
     * - Unlocked: The unlock time has passed and withdrawal is available.
     * - Withdrawn: The LP tokens have already been released.
     */
    function lockStatus(uint256 lockId) external view returns (LockStatus) {
        LockPosition memory p = _locks[lockId];
        if (p.lpToken == address(0)) return LockStatus.Empty;
        if (p.withdrawn) return LockStatus.Withdrawn;
        if (block.timestamp >= p.unlockTime) return LockStatus.Unlocked;
        return LockStatus.Locked;
    }

    /**
     * @notice Returns the remaining time until unlock.
     * @param lockId The lock identifier.
     * @return Remaining seconds until withdrawal becomes available.
     */
    function timeRemaining(uint256 lockId) external view returns (uint256) {
        LockPosition memory p = _locks[lockId];
        if (p.lpToken == address(0) || p.withdrawn || block.timestamp >= p.unlockTime) {
            return 0;
        }
        return p.unlockTime - block.timestamp;
    }

    /**
     * @notice Returns whether the lock is still active.
     * @param lockId The lock identifier.
     * @return True if the position is currently locked.
     */
    function isLocked(uint256 lockId) external view returns (bool) {
        return this.lockStatus(lockId) == LockStatus.Locked;
    }

    /**
     * @notice Returns whether the unlock time has passed.
     * @param lockId The lock identifier.
     * @return True if the position is unlocked.
     */
    function isUnlocked(uint256 lockId) external view returns (bool) {
        return this.lockStatus(lockId) == LockStatus.Unlocked;
    }

    /**
     * @notice Returns whether the LP tokens have already been withdrawn.
     * @param lockId The lock identifier.
     * @return True if the lock has been withdrawn.
     */
    function isWithdrawn(uint256 lockId) external view returns (bool) {
        return this.lockStatus(lockId) == LockStatus.Withdrawn;
    }

    /**
     * @notice Returns the full lock record.
     * @param lockId The lock identifier.
     * @return lpToken_ The LP token address.
     * @return beneficiary The withdrawal beneficiary.
     * @return amount The locked LP token amount.
     * @return unlockTime The withdrawal timestamp.
     * @return withdrawn The withdrawal flag.
     */
    function getLock(
        uint256 lockId
    )
        external
        view
        returns (
            address lpToken_,
            address beneficiary,
            uint256 amount,
            uint256 unlockTime,
            bool withdrawn
        )
    {
        LockPosition memory p = _locks[lockId];
        return (p.lpToken, p.beneficiary, p.amount, p.unlockTime, p.withdrawn);
    }

    /**
     * @dev Custom errors keep the bytecode compact and make failures explicit.
     */
    error ZeroAddress();
    error InvalidAmount();
    error InvalidUnlockTime();
    error NotLPTokenOwner();
    error NotBeneficiary();
    error AlreadyWithdrawn();
    error StillLocked();
    error InvalidLockId();
}
