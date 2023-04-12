// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Enlish Auction Smart Contract

interface IERC721 {
    function safeTransferFrom(
        address from,
        address to,
        uint nftId
    ) external;
}

contract EngliishAuction {
       
    event Start();
    event Bid(address indexed sender, uint amount);
    event Withdraw(address indexed bidder, uint amount);
    event End(address highestBidder, uint amount);

    IERC721 public immutable nft;
    uint public immutable nftId;
    address payable public immutable seller;

    uint public endAt;
    bool public started;
    bool public ended;

    address public highestBidder;
    uint public highestBid;
    mapping(address => uint) public bids;

    constructor(
        address _nft,
        uint _nftId,
        uint _startingBid
    ){
        nft = IERC721(_nft);
        nftId = _nftId;
        seller = payable(msg.sender);
        highestBid = _startingBid;
    }

    function start() external{
        require(msg.sender == seller, "you're not the seller");
        require(!started, "auction has started");

        started = true;
        endAt = block.timestamp + 1 days;
        nft.safeTransferFrom(seller, address(this), nftId);

        emit Start();
    }

    function bid() external payable{
        require(started, "auction has not started");
        require(block.timestamp < endAt, "auction has ended");
        require(msg.value > highestBid, "value < highest bid");

        if (highestBidder != address(0)){
            bids[highestBidder] += highestBid;
        }

        highestBid = msg.value;
        highestBidder = msg.sender;

        emit Bid(msg.sender, msg.value);
    }

    function withdraw() external {
        uint bal  = bids[msg.sender];
        bids[msg.sender] = 0;
        payable(msg.sender).transfer(bal);
        emit Withdraw(msg.sender, bal);
    }

    function end() external {
        require(started, "auction not started");
        require(!ended, "auction ended");
        require(block.timestamp >= endAt, "auction has not ended");
        ended = true;
        if (highestBidder != address(0)){
            nft.safeTransferFrom(address(this), highestBidder, nftId);
            seller.transfer(highestBid);
        } else{
            nft.safeTransferFrom(address(this), seller, nftId);
        }
        emit End(highestBidder, highestBid);
    }
}
