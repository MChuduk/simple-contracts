// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "./4_PriceConverter.sol";

    error NotOwner();

contract FundMe {
    using PriceConverter for uint256;

    uint256 public constant MIN_USD = 50 * 1e18;

    address[] funders;
    mapping (address => uint256) public addressToFoundingAmount;

    address immutable owner;

    constructor() {
        owner = msg.sender;
    }

    function fundMe() public payable {
        require(msg.value.getConversationRate() >= MIN_USD, "Your funding should be >= 50 USD");
        funders.push(msg.sender);
        addressToFoundingAmount[msg.sender] += msg.value;
    }

    modifier onlyOnwer() {
        // require(owner == msg.sender, "This function can be callled only for contract owner");
        if (owner != msg.sender) {
            revert NotOwner();
        }
        _;
    }

    function widthdraw() public onlyOnwer {
        for(uint256 i = 0; i < funders.length; i++) {
            address funder = funders[i];
            addressToFoundingAmount[funder] = 0;
        }
        funders = new address[](0);
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
    }

    receive() external payable {
        fundMe();
    }

    fallback() external payable {
        fundMe();
    }
}
