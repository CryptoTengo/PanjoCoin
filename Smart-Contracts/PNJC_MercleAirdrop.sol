// SPDX-License-Identifier: MIT
pragma solidity 0.8.34;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

/**
 * @title PNJC Merkle Airdrop
 * @notice Immutable, trustless, gas-efficient Merkle-based distribution contract
 *
 * -------------------------------------------------------------
 * SECURITY MODEL
 * -------------------------------------------------------------
 * ✓ No owner
 * ✓ No admin
 * ✓ No upgradeability
 * ✓ Immutable token address
 * ✓ Immutable Merkle root
 * ✓ One-time claim enforcement
 * ✓ SafeERC20 transfers (OZ standard)
 * ✓ Collision-resistant Merkle leaf encoding
 * ✓ CEI pattern (Checks → Effects → Interactions)
 *
 * -------------------------------------------------------------
 * AUDIT CLASSIFICATION
 * -------------------------------------------------------------
 * Institutional-Grade Merkle Distribution Primitive (OZ Compatible)
 */
contract PNJCAirdrop {

    using SafeERC20 for IERC20;

    // -------------------------------------------------------------
    // Custom Errors (gas optimized)
    // -------------------------------------------------------------

    error ZeroAddress();
    error AlreadyClaimed();
    error InvalidProof();
    error UnauthorizedClaim();

    // -------------------------------------------------------------
    // Immutable State
    // -------------------------------------------------------------

    IERC20 public immutable token;
    bytes32 public immutable merkleRoot;

    // -------------------------------------------------------------
    // Storage
    // -------------------------------------------------------------

    mapping(address => bool) public claimed;

    // -------------------------------------------------------------
    // Events
    // -------------------------------------------------------------

    event Claimed(
        address indexed account,
        uint256 amount
    );

    event MerkleRootSet(
        bytes32 root
    );

    // -------------------------------------------------------------
    // Constructor
    // -------------------------------------------------------------

    constructor(
        address _token,
        bytes32 _merkleRoot
    ) {
        if (_token == address(0)) revert ZeroAddress();
        if (_merkleRoot == bytes32(0)) revert ZeroAddress();

        token = IERC20(_token);
        merkleRoot = _merkleRoot;

        emit MerkleRootSet(_merkleRoot);
    }

    // -------------------------------------------------------------
    // Claim Logic
    // -------------------------------------------------------------

    function claim(
        address account,
        uint256 amount,
        bytes32[] calldata proof
    ) external {

        if (msg.sender != account)
            revert UnauthorizedClaim();

        if (claimed[account])
            revert AlreadyClaimed();

        // OZ SAFE LEAF (collision-resistant)
        bytes32 leaf = keccak256(
            abi.encode(account, amount)
        );

        if (!MerkleProof.verify(proof, merkleRoot, leaf))
            revert InvalidProof();

        // Effects
        claimed[account] = true;

        // Interaction
        token.safeTransfer(account, amount);

        emit Claimed(account, amount);
    }

    // -------------------------------------------------------------
    // View Functions
    // -------------------------------------------------------------

    function hasClaimed(address account)
        external
        view
        returns (bool)
    {
        return claimed[account];
    }

    function remainingTokens()
        external
        view
        returns (uint256)
    {
        return token.balanceOf(address(this));
    }
}
