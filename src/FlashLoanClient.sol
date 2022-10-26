// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC20} from "solmate/tokens/ERC20.sol";
import {ReentrancyGuard} from "solmate/utils/ReentrancyGuard.sol";
import {NonCustodialFlashLoans} from "./NonCustodialFlashLoans.sol";

interface IStartCallback {
    /// @notice Called on the `msg.sender` to hand over control to them.
    /// Expectation is that msg.sender#start will borrow tokens using NonCustodialFlashLoans#borrow,
    /// then return them to the original user before control is handed back to #start.
    function start() external;
}

// UNAUDITED DO NOT USE
contract FlashLoanClient is IStartCallback {
    NonCustodialFlashLoans public constant nonCustodialFlashLoans = NonCustodialFlashLoans(0x0206C69ED71Cb6Aa27D551E6Ae196B413A092FF6);
    ERC20 public constant token = ERC20(0xE9D8E921a8e0FD1fFf80cc56f49bf7230F62799E);

    /// @notice Weird lame flash loan where we borrow and insta pay back
    function borrowAndMint() external {
        nonCustodialFlashLoans.startLoan();
    }

    function start() external {
        nonCustodialFlashLoans.borrow(address(1), token, 10**18, address(this));
        nonCustodialFlashLoans.borrow(address(2), token, 10**18, address(this));
        nonCustodialFlashLoans.borrow(address(3), token, 10**18, address(this));
        nonCustodialFlashLoans.borrow(address(4), token, 10**18, address(this));
        nonCustodialFlashLoans.borrow(address(5), token, 10**18, address(this));
        nonCustodialFlashLoans.borrow(address(6), token, 10**18, address(this));

        // do some fun stuff

        token.transfer(address(1), 10**18);
        token.transfer(address(2), 10**18);
        token.transfer(address(3), 10**18);
        token.transfer(address(4), 10**18);
        token.transfer(address(5), 10**18);
        token.transfer(address(6), 10**18);
    }
}
