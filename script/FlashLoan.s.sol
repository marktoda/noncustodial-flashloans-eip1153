// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {FlashLoanClient} from "../src/FlashLoanClient.sol";

contract FlashLoan is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        FlashLoanClient client = new FlashLoanClient();
        client.borrowAndMint();
    }
}
