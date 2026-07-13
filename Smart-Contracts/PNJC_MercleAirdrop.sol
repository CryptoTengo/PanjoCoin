// SPDX-License-Identifier: MIT
pragma solidity ^0.8.34;

// ================================================================
// OpenZeppelin imports (v5.0+)
// ================================================================
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";
import "@openzeppelin/contracts/access/Ownable2Step.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

/**
 * @title PNJCAirdrop
 * @notice Immutable, trustless, gas-efficient Merkle-based airdrop contract for PNJC tokens.
 * @dev Fully compliant with PanjoCoin Whitepaper v1.0, Tokenomics v1.0, and roadmap.
 *
 * ## Key Features
 * - Merkle tree proof verification for claim eligibility.
 * - One‑time claim per address.
 * - Claim period ends at a fixed timestamp (≈3 months after deployment).
 * - Unclaimed tokens are permanently burned (sent to dead address) after the period ends.
 * - Owner (multisig) can only sweep unclaimed tokens after the period; no other privileges.
 *
 * ## Security Model (audit‑ready)
 * - No upgradeability, no hidden functions.
 * - Uses CEI (Checks‑Effects‑Interactions) pattern for reentrancy protection.
 * - SafeERC20 for secure token transfers.
 * - ReentrancyGuard added for defense‑in‑depth.
 * - Owner is a 3/5 multisig (as per project governance).
 *
 * ## Alignment with Documentation
 * - Whitepaper §4.3: "MerkleAirdrop — Gas-efficient token distribution to pre-determined addresses."
 * - Whitepaper §5.2: "MerkleAirdrop — Token distribution via Merkle tree."
 * - Tokenomics §2.2: "Community 8% — Airdrops, referral bonuses ..."
 * - Roadmap: Deployment planned for July 2026 (Q2 2026).
 *
 * @author PanjoCoin Engineering Team
 */
contract PNJCAirdrop is Ownable2Step, ReentrancyGuard {
    using SafeERC20 for IERC20;

    // ================================================================
    // Constants
    // ================================================================

    /// @notice Standard dead address for burning tokens (permanent lock).
    address public constant DEAD_ADDRESS = 0x000000000000000000000000000000000000dEaD;

    // ================================================================
    // Immutable State (set at deployment)
    // ================================================================

    /// @notice The PNJC token contract (ERC20 + Burnable).
    IERC20 public immutable token;

    /// @notice The Merkle root of the distribution tree (derived from off‑chain list).
    bytes32 public immutable merkleRoot;

    /// @notice The timestamp after which claims are no longer allowed.
    /// @dev Designed to be ~3 months from deployment, as per roadmap.
    uint256 public immutable claimEndTime;

    // ================================================================
    // Mutable State
    // ================================================================

    /// @notice Tracks whether an address has already claimed.
    mapping(address => bool) public claimed;

    /// @notice Total amount of tokens successfully claimed (cumulative).
    uint256 public totalClaimed;

    // ================================================================
    // Events
    // ================================================================

    /// @notice Emitted when a user successfully claims tokens.
    event Claimed(address indexed account, uint256 amount);

    /// @notice Emitted when unclaimed tokens are swept and burned (after claimEndTime).
    event UnclaimedSwept(uint256 amount, uint256 timestamp);

    /// @notice Emitted during deployment to confirm the Merkle root.
    event MerkleRootSet(bytes32 root);

    // ================================================================
    // Custom Errors (gas‑optimized)
    // ================================================================

    error ZeroAddress();
    error AlreadyClaimed();
    error InvalidProof();
    error UnauthorizedClaim();
    error ClaimPeriodExpired();
    error ClaimPeriodNotEnded();
    error NoUnclaimedTokens();

    // ================================================================
    // Constructor
    // ================================================================

    /**
     * @notice Deploys the airdrop contract.
     * @param _token Address of the PNJC token (must be non‑zero).
     * @param _merkleRoot The Merkle root of the claim tree.
     * @param _claimEndTime The timestamp after which claims are disabled.
     *                      Should be at least a few seconds in the future.
     * @dev The owner is set to the deployer (typically a multisig) via Ownable2Step.
     */
    constructor(
        address _token,
        bytes32 _merkleRoot,
        uint256 _claimEndTime
    ) Ownable(msg.sender) {
        if (_token == address(0)) revert ZeroAddress();
        if (_merkleRoot == bytes32(0)) revert ZeroAddress();
        if (_claimEndTime <= block.timestamp) revert ClaimPeriodExpired();

        token = IERC20(_token);
        merkleRoot = _merkleRoot;
        claimEndTime = _claimEndTime;

        emit MerkleRootSet(_merkleRoot);
    }

    // ================================================================
    // Claim Logic
    // ================================================================

    /**
     * @notice Claims tokens for a given account using a Merkle proof.
     * @dev Caller must be the account itself (no delegation to prevent front‑running).
     *      The proof is verified against the stored Merkle root.
     *      Uses CEI pattern: checks → effects → interaction.
     * @param account The address entitled to claim.
     * @param amount The amount of tokens allocated.
     * @param proof The Merkle proof (array of bytes32) proving eligibility.
     */
    function claim(
        address account,
        uint256 amount,
        bytes32[] calldata proof
    ) external nonReentrant {
        // ---- Checks ----
        if (msg.sender != account) revert UnauthorizedClaim();
        if (claimed[account]) revert AlreadyClaimed();
        if (block.timestamp >= claimEndTime) revert ClaimPeriodExpired();

        // Verify Merkle proof (leaf = keccak256(abi.encode(account, amount)))
        bytes32 leaf = keccak256(abi.encode(account, amount));
        if (!MerkleProof.verify(proof, merkleRoot, leaf)) {
            revert InvalidProof();
        }

        // ---- Effects ----
        claimed[account] = true;
        totalClaimed += amount;

        // ---- Interaction ----
        token.safeTransfer(account, amount);

        emit Claimed(account, amount);
    }

    // ================================================================
    // Sweep Unclaimed (only owner, after claim period)
    // ================================================================

    /**
     * @notice Burns all unclaimed tokens remaining in the contract.
     * @dev Only callable by the owner (multisig) after the claim period has ended.
     *      This ensures deflation as specified in Tokenomics v1.0.
     *      Tokens are sent to DEAD_ADDRESS (permanent burn).
     */
    function sweepUnclaimed() external onlyOwner nonReentrant {
        // ---- Checks ----
        if (block.timestamp < claimEndTime) revert ClaimPeriodNotEnded();

        uint256 remaining = token.balanceOf(address(this));
        if (remaining == 0) revert NoUnclaimedTokens();

        // ---- Effects ----
        // (No state change besides token transfer; we could store a variable but not needed)

        // ---- Interaction ----
        token.safeTransfer(DEAD_ADDRESS, remaining);

        emit UnclaimedSwept(remaining, block.timestamp);
    }

    // ================================================================
    // View Functions – for transparency and monitoring
    // ================================================================

    /**
     * @notice Returns whether an address has already claimed.
     */
    function hasClaimed(address account) external view returns (bool) {
        return claimed[account];
    }

    /**
     * @notice Returns the total unclaimed token balance in the contract.
     */
    function unclaimedBalance() external view returns (uint256) {
        return token.balanceOf(address(this));
    }

    /**
     * @notice Returns the amount of tokens that can still be claimed
     *         (same as unclaimedBalance, since all remaining are claimable until period ends).
     */
    function remainingClaimable() external view returns (uint256) {
        return token.balanceOf(address(this));
    }

    /**
     * @notice Checks if the claim period is still active.
     */
    function isClaimActive() external view returns (bool) {
        return block.timestamp < claimEndTime;
    }

    /**
     * @notice Returns the claim end time.
     */
    function getClaimEndTime() external view returns (uint256) {
        return claimEndTime;
    }

    // ================================================================
    // Security & Audit Notes (not part of bytecode)
    // ================================================================
    /*
        DESIGN PRINCIPLES:

        1. Single Responsibility: This contract ONLY handles Merkle‑based token claims.
           No other functionality is included.

        2. Immutable & Trustless:
           - The Merkle root and claim end time are set at deployment and never change.
           - No upgrade mechanism (no UUPS, no proxy).
           - Owner can only sweep unclaimed tokens after the claim period; no other controls.

        3. Reentrancy Protection:
           - Both `claim()` and `sweepUnclaimed()` use `nonReentrant`.
           - CEI pattern is followed.

        4. Transparent:
           - All claims are recorded on‑chain (claimed mapping, totalClaimed).
           - Events emitted for every claim and sweep.
           - Balances are publicly queryable.

        THREAT MODEL:

        Protected against:
        - Admin abuse (only sweeping unclaimed tokens after deadline, no minting, no pausing).
        - Reentrancy attacks (nonReentrant + CEI).
        - Invalid claims (Merkle proof verification).
        - Double claims (claimed mapping).
        - Early sweeping (claimEndTime enforced).

        Not protected against:
        - Loss of private keys (users and owner).
        - Vulnerabilities in the underlying token contract.
        - Network-level failures.
    */
}
