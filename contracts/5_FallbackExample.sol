// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract FallbackExample {
    uint256 public state;

    receive() external payable {
        state = 1;
    }

    fallback() external payable {
        state = 2;
    }
}
