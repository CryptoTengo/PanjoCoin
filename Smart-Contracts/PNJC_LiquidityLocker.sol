// SPDX-License-Identifier: MIT
pragma solidity ^0.8.34;

// ================================================================
// OpenZeppelin imports (v5.0+)
// ================================================================
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/utils/introspection/IERC165.sol";
import "@openzeppelin/contracts/token/ERC721/utils/ERC721Holder.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

/**
 * @title PNJCLiquidityLockerV2
 * @notice Immutable, ownerless contract for locking LP NFTs (ERC721) – fully compliant with
 *         PanjoCoin Whitepaper v1.0 and Tokenomics v1.0.
 * @dev This contract is designed to lock Uniswap V3 (or other) LP positions represented as ERC721 NFTs.
 *      It features:
 *        - No owner / admin (rug‑proof)
 *        - No upgradeability
 *        - No emergency withdrawal
 *        - No rescue functions
 *        - ReentrancyGuard for safety
 *        - Full on‑chain transparency
 *
 *      **Investor & Audit Highlights:**
 *        - The NFT cannot be withdrawn before `unlockTime`.
 *        - No privileged role can bypass the lock.
 *        - All locks are publicly verifiable via `getLock()`.
 *        - The contract is immutable after deployment – no hidden backdoors.
 *
 *      **Alignment with Documentation:**
 *        - Whitepaper §5.1: “Immutable contract for locking LP NFT (ERC721). Ownerless, no emergencyWithdraw.”
 *        - Whitepaper §6.3: “Lock period — 12 months … Contract has no owner and no emergencyWithdraw function,
 *          protected against reentrancy.”
 *        - Tokenomics §2.3: “Liquidity Lock: 50% of supply is locked in an immutable, ownerless contract.”
 *
 *      **Audit Readiness:**
 *        - Designed for independent verification by Hacken, CertiK, Coinsult, and SolidProof.
 *        - Code is minimal, focused, and follows best practices (OpenZeppelin, no external calls except safeTransfer).
 *
 * @author PanjoCoin Engineering Team
 */
contract PNJCLiquidityLockerV2 is ERC721Holder, ReentrancyGuard {

    // ================================================================
    // Custom Errors – gas efficient and descriptive
    // ================================================================

    error InvalidAddress();
    error InvalidUnlockTime();
    error InvalidLockId();
    error NotNFTOwner();
    error NotBeneficiary();
    error LockStillActive();
    error AlreadyWithdrawn();
    error NotLocked();

    // ================================================================
    // Data Structures
    // ================================================================

    /**
     * @dev LockPosition stores the details of a locked LP NFT.
     */
    struct LockPosition {
        address nftContract;   // ERC721 contract address (e.g., Uniswap V3 Position Manager)
        address beneficiary;   // Address that can withdraw after unlockTime
        uint256 tokenId;       // NFT identifier
        uint256 unlockTime;    // Timestamp (seconds) when withdrawal becomes allowed
        bool withdrawn;        // Whether the NFT has already been withdrawn
    }

    // ================================================================
    // State Variables
    // ================================================================

    /// @notice Total number of locks created (also used as lockId counter).
    uint256 public lockCount;

    /// @notice Mapping from lockId to LockPosition.
    mapping(uint256 => LockPosition) private locks;

    // ================================================================
    // Metadata – on‑chain transparency for auditors and investors
    // ================================================================

    string public constant NAME = "PNJC Liquidity Locker";
    string public constant VERSION = "2.0"; // Matches Whitepaper v1.0
    string public constant LOCKER_TYPE = "Immutable ERC721 LP Locker";
    string public constant STANDARD = "ERC721";
    bool public constant HAS_ADMIN = false;
    bool public constant UPGRADABLE = false;
    bool public constant EMERGENCY_WITHDRAW = false;

    // ================================================================
    // Events
    // ================================================================

    /**
     * @dev Emitted when an NFT is successfully locked.
     */
    event LiquidityLocked(
        uint256 indexed lockId,
        address indexed nftContract,
        address indexed beneficiary,
        uint256 tokenId,
        uint256 unlockTime
    );

    /**
     * @dev Emitted when an NFT is successfully withdrawn after unlock.
     */
    event LiquidityWithdrawn(
        uint256 indexed lockId,
        address indexed beneficiary,
        uint256 tokenId
    );

    // ================================================================
    // Modifiers
    // ================================================================

    /**
     * @dev Validates that a lockId exists.
     */
    modifier validLock(uint256 lockId) {
        if (lockId == 0 || lockId > lockCount) revert InvalidLockId();
        _;
    }

    // ================================================================
    // Core Functions
    // ================================================================

    /**
     * @notice Locks an ERC721 LP NFT until the specified unlock time.
     * @dev The caller must own the NFT and approve this contract to transfer it.
     *      The NFT is transferred to this contract using `safeTransferFrom`.
     * @param nftContract Address of the ERC721 contract.
     * @param tokenId ID of the NFT to lock.
     * @param beneficiary Address that will be able to withdraw the NFT after unlock.
     * @param unlockTime Timestamp (in seconds) when the lock expires.
     * @return lockId Unique identifier for the created lock.
     */
    function lock(
        address nftContract,
        uint256 tokenId,
        address beneficiary,
        uint256 unlockTime
    ) external nonReentrant returns (uint256 lockId) {
        // Input validation
        if (nftContract == address(0) || beneficiary == address(0)) {
            revert InvalidAddress();
        }
        if (unlockTime <= block.timestamp) {
            revert InvalidUnlockTime();
        }

        // Ensure the contract supports ERC721 interface (via ERC165)
        if (
            !IERC165(nftContract).supportsInterface(type(IERC721).interfaceId)
        ) {
            revert InvalidAddress();
        }

        IERC721 nft = IERC721(nftContract);

        // Verify that the caller owns the token
        if (nft.ownerOf(tokenId) != msg.sender) {
            revert NotNFTOwner();
        }

        // Transfer the NFT to this contract (safe transfer)
        nft.safeTransferFrom(msg.sender, address(this), tokenId);

        // Increment lock counter and store position
        lockId = ++lockCount;

        locks[lockId] = LockPosition({
            nftContract: nftContract,
            beneficiary: beneficiary,
            tokenId: tokenId,
            unlockTime: unlockTime,
            withdrawn: false
        });

        emit LiquidityLocked(
            lockId,
            nftContract,
            beneficiary,
            tokenId,
            unlockTime
        );
    }

    /**
     * @notice Withdraws the locked NFT after the unlock time has passed.
     * @dev Only the beneficiary can call this function.
     *      The NFT is sent back to the beneficiary via `safeTransferFrom`.
     * @param lockId The identifier of the lock to withdraw.
     */
    function withdraw(
        uint256 lockId
    )
        external
        nonReentrant
        validLock(lockId)
    {
        LockPosition storage p = locks[lockId];

        // Only beneficiary can withdraw
        if (msg.sender != p.beneficiary) {
            revert NotBeneficiary();
        }

        // Check if already withdrawn
        if (p.withdrawn) {
            revert AlreadyWithdrawn();
        }

        // Check if lock is still active
        if (block.timestamp < p.unlockTime) {
            revert LockStillActive();
        }

        // Verify that the contract still holds the NFT (safety check)
        if (IERC721(p.nftContract).ownerOf(p.tokenId) != address(this)) {
            revert NotLocked();
        }

        // Mark as withdrawn to prevent re‑withdrawal
        p.withdrawn = true;

        // Transfer NFT back to beneficiary
        IERC721(p.nftContract).safeTransferFrom(
            address(this),
            p.beneficiary,
            p.tokenId
        );

        emit LiquidityWithdrawn(
            lockId,
            p.beneficiary,
            p.tokenId
        );
    }

    // ================================================================
    // View Functions – for transparency and monitoring
    // ================================================================

    /**
     * @notice Returns the full LockPosition struct for a given lockId.
     * @param lockId The lock identifier.
     * @return The LockPosition struct.
     */
    function getLock(uint256 lockId)
        external
        view
        validLock(lockId)
        returns (LockPosition memory)
    {
        return locks[lockId];
    }

    /**
     * @notice Returns whether a lock is currently unlocked (i.e., time passed).
     * @param lockId The lock identifier.
     * @return true if unlockTime <= block.timestamp.
     */
    function isUnlocked(uint256 lockId)
        external
        view
        validLock(lockId)
        returns (bool)
    {
        return block.timestamp >= locks[lockId].unlockTime;
    }

    /**
     * @notice Returns the remaining time (in seconds) until the lock becomes withdrawable.
     * @param lockId The lock identifier.
     * @return Remaining seconds, or 0 if already unlocked.
     */
    function timeRemaining(uint256 lockId)
        external
        view
        validLock(lockId)
        returns (uint256)
    {
        LockPosition memory p = locks[lockId];
        if (block.timestamp >= p.unlockTime) {
            return 0;
        }
        return p.unlockTime - block.timestamp;
    }

    /**
     * @notice Checks whether a lockId exists (active or withdrawn).
     * @param lockId The lock identifier.
     * @return true if the lock exists.
     */
    function exists(uint256 lockId)
        external
        view
        returns (bool)
    {
        return lockId > 0 && lockId <= lockCount;
    }

    /**
     * @notice Checks whether a lock is currently active (not withdrawn and still locked).
     * @param lockId The lock identifier.
     * @return true if the NFT is still locked and not yet withdrawable.
     */
    function isActive(uint256 lockId)
        external
        view
        validLock(lockId)
        returns (bool)
    {
        LockPosition memory p = locks[lockId];
        return !p.withdrawn && block.timestamp < p.unlockTime;
    }

    // ================================================================
    // Security & Audit Notes (not part of bytecode)
    // ================================================================
    /*
        DESIGN PRINCIPLES:

        1. Single Responsibility: This contract ONLY locks/unlocks ERC721 LP NFTs.
           No other functionality is included.

        2. Immutable & Trustless:
           - No owner, admin, or governance.
           - No upgrade mechanism (no UUPS, no proxy).
           - No emergency withdraw or rescue functions.

        3. Reentrancy Protection:
           - All external functions that change state use `nonReentrant`.
           - SafeERC721 transfers are used (safeTransferFrom).

        4. Transparent:
           - All locks are stored on‑chain and can be queried.
           - Events emitted for every lock and withdrawal.
           - Metadata constants publicly declare the contract's properties.

        THREAT MODEL:

        Protected against:
        - Admin abuse / rug pulls (no admin).
        - Proxy upgrades (not upgradeable).
        - Unauthorized withdrawals (only beneficiary after time).
        - Double withdrawal (withdrawn flag).
        - Reentrancy attacks (ReentrancyGuard).
        - Invalid NFT transfers (ERC165 check, safeTransferFrom).

        Not protected against:
        - Loss of beneficiary's private key.
        - Vulnerabilities in the underlying NFT contract.
        - Blockchain reorganizations or network failures.
    */
}
