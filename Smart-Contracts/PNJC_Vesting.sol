// SPDX-License-Identifier: MIT
pragma solidity 0.8.36;


import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/utils/ReentrancyGuard.sol";


/**
 * @title PNJCVestingVault
 * @author PanjoCoin Engineering Team
 *
 * @notice Immutable linear vesting contract for PNJC allocations.
 *
 * @dev Used for:
 *
 * - Founder allocation
 * - Team allocation
 * - Advisors allocation
 *
 * Security:
 *
 * - No owner
 * - No admin
 * - No upgradeability
 * - No pause
 * - Immutable beneficiary
 * - Immutable allocation
 * - Immutable schedule
 *
 * Compatible with PanjoCoin ERC20 V2.
 */
contract PNJCVestingVault is ReentrancyGuard {


    using SafeERC20 for IERC20;



    // =============================================================
    // ERRORS
    // =============================================================


    error ZeroAddress();

    error InvalidDuration();

    error InvalidAllocation();

    error InvalidStart();

    error NotBeneficiary();

    error NothingToClaim();




    // =============================================================
    // IMMUTABLE DATA
    // =============================================================


    IERC20 public immutable token;


    address public immutable beneficiary;


    uint256 public immutable start;


    uint256 public immutable duration;


    uint256 public immutable totalAllocation;



    // =============================================================
    // STATE
    // =============================================================


    uint256 public claimedAmount;



    // =============================================================
    // EVENTS
    // =============================================================


    event VestingCreated(
        address indexed token,
        address indexed beneficiary,
        uint256 allocation,
        uint256 start,
        uint256 duration
    );


    event TokensClaimed(
        address indexed beneficiary,
        uint256 amount
    );




    // =============================================================
    // CONSTRUCTOR
    // =============================================================


    constructor(
        address _token,
        address _beneficiary,
        uint256 _start,
        uint256 _duration,
        uint256 _allocation
    )
    {


        if(_token == address(0))
            revert ZeroAddress();


        if(_beneficiary == address(0))
            revert ZeroAddress();


        if(_beneficiary == address(this))
            revert ZeroAddress();


        if(_duration == 0)
            revert InvalidDuration();


        if(_allocation == 0)
            revert InvalidAllocation();


        if(_start == 0)
            revert InvalidStart();



        token = IERC20(_token);

        beneficiary = _beneficiary;

        start = _start;

        duration = _duration;

        totalAllocation = _allocation;



        emit VestingCreated(
            _token,
            _beneficiary,
            _allocation,
            _start,
            _duration
        );
    }





    // =============================================================
    // CLAIM
    // =============================================================


    /**
     * @notice Claim currently unlocked tokens.
     */
    function claim()
        external
        nonReentrant
    {


        if(msg.sender != beneficiary)
            revert NotBeneficiary();



        uint256 vested =
            _vestedAmount(
                block.timestamp
            );


        uint256 amount =
            vested - claimedAmount;



        if(amount == 0)
            revert NothingToClaim();



        claimedAmount = vested;



        token.safeTransfer(
            beneficiary,
            amount
        );



        emit TokensClaimed(
            beneficiary,
            amount
        );
    }





    // =============================================================
    // VIEW FUNCTIONS
    // =============================================================


    function vestedAmount()
        external
        view
        returns(uint256)
    {
        return _vestedAmount(
            block.timestamp
        );
    }



    function claimableAmount()
        external
        view
        returns(uint256)
    {
        return
            _vestedAmount(block.timestamp)
            -
            claimedAmount;
    }



    function remainingLocked()
        external
        view
        returns(uint256)
    {
        return
            totalAllocation -
            claimedAmount;
    }



    function fundedBalance()
        external
        view
        returns(uint256)
    {
        return token.balanceOf(
            address(this)
        );
    }



    function completed()
        external
        view
        returns(bool)
    {
        return block.timestamp >= start + duration;
    }





    // =============================================================
    // INTERNAL
    // =============================================================


    function _vestedAmount(
        uint256 timestamp
    )
        internal
        view
        returns(uint256)
    {

        if(timestamp <= start)
            return 0;


        uint256 end =
            start + duration;


        if(timestamp >= end)
            return totalAllocation;



        return
            (totalAllocation *
            (timestamp - start))
            /
            duration;
    }

}
