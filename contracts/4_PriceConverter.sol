// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

// import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {

    function getPrice() internal  view returns (uint256) {
        return 1;
//        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
//        (, int256 price,,,) = priceFeed.latestRoundData();
//        return uint256(price * 1e18);
    }

    function getConversationRate(uint256 ethAmount) internal  view returns (uint256) {
        return 1;
//        uint256 ethPrice = getPrice();
//        return (ethPrice * ethAmount) / 1e18;
    }
}
