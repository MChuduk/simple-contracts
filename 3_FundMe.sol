// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "./4_PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;

    uint256 public constant MIN_USD = 50 * 1e18;

    address[] funders;
    mapping (address => uint256) addressToFoundingAmount;

    function fundMe() public payable  {
        require(msg.value.getConversationRate() >= MIN_USD, "Your funding should be >= 50 USD");
        funders.push(msg.sender);
        addressToFoundingAmount[msg.sender] = msg.value;
    }
}
