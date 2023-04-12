// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// A donut vending machine smart contract, allows anyone to purchase a donut for 1 ETH,
// anybody can see others donut balances and vending machine balance. However,
// only the owner of tht contract can restock the vending machine.

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";

contract VendingMachine {
    using SafeMath for uint256;
    address public owner;
    mapping (address => uint) public donutBalances;

    constructor() {
        owner = msg.sender;
        donutBalances[address(this)] = 100;
    }

    function VendingMachineBalance() public view returns (uint) {
        return donutBalances[address(this)];
    }

    function restock(uint amount) public {
        require(msg.sender == owner, "Only the owner can restock the machine");
        donutBalances[address(this)] += amount;
    }

    function purchase(uint amount) public payable {
        require(msg.value >= amount * 1 ether, "The price is 1 eth per donut");
        require(donutBalances[address(this)] >= amount, "Not enough donuts in stock to fulfill purchase request");
        donutBalances[address(this)] -= amount;
        donutBalances[msg.sender] += amount;
    }
}
