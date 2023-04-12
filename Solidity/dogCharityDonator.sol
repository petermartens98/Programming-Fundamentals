// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Smart Contract that collects donations and then allows the user (only option) to 
// donate the funds to equal balance of 5 dog charities.

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";

contract DogCrowdFund{
    using SafeMath for uint256;
    
    address payable public admin;
    address pawthereum = 0xAEcc217a749c2405b5ebC9857a16d58Bdc1c367F;
    address paws = 0xF096337d463eAF43a10018Fd8AceDcc6202A980d;
    address hopeforpaws = 0x02749049F0197e2EFf6b1DCEeeC57aD75d2269C1;
    address bestfriends = 0x53bbbda11Eb2AD7F519749D8953fEfadaD3C0F98;
    address dogsforbetterlives = 0x6789C305453BB81D3648D9B68243aCe08CFb1d09;

    event DepositFunds(uint amount);
    uint public AmountDonated;
    
    constructor() {
        admin = payable(msg.sender);
    }

    receive() external payable {
        emit DepositFunds(msg.value);
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function dividedBalance() public view returns(uint){
        return getBalance()/5;
    }

    function Donate() external{
        require(msg.sender == admin, "Sorry, only the admin can donate funds from this contract to charity");
        AmountDonated += getBalance();
        payable(pawthereum).transfer(((address(this).balance)/5));
        payable(paws).transfer(((address(this).balance)/5));
        payable(hopeforpaws).transfer(((address(this).balance)/5));
        payable(bestfriends).transfer(((address(this).balance)/5));
        payable(dogsforbetterlives).transfer(((address(this).balance)/5));
    }
}
