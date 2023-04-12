// SPDX-License-Identifier: MIT

// Basic ERC20-Token Smart Contract that allows the user to name their token, approve transactions,
// transfer between accounts, increase/decrease allowances, and also check balances

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MistyToken is ERC20 {

    constructor (string memory name, string memory symbol) ERC20(name, symbol) public {
        // 1.00 USD = 100 cents (2 decimals)
        // 1 Ether = 10 ** 18 Wei (18 decimals)
        _mint(msg.sender, 100 * 10 ** uint(decimals()));
    }
}
