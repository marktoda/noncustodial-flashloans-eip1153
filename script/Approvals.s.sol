// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {MockERC20} from "../src/MockERC20.sol";
import {NonCustodialFlashLoans} from "../src/NonCustodialFlashLoans.sol";

contract CounterScript is Script {
    NonCustodialFlashLoans public constant nonCustodialFlashLoans = NonCustodialFlashLoans(0x7E0F7ea63961F014Fb7c55a0bC3A6f4C3aF7506b);

    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        MockERC20 token = new MockERC20();
        token.mint(address(1), 10**18);
        token.forceApprove(address(1), address(nonCustodialFlashLoans));
        token.mint(address(2), 10**18);
        token.forceApprove(address(2), address(nonCustodialFlashLoans));
        token.mint(address(3), 10**18);
        token.forceApprove(address(3), address(nonCustodialFlashLoans));
        token.mint(address(4), 10**18);
        token.forceApprove(address(4), address(nonCustodialFlashLoans));
        token.mint(address(5), 10**18);
        token.forceApprove(address(5), address(nonCustodialFlashLoans));
        token.mint(address(6), 10**18);
        token.forceApprove(address(6), address(nonCustodialFlashLoans));
        token.mint(address(7), 10**18);
        token.forceApprove(address(7), address(nonCustodialFlashLoans));
        token.mint(address(8), 10**18);
        token.forceApprove(address(8), address(nonCustodialFlashLoans));
        token.mint(address(9), 10**18);
        token.forceApprove(address(9), address(nonCustodialFlashLoans));
    }
}
