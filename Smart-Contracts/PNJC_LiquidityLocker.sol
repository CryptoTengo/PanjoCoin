// SPDX-License-Identifier: MIT
pragma solidity 0.8.36;


// ================================================================
// OpenZeppelin Contracts v5.x
// ================================================================

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/utils/ReentrancyGuard.sol";



/**
 * @title PNJCLiquidityLocker
 * @author PanjoCoin Engineering Team
 *
 * @notice
 * Immutable liquidity locking vault for PNJC DEX liquidity.
 *
 *
 * @dev
 * The contract locks LP tokens received from:
 *
 * - QuickSwap
 * - Uniswap V2 compatible DEXs
 *
 *
 * Security model:
 *
 * - No owner
 * - No admin
 * - No upgradeability
 * - No proxy
 * - No emergency withdrawal
 * - No hidden privileges
 *
 *
 * Once LP tokens are locked:
 *
 * - They cannot be removed before unlock time.
 * - Only the predefined beneficiary can withdraw.
 *
 *
 * Compatible with:
 *
 * PanjoCoin ERC20 V2
 * Polygon PoS
 * OpenZeppelin Contracts v5
 */
contract PNJCLiquidityLocker is ReentrancyGuard {


    using SafeERC20 for IERC20;



    // =============================================================
    // ERRORS
    // =============================================================


    error ZeroAddress();

    error InvalidAmount();

    error InvalidUnlockTime();

    error InvalidLockId();

    error NotBeneficiary();

    error LockNotExpired();

    error AlreadyWithdrawn();

    error CannotLockLocker();



    // =============================================================
    // STRUCTURES
    // =============================================================


    /**
     * @notice Represents one liquidity lock position.
     */
    struct LockPosition {


        /**
         * @notice LP token contract address.
         */
        address lpToken;


        /**
         * @notice Wallet allowed to withdraw after unlock.
         */
        address beneficiary;


        /**
         * @notice Amount of LP tokens locked.
         */
        uint256 amount;


        /**
         * @notice Unlock timestamp.
         */
        uint256 unlockTime;


        /**
         * @notice Withdrawal status.
         */
        bool withdrawn;
    }





    // =============================================================
    // STATE
    // =============================================================


    /**
     * @notice Total created locks.
     */
    uint256 public lockCount;



    /**
     * @notice Lock storage.
     */
    mapping(uint256 => LockPosition) private locks;





    // =============================================================
    // EVENTS
    // =============================================================


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





    // =============================================================
    // MODIFIERS
    // =============================================================


    modifier validLock(
        uint256 lockId
    )
    {

        if(lockId == 0 || lockId > lockCount)
            revert InvalidLockId();

        _;
    }





    // =============================================================
    // LOCK FUNCTION
    // =============================================================


    /**
     * @notice Locks LP tokens.
     *
     * @param lpToken LP token address.
     * @param amount Amount of LP tokens.
     * @param beneficiary Wallet receiving LP after unlock.
     * @param unlockTime Timestamp when withdrawal is allowed.
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
            revert CannotLockLocker();



        if(amount == 0)
            revert InvalidAmount();



        if(unlockTime <= block.timestamp)
            revert InvalidUnlockTime();




        lockId = ++lockCount;



        locks[lockId] =
            LockPosition({

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





    // =============================================================
    // WITHDRAW FUNCTION
    // =============================================================


    /**
     * @notice Withdraws LP tokens after unlock.
     *
     * @param lockId Lock identifier.
     */
    function withdraw(
        uint256 lockId
    )
        external
        nonReentrant
        validLock(lockId)
    {


        LockPosition storage position =
            locks[lockId];



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
    // VIEW FUNCTIONS
    // =============================================================


    /**
     * @notice Returns lock information.
     */
    function getLock(
        uint256 lockId
    )
        external
        view
        validLock(lockId)
        returns(
            LockPosition memory
        )
    {

        return locks[lockId];
    }



    /**
     * @notice Checks if liquidity is still locked.
     */
    function isLocked(
        uint256 lockId
    )
        external
        view
        validLock(lockId)
        returns(bool)
    {

        LockPosition memory position =
            locks[lockId];


        return
            !position.withdrawn &&
            block.timestamp < position.unlockTime;
    }



    /**
     * @notice Returns remaining lock time.
     */
    function remainingLockTime(
        uint256 lockId
    )
        external
        view
        validLock(lockId)
        returns(uint256)
    {

        LockPosition memory position =
            locks[lockId];


        if(block.timestamp >= position.unlockTime)
            return 0;


        return position.unlockTime -
               block.timestamp;
    }

}
