// SPDX-License-Identifier: MIT
pragma solidity 0.8.36;

import "@openzeppelin/contracts@5.5.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@5.5.0/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts@5.5.0/token/ERC20/extensions/ERC20Permit.sol";

/// @title PanjoCoin
/// @notice Immutable fixed-supply ERC20 utility token
contract PanjoCoin is ERC20, ERC20Burnable, ERC20Permit {
    uint256 public constant MAX_SUPPLY = 1_000_000_000_000 * 10 ** 18;

    event InitialSupplyMinted(address indexed receiver, uint256 amount);

    constructor(address receiver)
        ERC20("PanjoCoin", "PNJC")
        ERC20Permit("PanjoCoin")
    {
        require(receiver != address(0), "Zero address");
        _mint(receiver, MAX_SUPPLY);
        emit InitialSupplyMinted(receiver, MAX_SUPPLY);
    }

    function maxSupply() external pure returns (uint256) {
        return MAX_SUPPLY;
    }

    function totalBurned() external view returns (uint256) {
        return MAX_SUPPLY - totalSupply();
    }
}
