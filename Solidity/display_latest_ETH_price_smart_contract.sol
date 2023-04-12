// SPDX-License-Identifier: MIT

// Smart contract that displays the current ETH price in gwei

pragma solidity ^0.8.0;

// Get the latest ETH/USD price from chain link price feed
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorInterface.sol";

contract display_ETH_price {

    AggregatorInterface internal ETH_priceFeed;

    constructor() public {
        ETH_priceFeed = AggregatorInterface(0x9326BFA02ADD2366b30bacB125260Af641031331);
    }

    function ETH_price () public view returns(int256){
        return ETH_priceFeed.latestAnswer();
    }
}
