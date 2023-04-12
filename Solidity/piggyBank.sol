
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Piggy Bank Smart Contract that allows anybody to deposit ETH
// BUT only the contract owner can withdraw the ETH

contract PiggyBank {
    event Deposit(uint amount);
    event Withdraw(uint amount);

    address public owner = msg.sender;

    receive() external payable {
        emit Deposit(msg.value);
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function withdraw() external {
        require(msg.sender == owner, "You're not the owner");
        emit Withdraw(address(this).balance);
        // Deletes the contract and sends all the ETH to the contract owner
        selfdestruct(payable(msg.sender));
    }
}
