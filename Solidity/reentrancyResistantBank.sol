// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// A reentrancy resistant bank smart contract

import "@openzeppelin/contracts/utils/Address.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";

// 1. import ReentrancyGuard.sol
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

// 2. contract inherits from ReentrancyGuard
contract Bank is ReentrancyGuard{
    using SafeMath for uint256;
    using Address for address payable;

    mapping(address => uint256) public balanceOf;

    function deposit() external payable {
        balanceOf[msg.sender] += msg.value;
    }

    // 3. attach nonReentrant for protection against reentrancy
    function withdraw() external nonReentrant{
        uint256 depositedAmount = balanceOf[msg.sender];
        payable(msg.sender).sendValue(depositedAmount);
        balanceOf[msg.sender] = 0;
    }

    function TotalBankBalance() public view returns(uint256){
        return address(this).balance;
    }
}
