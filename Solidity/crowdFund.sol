// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Crowd Funding Smart Contract in Solidity that allows the owner to set the fundraising goal, the deadline
// is set at 90 days after the deployment blocks time stamp, however this can be changed. After the 90 days,
// if the goal is met, the admin can withdraw the funds, if not met the contributors can get a refund.

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";

contract CrowdFund {
    using SafeMath for uint256;

    mapping(address=>uint) public contributors;
    mapping(address => uint256) public pledgeOf;
    address payable public admin;
    uint public numContributers; 
    uint public minContribution; 
    uint public deadline;  
    uint public goalAmount; 
    uint public raisedAmount;

    //this code executes only once when contract is delployed
    constructor(uint _goalAmount){
        admin = payable(msg.sender);
        minContribution = 100 wei;
        deadline = block.timestamp + 90 days; //deadline is 90 days from blockstamp
        goalAmount = _goalAmount; //when deploying enter amount in wei
    }

    function pledge(uint256 amount) public payable {
        require(block.timestamp < deadline, "Sorry, you're late");               
        require(msg.value == amount);

        pledgeOf[msg.sender] += amount;
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    // Function for when the funding goal is met and allows the admin
    // to transfer contract funds to their address
    function claimFunds() public {
        require(address(this).balance >= goalAmount, "Minimum contribution is 100 wei"); 
        require(block.timestamp >= deadline);               
        require(msg.sender == admin);

        admin.transfer(address(this).balance);
    }

    // Function to allow users to get a refund for when the goal amount
    // is not reached within 90 days
    function getRefund() public {
        require(address(this).balance < goalAmount);  
        require(block.timestamp >= deadline);               

        uint256 amount = pledgeOf[msg.sender];
        pledgeOf[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }
}
