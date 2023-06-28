// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import "./IERC20.sol";

abstract contract ERC20 is IERC20 {

    uint256 private _totalSupply;

    function totalSupply() public view virtual returns (uint256) {
        return _totalSupply;
    }
}