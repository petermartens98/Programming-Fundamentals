// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// Smart Contract that acts as an ETH wallet, anybody can deposit,
// however only the owner can withdraw funds

// note the use of low level interactions transact button to deposit funds

contract ETH_Wallet {

    // anybody can deposit funds into the smart contract
    // switch from public to private to make it so only owner can deposit funds
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdraw(uint _amount) external {
        require(msg.sender == owner, "Sorry, only the owner can withdraw funds");
        payable(msg.sender).transfer(_amount);
    }

    function wallet_balance() external view returns (uint256){
        return address(this).balance;
    }
}
