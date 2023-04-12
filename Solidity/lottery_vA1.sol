// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// Smart contract that acts like a lottery. The owner(admin) uses a keccak256 hashing algorithm to pick 
// a random winner from a dynamic array of player addresses who all (min of 3) must contribute 1 ETH to 
// participate. All though the owner cannot participate in the lottery, they receive a 10 percent cut. 

contract Lottery {
    address payable [] public players;
    address payable public admin;

    constructor() {
        admin = payable(msg.sender);
    }

    receive() external payable{
        require(msg.value == 1 ether, "Must be exactly 1 ETH to enter lottery");
        require(msg.sender != admin, "Sorry, the admin cannot participate in the lottery");
        players.push(payable(msg.sender));
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function winnersCut() public view returns(uint){
        return getBalance() * 9 / 10;
    }

    function adminCut () public view returns(uint){
        return getBalance() - winnersCut();
    }

    function random() internal view returns(uint){
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players.length)));
    }

    function pickWinner() public returns(address) {
        require(admin == msg.sender, "Only the admin can call this function");
        require(players.length >= 3, "Need atleast 3 players to proceed with lottery");

        address payable winner;
        winner = players[random() % players.length];
        winner.transfer(winnersCut());
        admin.transfer(adminCut());

        players = new address payable[](0);

        return winner;
    }

}
