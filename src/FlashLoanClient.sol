// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC20} from "solmate/tokens/ERC20.sol";
import {ReentrancyGuard} from "solmate/utils/ReentrancyGuard.sol";
import {NonCustodialFlashLoans} from "./NonCustodialFlashLoans.sol";

// UNAUDITED DO NOT USE
contract FlashLoanClient is IStartCallback {
    NonCustodialFlashLoans public constant nonCustodialFlashLoans = NonCustodialFlashLoans(0x5D58879007BbBC0D3D20C0408dA2ada7b5F5bB10);
    ERC20 public constant token = ERC20(0xB366613e8E89D5520F0B9AD397Ce3C0FEa0C94bb);

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
