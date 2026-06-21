// SPDX-License-Identifier: MIT
pragma solidity 0.8.34;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

/**

* @title PNJC Treasury Vault
* @notice Institutional-grade treasury custody contract for PNJC ecosystem funds
*
* SECURITY PROPERTIES
* ─────────────────────────────────────────────────────────────
* ✓ No owner
* ✓ No admin privileges
* ✓ No upgradeability
* ✓ Immutable multisig authority
* ✓ SafeERC20 transfers
* ✓ Explicit treasury accounting
* ✓ Full event transparency
* ✓ Compatible with Gnosis Safe multisig
*
* DESIGN PHILOSOPHY
* ─────────────────────────────────────────────────────────────
* This contract intentionally remains minimal.
*
* Governance, approvals, spending policies,
* timelocks and treasury management are expected
* to be enforced at the multisig layer
* (e.g. Gnosis Safe + DAO governance).
*
* AUDIT CLASSIFICATION
* ─────────────────────────────────────────────────────────────
* Institutional-Grade Treasury Custody Primitive
  */
  contract PNJCTreasuryVault {
  using SafeERC20 for IERC20;

  // --------------------------------------------------
  // Custom Errors
  // --------------------------------------------------

  error ZeroAddress();
  error NotAuthorized();
  error InvalidAmount();

  // --------------------------------------------------
  // Immutable State
  // --------------------------------------------------

  /// @notice Treasury controller (Gnosis Safe multisig)
  address public immutable multisig;

  // --------------------------------------------------
  // Events
  // --------------------------------------------------

  event NativeReceived(
  address indexed sender,
  uint256 amount
  );

  event NativeWithdrawn(
  address indexed recipient,
  uint256 amount,
  string purpose
  );

  event ERC20Withdrawn(
  address indexed token,
  address indexed recipient,
  uint256 amount,
  string purpose
  );

  // --------------------------------------------------
  // Constructor
  // --------------------------------------------------

  /**

  * @param _multisig Gnosis Safe multisig address
    */
    constructor(address _multisig) {
    if (_multisig == address(0))
    revert ZeroAddress();

    multisig = _multisig;
    }

  // --------------------------------------------------
  // Modifiers
  // --------------------------------------------------

  modifier onlyMultisig() {
  if (msg.sender != multisig)
  revert NotAuthorized();
  _;
  }

  // --------------------------------------------------
  // Receive Native Assets
  // --------------------------------------------------

  receive() external payable {
  emit NativeReceived(
  msg.sender,
  msg.value
  );
  }

  // --------------------------------------------------
  // Native Asset Withdrawals
  // --------------------------------------------------

  /**

  * @notice Withdraw native currency (MATIC/POL)
  * @param recipient destination address
  * @param amount withdrawal amount
  * @param purpose human-readable accounting note
    */
    function withdrawNative(
    address payable recipient,
    uint256 amount,
    string calldata purpose
    )
    external
    onlyMultisig
    {
    if (recipient == address(0))
    revert ZeroAddress();

    if (amount == 0)
    revert InvalidAmount();

    (bool success, ) = recipient.call{
    value: amount
    }("");

    require(
    success,
    "NATIVE_TRANSFER_FAILED"
    );

    emit NativeWithdrawn(
    recipient,
    amount,
    purpose
    );
    }

  // --------------------------------------------------
  // ERC20 Withdrawals
  // --------------------------------------------------

  /**

  * @notice Withdraw ERC20 tokens
  * @param token ERC20 token address
  * @param recipient destination address
  * @param amount withdrawal amount
  * @param purpose human-readable accounting note
    */
    function withdrawERC20(
    address token,
    address recipient,
    uint256 amount,
    string calldata purpose
    )
    external
    onlyMultisig
    {
    if (token == address(0))
    revert ZeroAddress();

    if (recipient == address(0))
    revert ZeroAddress();

    if (amount == 0)
    revert InvalidAmount();

    IERC20(token).safeTransfer(
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

  // --------------------------------------------------
  // View Functions
  // --------------------------------------------------

  /**

  * @notice Current native asset balance
    */
    function nativeBalance()
    external
    view
    returns (uint256)
    {
    return address(this).balance;
    }

  /**

  * @notice Current ERC20 balance
    */
    function tokenBalance(
    address token
    )
    external
    view
    returns (uint256)
    {
    return IERC20(token).balanceOf(
    address(this)
    );
    }
    }
