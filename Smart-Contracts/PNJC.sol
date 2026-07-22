// SPDX-License-Identifier: MIT
pragma solidity 0.8.36;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

/**
 * @title PanjoCoin (PNJC) – V2
 * @author PanjoCoin Engineering Team
 * @notice Fixed-supply, deflationary ERC-20 token with burn capability.
 * @dev No owner – minting occurs only once at deployment.
 *      No Permit – simple and gas-efficient.
 *      Fully audit-ready with Natspec comments.
 */
contract PanjoCoin is ERC20, ERC20Burnable {

    // ─── Custom Errors (gas-efficient) ──────────────
    error ZeroAddress();
    error SelfTransfer();

    // ─── Public Constants ────────────────────────────
    string public constant NAME = "PanjoCoin";
    string public constant SYMBOL = "PNJC";
    uint8 public constant DECIMALS = 18;

    // ─── Hard cap: 1 Trillion ────────────────────────
    uint256 public constant MAX_SUPPLY = 1_000_000_000_000 * 10**18;

    // ─── Event ────────────────────────────────────────
    event InitialSupplyMinted(address indexed recipient, uint256 amount);

    /**
     * @dev Constructor – mints all tokens to `receiver`.
     * @param receiver Address that will receive the entire supply.
     * @custom:security Reverts if receiver is zero address or the contract itself.
     */
    constructor(address receiver)
        ERC20(NAME, SYMBOL)
    {
        if (receiver == address(0)) revert ZeroAddress();
        if (receiver == address(this)) revert SelfTransfer();

        _mint(receiver, MAX_SUPPLY);
        emit InitialSupplyMinted(receiver, MAX_SUPPLY);
    }

    /**
     * @notice Returns the number of decimals.
     * @return uint8 Always 18.
     */
    function decimals() public pure override returns (uint8) {
        return DECIMALS;
    }

    /**
     * @notice Returns the maximum total supply.
     * @return uint256 The hard cap.
     */
    function maxSupply() external pure returns (uint256) {
        return MAX_SUPPLY;
    }

    /**
     * @notice Returns the total amount of tokens burned so far.
     * @return uint256 Number of burned tokens.
     */
    function totalBurned() external view returns (uint256) {
        unchecked {
            return MAX_SUPPLY - totalSupply();
        }
    }
}
