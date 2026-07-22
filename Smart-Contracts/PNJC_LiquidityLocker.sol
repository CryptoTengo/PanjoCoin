// SPDX-License-Identifier: MIT
pragma solidity 0.8.36;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

/**
 * @title PNJCLiquidityLockerV2
 * @author PanjoCoin Engineering Team
 *
 * @notice Immutable LP token locker for PanjoCoin liquidity.
 *
 * @dev Security properties:
 *
 * - No owner
 * - No admin keys
 * - No upgradeability
 * - No emergency withdrawal
 * - No hidden privileges
 * - Uses OpenZeppelin SafeERC20
 * - Protected against reentrancy attacks
 *
 * Designed for locking DEX liquidity provider tokens
 * from QuickSwap / Uniswap V2 compatible pools.
 */
contract PNJCLiquidityLockerV2 is ReentrancyGuard {

    using SafeERC20 for IERC20;


    // =============================================================
    //                          ERRORS
    // =============================================================

    error ZeroAddress();
    error InvalidUnlockTime();
    error InvalidLockId();
    error ZeroAmount();
    error NotBeneficiary();
    error LockNotExpired();
    error AlreadyWithdrawn();
    error CannotLockLockerToken();


    // =============================================================
    //                          STRUCT
    // =============================================================

    /**
     * @notice Represents one liquidity lock position.
     */
    struct LockPosition {

        /// @notice LP token contract address
        address lpToken;

        /// @notice Address allowed to withdraw after unlock
        address beneficiary;

        /// @notice Amount of LP tokens locked
        uint256 amount;

        /// @notice Unix timestamp when withdrawal becomes possible
        uint256 unlockTime;

        /// @notice Withdrawal status
        bool withdrawn;
    }


    // =============================================================
    //                         STORAGE
    // =============================================================

    /**
     * @notice Total number of liquidity locks created.
     */
    uint256 public lockCount;


    /**
     * @notice Mapping lock ID => lock data.
     */
    mapping(uint256 => LockPosition) private _locks;



    // =============================================================
    //                          EVENTS
    // =============================================================


    /**
     * @notice Emitted when liquidity is locked.
     */
    event LiquidityLocked(
        uint256 indexed lockId,
        address indexed lpToken,
        address indexed beneficiary,
        uint256 amount,
        uint256 unlockTime
    );


    /**
     * @notice Emitted when liquidity is withdrawn.
     */
    event LiquidityWithdrawn(
        uint256 indexed lockId,
        address indexed beneficiary,
        uint256 amount
    );



    // =============================================================
    //                         MODIFIERS
    // =============================================================


    modifier validLock(uint256 lockId) {

        if(lockId == 0 || lockId > lockCount)
            revert InvalidLockId();

        _;
    }



    // =============================================================
    //                      CORE FUNCTIONS
    // =============================================================


    /**
     * @notice Locks LP tokens permanently until unlock timestamp.
     *
     * @param lpToken LP token address from DEX pool.
     * @param amount Amount of LP tokens to lock.
     * @param beneficiary Wallet allowed to withdraw after unlock.
     * @param unlockTime Unix timestamp of unlock.
     *
     * @return lockId Created lock identifier.
     */
    function lock(
        address lpToken,
        uint256 amount,
        address beneficiary,
        uint256 unlockTime
    )
        external
        nonReentrant
        returns(uint256 lockId)
    {

        if(lpToken == address(0))
            revert ZeroAddress();

        if(beneficiary == address(0))
            revert ZeroAddress();

        if(lpToken == address(this))
            revert CannotLockLockerToken();

        if(amount == 0)
            revert ZeroAmount();

        if(unlockTime <= block.timestamp)
            revert InvalidUnlockTime();


        lockId = ++lockCount;


        _locks[lockId] = LockPosition({

            lpToken: lpToken,

            beneficiary: beneficiary,

            amount: amount,

            unlockTime: unlockTime,

            withdrawn:false
        });


        IERC20(lpToken)
            .safeTransferFrom(
                msg.sender,
                address(this),
                amount
            );


        emit LiquidityLocked(
            lockId,
            lpToken,
            beneficiary,
            amount,
            unlockTime
        );
    }




    /**
     * @notice Withdraw locked liquidity after expiration.
     *
     * @param lockId Lock identifier.
     */
    function withdraw(uint256 lockId)
        external
        nonReentrant
        validLock(lockId)
    {

        LockPosition storage position = _locks[lockId];


        if(msg.sender != position.beneficiary)
            revert NotBeneficiary();


        if(position.withdrawn)
            revert AlreadyWithdrawn();


        if(block.timestamp < position.unlockTime)
            revert LockNotExpired();



        position.withdrawn = true;



        IERC20(position.lpToken)
            .safeTransfer(
                position.beneficiary,
                position.amount
            );


        emit LiquidityWithdrawn(
            lockId,
            position.beneficiary,
            position.amount
        );
    }



    // =============================================================
    //                         VIEW FUNCTIONS
    // =============================================================


    /**
     * @notice Returns lock information.
     */
    function getLock(uint256 lockId)
        external
        view
        validLock(lockId)
        returns(LockPosition memory)
    {
        return _locks[lockId];
    }


}
