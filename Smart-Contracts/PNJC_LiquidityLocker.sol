// SPDX-License-Identifier: MIT
pragma solidity 0.8.34;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC721/utils/ERC721Holder.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

/**
 * @title PNJC Liquidity Locker V2
 *
 * @notice
 * Immutable liquidity lock contract designed for
 * Uniswap V3 / QuickSwap V3 LP Position NFTs.
 *
 * --------------------------------------------------------------------
 * SECURITY MODEL
 * --------------------------------------------------------------------
 * • No owner
 * • No admin privileges
 * • No upgradeability
 * • No emergency withdrawal
 * • No rescue functions
 * • Immutable lock conditions
 * • Reentrancy protection
 * • Deterministic release logic
 *
 * --------------------------------------------------------------------
 * UNISWAP V3 FLOW
 * --------------------------------------------------------------------
 * 1. Deploy locker
 * 2. Create liquidity pool
 * 3. Add liquidity
 * 4. Receive LP NFT
 * 5. Call lock()
 * 6. NFT remains locked until unlock timestamp
 * 7. Beneficiary withdraws after unlock
 *
 * --------------------------------------------------------------------
 * AUDIT CLASSIFICATION
 * --------------------------------------------------------------------
 * "Institutional-Grade LP NFT Lock Primitive"
 */
contract PNJCLiquidityLocker is ERC721Holder, ReentrancyGuard {

    struct LockPosition {
        address nftContract;
        address beneficiary;
        uint256 tokenId;
        uint256 unlockTime;
        bool withdrawn;
    }

    /// @notice Total number of created locks
    uint256 public lockCount;

    /// @notice lockId => position
    mapping(uint256 => LockPosition) public locks;

    event LiquidityLocked(
        uint256 indexed lockId,
        address indexed nftContract,
        address indexed beneficiary,
        uint256 tokenId,
        uint256 unlockTime
    );

    event LiquidityWithdrawn(
        uint256 indexed lockId,
        address indexed beneficiary,
        uint256 tokenId
    );

    /**
     * @notice Locks a Uniswap V3 LP NFT
     *
     * @param nftContract Uniswap V3 Position Manager NFT contract
     * @param tokenId LP NFT token ID
     * @param beneficiary Receiver after unlock
     * @param unlockTime Unlock timestamp
     *
     * Requirements:
     * - caller must own NFT
     * - caller must approve locker
     * - unlockTime must be in future
     */
    function lock(
        address nftContract,
        uint256 tokenId,
        address beneficiary,
        uint256 unlockTime
    ) external nonReentrant returns (uint256 lockId) {

        require(nftContract != address(0), "NFT_ZERO");
        require(beneficiary != address(0), "BENEFICIARY_ZERO");
        require(unlockTime > block.timestamp, "INVALID_UNLOCK");

        IERC721 nft = IERC721(nftContract);

        require(
            nft.ownerOf(tokenId) == msg.sender,
            "NOT_NFT_OWNER"
        );

        nft.safeTransferFrom(
            msg.sender,
            address(this),
            tokenId
        );

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
     * @notice Withdraw LP NFT after unlock
     *
     * Requirements:
     * - only beneficiary
     * - unlock time reached
     * - not withdrawn before
     */
    function withdraw(
        uint256 lockId
    ) external nonReentrant {

        LockPosition storage position = locks[lockId];

        require(
            msg.sender == position.beneficiary,
            "NOT_BENEFICIARY"
        );

        require(
            !position.withdrawn,
            "ALREADY_WITHDRAWN"
        );

        require(
            block.timestamp >= position.unlockTime,
            "LOCKED"
        );

        position.withdrawn = true;

        IERC721(position.nftContract).safeTransferFrom(
            address(this),
            position.beneficiary,
            position.tokenId
        );

        emit LiquidityWithdrawn(
            lockId,
            position.beneficiary,
            position.tokenId
        );
    }

    /**
     * @notice Returns remaining lock duration
     */
    function timeRemaining(
        uint256 lockId
    ) external view returns (uint256) {

        LockPosition memory position = locks[lockId];

        if (block.timestamp >= position.unlockTime) {
            return 0;
        }

        return position.unlockTime - block.timestamp;
    }

    /**
     * @notice Returns lock status
     */
    function isUnlocked(
        uint256 lockId
    ) external view returns (bool) {

        return block.timestamp >= locks[lockId].unlockTime;
    }

    /**
     * @notice Returns lock details
     */
    function getLock(
        uint256 lockId
    )
        external
        view
        returns (
            address nftContract,
            address beneficiary,
            uint256 tokenId,
            uint256 unlockTime,
            bool withdrawn
        )
    {
        LockPosition memory position = locks[lockId];

        return (
            position.nftContract,
            position.beneficiary,
            position.tokenId,
            position.unlockTime,
            position.withdrawn
        );
    }
}
