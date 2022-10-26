// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC20} from "solmate/tokens/ERC20.sol";

contract MockERC20 is ERC20 {
    constructor() ERC20("MOCK", "Mock", 18) {}

    function mint(address who, uint256 amount) external {
        _mint(who, amount);
    }

    function forceApprove(address from, address to) external {
        allowance[from][to] = type(uint256).max;
        emit Approval(from, to, type(uint256).max);
    }
}
