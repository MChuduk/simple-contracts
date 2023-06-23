// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;

contract Payments {

    struct Payment {
        string message;
        uint256 amount;
        uint256 timestamp;
    }

    mapping(address => Payment[]) public payments;

    function pay(string memory _message) public payable {
        Payment memory payment = Payment(_message, msg.value, block.timestamp);
        payments[msg.sender].push(payment);
    }

    function getPayments(address from) public view returns (Payment[] memory) {
        return payments[from];
    }
}
