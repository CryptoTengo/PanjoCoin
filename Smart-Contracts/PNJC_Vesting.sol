// SPDX-License-Identifier: MIT
pragma solidity 0.8.34;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

/**
 * @title PNJC Linear Vesting Vault
 * @notice Immutable linear vesting contract for PNJC allocations
 *
 * SECURITY PROPERTIES
 * ─────────────────────────────────────────────
 * ✓ No owner
 * ✓ No admin
 * ✓ No upgradeability
 * ✓ No pause mechanism
 * ✓ No rescue functions
 * ✓ Immutable vesting parameters
 * ✓ Beneficiary-only claims
 * ✓ Deterministic linear vesting
 * ✓ SafeERC20 transfers
 *
 * AUDIT CLASSIFICATION
 * ─────────────────────────────────────────────
 * Institutional-Grade Linear Vesting Primitive
 */
contract PNJCVestingVault {
    using SafeERC20 for IERC20;

    // --------------------------------------------------
    // Custom Errors
    // --------------------------------------------------

    error ZeroAddress();
    error ZeroDuration();
    error ZeroAllocation();
    error VestingNotStarted();
    error NotBeneficiary();
    error NothingToClaim();
    error InsufficientFunding();

    // --------------------------------------------------
    // Immutable State
    // --------------------------------------------------

    IERC20 public immutable token;

    address public immutable beneficiary;

    uint256 public immutable start;

    uint256 public immutable duration;

    uint256 public immutable totalAllocation;

    // --------------------------------------------------
    // Mutable State
    // --------------------------------------------------

    uint256 public claimedAmount;

    // --------------------------------------------------
    // Events
    // --------------------------------------------------

    event VestingInitialized(
        address indexed token,
        address indexed beneficiary,
        uint256 allocation,
        uint256 start,
        uint256 duration
    );

    event TokensClaimed(
        address indexed beneficiary,
        uint256 amount,
        uint256 timestamp
    );

    // --------------------------------------------------
    // Constructor
    // --------------------------------------------------

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

    // --------------------------------------------------
    // Claim Logic
    // --------------------------------------------------

    /**
     * @notice Claims vested PNJC tokens
     * @dev CEI pattern:
     * Checks → Effects → Interactions
     */
    function claim() external {
        if (msg.sender != beneficiary) revert NotBeneficiary();

        if (block.timestamp < start) {
            revert VestingNotStarted();
        }

        uint256 vested = _vestedAmount(block.timestamp);

        uint256 claimable = vested - claimedAmount;

        if (claimable == 0) revert NothingToClaim();

        claimedAmount = vested;

        token.safeTransfer(
            beneficiary,
            claimable
        );

        emit TokensClaimed(
            beneficiary,
            claimable,
            block.timestamp
        );
    }

    // --------------------------------------------------
    // Views
    // --------------------------------------------------

    function vestedAmount()
        external
        view
        returns (uint256)
    {
        return _vestedAmount(block.timestamp);
    }

    function claimableAmount()
        external
        view
        returns (uint256)
    {
        uint256 vested = _vestedAmount(
            block.timestamp
        );

        return vested - claimedAmount;
    }

    function remainingLocked()
        external
        view
        returns (uint256)
    {
        return totalAllocation - claimedAmount;
    }

    function vestedAt(
        uint256 timestamp
    )
        external
        view
        returns (uint256)
    {
        return _vestedAmount(timestamp);
    }

    // --------------------------------------------------
    // Internal Logic
    // --------------------------------------------------

    /**
     * @notice Deterministic linear vesting curve
     *
     * Before start:
     *     0%
     *
     * After completion:
     *     100%
     *
     * During vesting:
     *     Linear release
     */
    function _vestedAmount(
        uint256 timestamp
    )
        internal
        view
        returns (uint256)
    {
        if (timestamp <= start) {
            return 0;
        }

        if (timestamp >= start + duration) {
            return totalAllocation;
        }

        return
            (totalAllocation *
                (timestamp - start))
            / duration;
    }
}
