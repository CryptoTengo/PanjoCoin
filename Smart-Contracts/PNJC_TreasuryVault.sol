// SPDX-License-Identifier: MIT
pragma solidity 0.8.36;


// ================================================================
// OpenZeppelin Contracts v5.x
// ================================================================

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/utils/ReentrancyGuard.sol";



/**
 * @title PNJCTreasuryVault
 * @author PanjoCoin Engineering Team
 *
 * @notice Immutable treasury vault for PanjoCoin ecosystem funds.
 *
 * @dev
 * Designed for institutional-grade treasury custody.
 *
 * The contract stores:
 *
 * - PNJC tokens
 * - Stablecoins (USDT/USDC)
 * - Other ERC20 assets
 * - Native Polygon currency (POL/MATIC)
 *
 *
 * SECURITY MODEL:
 *
 * - No owner
 * - No admin
 * - No upgradeability
 * - No proxy
 * - No minting capability
 * - No token freezing capability
 * - Immutable multisig authority
 *
 *
 * GOVERNANCE:
 *
 * Recommended controller:
 *
 * Gnosis Safe multisig
 * Example:
 * 3/5 or 4/7 signers
 *
 *
 * Compatible with:
 *
 * PanjoCoin ERC20 V2
 * Solidity 0.8.36
 * OpenZeppelin v5
 */
contract PNJCTreasuryVault is ReentrancyGuard {


    using SafeERC20 for IERC20;



    // =============================================================
    // ERRORS
    // =============================================================


    error ZeroAddress();

    error Unauthorized();

    error InvalidAmount();

    error TransferFailed();

    error EmptyPurpose();



    // =============================================================
    // IMMUTABLE STATE
    // =============================================================


    /**
     * @notice Immutable treasury controller.
     *
     * Recommended:
     * Gnosis Safe multisig wallet.
     */
    address public immutable multisig;



    // =============================================================
    // EVENTS
    // =============================================================


    /**
     * @notice Emitted when native currency is received.
     */
    event NativeReceived(
        address indexed sender,
        uint256 amount
    );


    /**
     * @notice Emitted when native currency is withdrawn.
     */
    event NativeWithdrawn(
        address indexed recipient,
        uint256 amount,
        string purpose
    );


    /**
     * @notice Emitted when ERC20 tokens are withdrawn.
     */
    event ERC20Withdrawn(
        address indexed token,
        address indexed recipient,
        uint256 amount,
        string purpose
    );



    // =============================================================
    // CONSTRUCTOR
    // =============================================================


    /**
     * @notice Initializes treasury vault.
     *
     * @param _multisig Multisig wallet controlling withdrawals.
     */
    constructor(
        address _multisig
    )
    {

        if(_multisig == address(0))
            revert ZeroAddress();


        if(_multisig == address(this))
            revert ZeroAddress();


        multisig = _multisig;
    }



    // =============================================================
    // MODIFIERS
    // =============================================================


    /**
     * @dev Restricts access only to immutable multisig.
     */
    modifier onlyMultisig()
    {

        if(msg.sender != multisig)
            revert Unauthorized();

        _;
    }




    // =============================================================
    // RECEIVE POL / MATIC
    // =============================================================


    /**
     * @notice Accepts native Polygon currency.
     *
     * Polygon PoS:
     * POL (previously MATIC)
     */
    receive()
        external
        payable
    {

        emit NativeReceived(
            msg.sender,
            msg.value
        );
    }




    // =============================================================
    // WITHDRAW NATIVE TOKEN
    // =============================================================


    /**
     * @notice Withdraws native Polygon currency.
     *
     * @param recipient Destination wallet.
     * @param amount Amount in wei.
     * @param purpose Human-readable accounting reason.
     *
     * @dev
     * Only multisig can execute.
     */
    function withdrawNative(
        address payable recipient,
        uint256 amount,
        string calldata purpose
    )
        external
        nonReentrant
        onlyMultisig
    {

        if(recipient == address(0))
            revert ZeroAddress();


        if(amount == 0)
            revert InvalidAmount();


        if(bytes(purpose).length == 0)
            revert EmptyPurpose();



        (bool success,) =
            recipient.call{
                value: amount
            }("");



        if(!success)
            revert TransferFailed();



        emit NativeWithdrawn(
            recipient,
            amount,
            purpose
        );
    }





    // =============================================================
    // WITHDRAW ERC20
    // =============================================================


    /**
     * @notice Withdraws ERC20 tokens.
     *
     * Supports:
     *
     * - PNJC
     * - USDT
     * - USDC
     * - Other ERC20 assets
     *
     * @param token ERC20 token address.
     * @param recipient Destination wallet.
     * @param amount Amount to withdraw.
     * @param purpose Accounting description.
     */
    function withdrawERC20(
        address token,
        address recipient,
        uint256 amount,
        string calldata purpose
    )
        external
        nonReentrant
        onlyMultisig
    {

        if(token == address(0))
            revert ZeroAddress();


        if(recipient == address(0))
            revert ZeroAddress();


        if(amount == 0)
            revert InvalidAmount();


        if(bytes(purpose).length == 0)
            revert EmptyPurpose();



        IERC20(token)
            .safeTransfer(
                recipient,
                amount
            );



        emit ERC20Withdrawn(
            token,
            recipient,
            amount,
            purpose
        );
    }





    // =============================================================
    // VIEW FUNCTIONS
    // =============================================================


    /**
     * @notice Returns native POL/MATIC balance.
     */
    function nativeBalance()
        external
        view
        returns(uint256)
    {

        return address(this).balance;
    }



    /**
     * @notice Returns ERC20 balance.
     *
     * @param token ERC20 address.
     */
    function tokenBalance(
        address token
    )
        external
        view
        returns(uint256)
    {

        return IERC20(token)
            .balanceOf(address(this));
    }



    /**
     * @notice Checks if address is treasury multisig.
     */
    function isMultisig(
        address account
    )
        external
        view
        returns(bool)
    {

        return account == multisig;
    }

}
