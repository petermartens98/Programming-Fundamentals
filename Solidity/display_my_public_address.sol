// SPDX-License-Identifier: MIT

// Smart contract that displays the owners (contract deployer) address

pragma solidity ^0.8.0;

contract Display_My_Public_Address {

    // Private state variable
    address private owner;

    // first person to deploy the contract is owner
    constructor() public {
        owner = msg.sender;
    }

    // make sure message sender is owner of contract
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    // Function to return the address of the owner (contract deployer)
    function display_address() public view returns(address){
        return owner;
    }
}
