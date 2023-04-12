// SPDX-License-Identifier: MIT

// Smart contract that allows the user to retrieve the latest ETH price
// in whole US dollars. Also allows user to calculate a USD amount based on the 
// number of whole ETH entered.

// Note: Floating point numbers are not yet available in solidity.
//       use front end programming for formatting.

pragma solidity ^0.8.0;

// Get the latest ETH/USD price from chain link price feed
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorInterface.sol";

contract ETH_to_USD_Calculator {

    AggregatorInterface internal ETH_priceFeed;

    constructor() public {
        ETH_priceFeed = AggregatorInterface(0x9326BFA02ADD2366b30bacB125260Af641031331);
    }

    //Function that returns the current ETH price in wei
    function get_ETH_price () public view returns(uint256){
        // can take out division operator for more specificity
        return uint256(ETH_priceFeed.latestAnswer()/100000000);
    }

    function ETHtoUSD_calculator(uint256 ETH_amount) public view returns (uint256){
        uint256 ETH_price = get_ETH_price();
        uint256 ETH_amountIn_USD = (ETH_price * ETH_amount);
        return ETH_amountIn_USD;
    }
}
