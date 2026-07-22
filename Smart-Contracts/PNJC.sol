// SPDX-License-Identifier: MIT

pragma solidity 0.8.36;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";


contract PanjoCoin is ERC20, ERC20Burnable {

    uint256 public constant MAX_SUPPLY = 1_000_000_000_000 ether;


    constructor(address receiver)
        ERC20("PanjoCoin", "PNJC")
    {
        require(
            receiver != address(0),
            "Invalid address"
        );

        _mint(
            receiver,
            MAX_SUPPLY
        );
    }


    function decimals()
        public
        pure
        override
        returns (uint8)
    {
        return 18;
    }


    function totalBurned()
        public
        view
        returns (uint256)
    {
        return MAX_SUPPLY - totalSupply();
    }
}
