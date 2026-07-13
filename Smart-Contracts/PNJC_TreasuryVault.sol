// SPDX-License-Identifier: MIT
pragma solidity ^0.8.34;

// ================================================================
// OpenZeppelin imports (v5.0+)
// ================================================================
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

/**
 * @title PNJCTreasuryVault
 * @notice Institutional‑grade treasury custody contract for PNJC ecosystem funds.
 * @dev Fully compliant with PanjoCoin Whitepaper v1.0 and Tokenomics v1.0.
 *
 * ## Design Overview
 * - The contract is a simple, immutable treasury that holds native (MATIC/POL) and ERC20 tokens.
 * - It is controlled by a multisig wallet (Gnosis Safe) which acts as the sole authorized signer.
 * - No owner, no admin, no upgradeability — the multisig address is set at deployment and never changes.
 * - All withdrawals require a human‑readable `purpose` string for full transparency and accounting.
 *
 * ## Governance Alignment
 * - Whitepaper §6.2: "Treasury 12% — Multisig 3/5 (organizational control)"
 * - Tokenomics §5.2: "Multisig Wallets … key decisions are managed by a 3/5 multisig."
 * - The contract itself does not enforce DAO voting; that is handled at the multisig layer.
 *
 * ## Security & Audit Highlights
 * - **Immutable Authority:** The `multisig` address is immutable — no one can change it.
 * - **Reentrancy Protection:** All withdrawal functions use `nonReentrant` to prevent reentrancy attacks.
 * - **SafeERC20:** All ERC20 transfers use SafeERC20 to guard against non‑standard tokens.
 * - **No Hidden Functions:** The contract has no admin, no upgrade, no backdoors.
 * - **Full Transparency:** Every withdrawal emits an event with a `purpose` string for on‑chain accountability.
 *
 * @author PanjoCoin Engineering Team
 */
contract PNJCTreasuryVault is ReentrancyGuard {
    using SafeERC20 for IERC20;

    // ================================================================
    // Custom Errors (gas‑optimized)
    // ================================================================

    error ZeroAddress();
    error NotAuthorized();
    error InvalidAmount();
    error NativeTransferFailed();

    // ================================================================
    // Immutable State
    // ================================================================

    /// @notice The multisig wallet that controls this treasury (Gnosis Safe, 3/5).
    address public immutable multisig;

    // ================================================================
    // Events
    // ================================================================

    /// @notice Emitted when native currency (MATIC/POL) is received.
    event NativeReceived(address indexed sender, uint256 amount);

    /// @notice Emitted when native currency is withdrawn by the multisig.
    event NativeWithdrawn(
        address indexed recipient,
        uint256 amount,
        string purpose
    );

    /// @notice Emitted when an ERC20 token is withdrawn by the multisig.
    event ERC20Withdrawn(
        address indexed token,
        address indexed recipient,
        uint256 amount,
        string purpose
    );

    // ================================================================
    // Constructor
    // ================================================================

    /**
     * @notice Sets the multisig address that will control the treasury.
     * @param _multisig The Gnosis Safe multisig address (must be non‑zero).
     */
    constructor(address _multisig) {
        if (_multisig == address(0)) revert ZeroAddress();
        multisig = _multisig;
    }

    // ================================================================
    // Modifiers
    // ================================================================

    /**
     * @dev Restricts function calls to the immutable multisig address.
     */
    modifier onlyMultisig() {
        if (msg.sender != multisig) revert NotAuthorized();
        _;
    }

    // ================================================================
    // Receive Native Assets
    // ================================================================

    /**
     * @notice Accepts native currency (MATIC/POL) deposits.
     * @dev Emits an event for tracking incoming funds.
     */
    receive() external payable {
        emit NativeReceived(msg.sender, msg.value);
    }

    // ================================================================
    // Withdrawal Functions (only multisig)
    // ================================================================

    /**
     * @notice Withdraws native currency (MATIC/POL) to a specified recipient.
     * @param recipient The address to receive the native tokens.
     * @param amount The amount to withdraw (in wei).
     * @param purpose A human‑readable reason for the withdrawal (for transparency).
     */
    function withdrawNative(
        address payable recipient,
        uint256 amount,
        string calldata purpose
    ) external nonReentrant onlyMultisig {
        if (recipient == address(0)) revert ZeroAddress();
        if (amount == 0) revert InvalidAmount();
        if (bytes(purpose).length == 0) revert InvalidAmount(); // purpose must be non‑empty

        (bool success, ) = recipient.call{value: amount}("");
        if (!success) revert NativeTransferFailed();

        emit NativeWithdrawn(recipient, amount, purpose);
    }

    /**
     * @notice Withdraws ERC20 tokens to a specified recipient.
     * @param token The address of the ERC20 token.
     * @param recipient The address to receive the tokens.
     * @param amount The amount to withdraw.
     * @param purpose A human‑readable reason for the withdrawal (for transparency).
     */
    function withdrawERC20(
        address token,
        address recipient,
        uint256 amount,
        string calldata purpose
    ) external nonReentrant onlyMultisig {
        if (token == address(0)) revert ZeroAddress();
        if (recipient == address(0)) revert ZeroAddress();
        if (amount == 0) revert InvalidAmount();
        if (bytes(purpose).length == 0) revert InvalidAmount();

        IERC20(token).safeTransfer(recipient, amount);

        emit ERC20Withdrawn(token, recipient, amount, purpose);
    }

    // ================================================================
    // View Functions – for transparency and monitoring
    // ================================================================

    /**
     * @notice Returns the current native currency balance of the treasury.
     */
    function nativeBalance() external view returns (uint256) {
        return address(this).balance;
    }

    /**
     * @notice Returns the current ERC20 token balance of the treasury.
     * @param token The address of the ERC20 token.
     */
    function tokenBalance(address token) external view returns (uint256) {
        return IERC20(token).balanceOf(address(this));
    }

    // ================================================================
    // Security & Audit Notes (not part of bytecode)
    // ================================================================
    /*
        DESIGN PRINCIPLES:

        1. **Immutable Authority:** The multisig address is set once and never changes.
           This prevents any single individual from seizing control.

        2. **Minimal Attack Surface:** The contract has no upgradeability, no admin functions,
           and no ability to alter its own logic.

        3. **Reentrancy Protection:** All withdrawal functions are protected with `nonReentrant`.

        4. **Transparent Accounting:** Every withdrawal includes a `purpose` string, emitted
           in events for on‑chain auditing. All balances are publicly viewable.

        THREAT MODEL:

        Protected against:
        - Unauthorized withdrawals (only multisig can execute).
        - Reentrancy attacks (nonReentrant + CEI pattern).
        - Loss of funds due to non‑standard ERC20 tokens (SafeERC20).
        - Admin abuse (no owner, no upgrade).

        Not protected against:
        - Compromise of the multisig wallet (multisig governance is external).
        - Vulnerabilities in the underlying token contracts.
        - Network‑level attacks.
    */
}
