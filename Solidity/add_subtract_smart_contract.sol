// SPDX-License-Identifier: MIT

// basic smart contract that allows the user to add or subtract to a count
// and then be able to retrieve the count

pragma solidity ^0.6.0 ;

contract add_subtract {

    uint public count = 0;

    function getCount() view public returns(uint) {
        return count;
    }

    function add() public {
        count += 1;
    }

    function subtract() public{
        count -= 1;
    }
}
