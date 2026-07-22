// SPDX-License-Identifier: MIT
pragma solidity 0.8.36;


// ================================================================
// OpenZeppelin Contracts v5.x
// ================================================================

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import {MerkleProof} from "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";
import {Ownable2Step, Ownable} from "@openzeppelin/contracts/access/Ownable2Step.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/utils/ReentrancyGuard.sol";



/**
 * @title PNJCMerkleAirdrop
 * @author PanjoCoin Engineering Team
 *
 * @notice
 * Gas-efficient Merkle Tree based airdrop distributor
 * for PanjoCoin (PNJC).
 *
 *
 * @dev
 * Security architecture:
 *
 * - Immutable Merkle Root
 * - Immutable claim deadline
 * - No token minting
 * - No allocation modification
 * - One claim per wallet
 * - SafeERC20 transfers
 * - Reentrancy protection
 *
 *
 * Governance:
 *
 * Owner exists ONLY for:
 *
 * - Burning remaining unclaimed tokens
 *   after claim period expiration.
 *
 *
 * Owner CANNOT:
 *
 * - Change Merkle root
 * - Change claim amount
 * - Withdraw active airdrop funds
 * - Pause claims
 * - Mint tokens
 *
 *
 * Compatible with:
 *
 * PanjoCoin ERC20 V2
 * Solidity 0.8.36
 * OpenZeppelin Contracts v5
 */
contract PNJCMerkleAirdrop is Ownable2Step, ReentrancyGuard {


    using SafeERC20 for IERC20;



    // =============================================================
    // CONSTANTS
    // =============================================================


    /**
     * @notice Dead address used for permanent token burn.
     */
    address public constant DEAD_ADDRESS =
        0x000000000000000000000000000000000000dEaD;




    // =============================================================
    // IMMUTABLE STATE
    // =============================================================


    /**
     * @notice PNJC ERC20 token.
     */
    IERC20 public immutable token;



    /**
     * @notice Merkle Tree root.
     *
     * Generated off-chain from:
     *
     * keccak256(
     * abi.encode(wallet, amount)
     * )
     */
    bytes32 public immutable merkleRoot;



    /**
     * @notice Timestamp when claims end.
     */
    uint256 public immutable claimEndTime;




    // =============================================================
    // MUTABLE STATE
    // =============================================================


    /**
     * @notice Tracks claimed wallets.
     */
    mapping(address => bool) public claimed;



    /**
     * @notice Total claimed amount.
     */
    uint256 public totalClaimed;





    // =============================================================
    // EVENTS
    // =============================================================


    event Claimed(
        address indexed account,
        uint256 amount
    );


    event UnclaimedTokensBurned(
        uint256 amount
    );





    // =============================================================
    // ERRORS
    // =============================================================


    error ZeroAddress();

    error InvalidMerkleRoot();

    error InvalidClaimEndTime();

    error AlreadyClaimed();

    error InvalidProof();

    error ClaimExpired();

    error ClaimStillActive();

    error NothingToBurn();

    error Unauthorized();





    // =============================================================
    // CONSTRUCTOR
    // =============================================================


    /**
     * @notice Deploys Merkle airdrop contract.
     *
     * @param _token PNJC token address.
     * @param _merkleRoot Generated Merkle root.
     * @param _claimEndTime Claim expiration timestamp.
     *
     * @dev
     * Owner should be transferred to:
     *
     * Gnosis Safe multisig
     */
    constructor(
        address _token,
        bytes32 _merkleRoot,
        uint256 _claimEndTime
    )
        Ownable(msg.sender)
    {


        if(_token == address(0))
            revert ZeroAddress();


        if(_merkleRoot == bytes32(0))
            revert InvalidMerkleRoot();


        if(_claimEndTime <= block.timestamp)
            revert InvalidClaimEndTime();



        token = IERC20(_token);

        merkleRoot = _merkleRoot;

        claimEndTime = _claimEndTime;

    }





    // =============================================================
    // CLAIM FUNCTION
    // =============================================================


    /**
     * @notice Claims allocated PNJC tokens.
     *
     * @param account Eligible wallet.
     * @param amount Allocated amount.
     * @param proof Merkle proof.
     *
     *
     * Leaf calculation:
     *
     * keccak256(
     * abi.encode(account, amount)
     * )
     */
    function claim(
        address account,
        uint256 amount,
        bytes32[] calldata proof
    )
        external
        nonReentrant
    {


        if(msg.sender != account)
            revert Unauthorized();



        if(claimed[account])
            revert AlreadyClaimed();



        if(block.timestamp >= claimEndTime)
            revert ClaimExpired();




        bytes32 leaf =
            keccak256(
                abi.encode(
                    account,
                    amount
                )
            );



        if(
            !MerkleProof.verify(
                proof,
                merkleRoot,
                leaf
            )
        )
        {
            revert InvalidProof();
        }



        claimed[account] = true;



        totalClaimed += amount;



        token.safeTransfer(
            account,
            amount
        );



        emit Claimed(
            account,
            amount
        );
    }





    // =============================================================
    // BURN REMAINING TOKENS
    // =============================================================


    /**
     * @notice Burns remaining unclaimed PNJC.
     *
     * @dev
     * Available only after claim deadline.
     *
     * Tokens are sent to DEAD_ADDRESS.
     */
    function burnUnclaimed()
        external
        onlyOwner
        nonReentrant
    {


        if(block.timestamp < claimEndTime)
            revert ClaimStillActive();



        uint256 balance =
            token.balanceOf(
                address(this)
            );



        if(balance == 0)
            revert NothingToBurn();



        token.safeTransfer(
            DEAD_ADDRESS,
            balance
        );



        emit UnclaimedTokensBurned(
            balance
        );
    }





    // =============================================================
    // VIEW FUNCTIONS
    // =============================================================


    /**
     * @notice Checks if wallet claimed.
     */
    function hasClaimed(
        address account
    )
        external
        view
        returns(bool)
    {

        return claimed[account];
    }




    /**
     * @notice Remaining tokens in contract.
     */
    function remainingTokens()
        external
        view
        returns(uint256)
    {

        return token.balanceOf(
            address(this)
        );
    }




    /**
     * @notice Checks if claim period is active.
     */
    function isClaimActive()
        external
        view
        returns(bool)
    {

        return block.timestamp < claimEndTime;
    }




    /**
     * @notice Returns remaining claim time.
     */
    function timeRemaining()
        external
        view
        returns(uint256)
    {

        if(block.timestamp >= claimEndTime)
            return 0;


        return claimEndTime - block.timestamp;
    }


}
