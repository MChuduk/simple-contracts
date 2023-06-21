// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 public constant MIN_USD = 50 * 1e18;

    function fundMe() public payable  {
        require(getConversationRate(msg.value) >= MIN_USD, "Your funding should be >= 50 USD");
    }

    function getPrice() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int256 price,,,) = priceFeed.latestRoundData();
        return uint256(price * 1e18);
    }

    function getConversationRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        return (ethPrice * ethAmount) / 1e18;
    }
}
