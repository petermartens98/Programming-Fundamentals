
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Simple Storage Smart Contract for the owner to store a new user's
// username, userID and addrees. And then anyone can see username and 
// userID from entering the user's address 

contract UserSimpleStorage{

    address owner;
    constructor() public {
        owner = msg.sender;
    }

    struct User{
        uint userID;
        string username;
        bool set;
    }
    mapping(address => User) public users;

    function CreateNewUser(address _userAddress, uint256 _userID, string memory _username) public{
        require(owner==msg.sender);
        User storage user = users[_userAddress];
        // Check that user does not already exist
        require(!user.set);
          //Store the user
        users[_userAddress] = User({
            userID: _userID,
            username: _username,
            set: true
        });
    }
}
