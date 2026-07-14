// SPDX-License-Identifier: MIT
pragma solidity 0.8.34;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

/**
 * @title PNJCLiquidityLockerV2
 * @author PanjoCoin Engineering Team
 * @notice An immutable, ownerless vault for locking Uniswap V2 LP tokens (ERC20).
 * @dev Designed for high-assurance, audit-ready security. 
 * - Implements ReentrancyGuard for atomic operation safety.
 * - Uses SafeERC20 to prevent issues with non-standard ERC20 implementations.
 * - Immutable design: no admin functions, no upgrades, no emergency withdrawals.
 */
contract PNJCLiquidityLockerV2 is ReentrancyGuard {
    using SafeERC20 for IERC20;

    // --- Custom Errors ---
    error InvalidAddress();
    error InvalidUnlockTime();
    error InvalidLockId();
    error NotBeneficiary();
    error LockStillActive();
    error AlreadyWithdrawn();
    error ZeroAmount();

    // --- Data Structures ---
    struct LockPosition {
        address lpToken;      // LP token contract address
        address beneficiary;  // Recipient after unlock
        uint256 amount;       // Liquidity quantity
        uint256 unlockTime;   // Unix timestamp for unlocking
        bool withdrawn;       // Re-entrancy/double-withdrawal protection
    }

    // --- State Variables ---
    uint256 public lockCount;
    mapping(uint256 => LockPosition) private _locks;

    // --- Events ---
    event LiquidityLocked(
        uint256 indexed lockId,
        address indexed lpToken,
        address indexed beneficiary,
        uint256 amount,
        uint256 unlockTime
    );

    event LiquidityWithdrawn(
        uint256 indexed lockId,
        address indexed beneficiary,
        uint256 amount
    );

    // --- Modifiers ---
    modifier validLock(uint256 lockId) {
        if (lockId == 0 || lockId > lockCount) revert InvalidLockId();
        _;
    }

    /**
     * @notice Locks LP tokens in the vault.
     * @param lpToken Address of the Uniswap V2 pair/LP token.
     * @param amount Quantity of tokens to lock.
     * @param beneficiary Recipient authorized to withdraw after unlock.
     * @param unlockTime Expiration timestamp.
     * @return lockId The unique identifier for the position.
     */
    function lock(
        address lpToken,
        uint256 amount,
        address beneficiary,
        uint256 unlockTime
    ) external nonReentrant returns (uint256 lockId) {
        if (lpToken == address(0) || beneficiary == address(0)) revert InvalidAddress();
        if (amount == 0) revert ZeroAmount();
        if (unlockTime <= block.timestamp) revert InvalidUnlockTime();

        lockId = ++lockCount;
        
        _locks[lockId] = LockPosition({
            lpToken: lpToken,
            beneficiary: beneficiary,
            amount: amount,
            unlockTime: unlockTime,
            withdrawn: false
        });

        IERC20(lpToken).safeTransferFrom(msg.sender, address(this), amount);

        emit LiquidityLocked(lockId, lpToken, beneficiary, amount, unlockTime);
    }

    /**
     * @notice Withdraws LP tokens once the lock duration has elapsed.
     * @param lockId The identifier for the specific position.
     */
    function withdraw(uint256 lockId) external nonReentrant validLock(lockId) {
        LockPosition storage position = _locks[lockId];

        if (msg.sender != position.beneficiary) revert NotBeneficiary();
        if (position.withdrawn) revert AlreadyWithdrawn();
        if (block.timestamp < position.unlockTime) revert LockStillActive();

        position.withdrawn = true;
        IERC20(position.lpToken).safeTransfer(position.beneficiary, position.amount);

        emit LiquidityWithdrawn(lockId, position.beneficiary, position.amount);
    }

    // --- View Functions ---
    function getLock(uint256 lockId) external view validLock(lockId) returns (LockPosition memory) {
        return _locks[lockId];
    }
}
