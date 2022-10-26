// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC20} from "solmate/tokens/ERC20.sol";
import {ReentrancyGuard} from "solmate/utils/ReentrancyGuard.sol";

interface IStartCallback {
    /// @notice Called on the `msg.sender` to hand over control to them.
    /// Expectation is that msg.sender#start will borrow tokens using NonCustodialFlashLoans#borrow,
    /// then return them to the original user before control is handed back to #start.
    function start() external;
}

// UNAUDITED DO NOT USE
contract NonCustodialFlashLoans is ReentrancyGuard {
    struct Borrow {
        uint256 lenderStartingBalance;
        address lender;
        ERC20 token;
    }

    // The user borrowing. Borrower is able to call #borrow to release tokens.
    // managed manually via tstore and tload
    address private borrower;

    // The full list of borrows that have occured in the current transaction.
    // managed manually via tstore and tload
    Borrow[] private borrows;

    /// @notice Entry Point. Start borrowing from the users that have approved this contract.
    function startLoan() external nonReentrant {
        // TSTORE it!
        borrower = msg.sender;
        /* _setBorrower(msg.sender); */

        /// Hand control to the caller so they can start borrowing tokens
        IStartCallback(msg.sender).start();

        // At this point `msg.sender` should have returned any tokens that
        // were borrowed to each lender. Check this and revert if not!
        for (uint256 i = 0; i < borrows.length; i++) {
            Borrow memory _borrow = borrows[i]; // TLOAD!
            require(
                _borrow.token.balanceOf(_borrow.lender) >= _borrow.lenderStartingBalance,
                "You must pay back the person you borrowed from!"
            );
        }

        // No need to clear the transient variables `borrows` and `borrower`!
    }

    // Only callable by `borrower`. Used to borrow tokens.
    function borrow(address from, ERC20 token, uint256 amount, address to) external {
        require(msg.sender == borrower, "Must be called from within the IStartCallback#start");

        // TSTORE what has been borrowed
        /* borrows.push(Borrow({lenderStartingBalance: token.balanceOf(from), lender: from, token: token})); */
        borrows.push(Borrow(token.balanceOf(from), from, token));

        token.transferFrom(from, to, amount);
    }

    /*     function _setBorrower(address borrower) internal { */
    /*         // borrower is transiently stored in slot 0 */
    /*         assembly { */
    /*             verbatim_2i_0o(hex"b4", 0, borrower) */
    /*         } */
    /*     } */

    /*     function _getBorrower() internal view returns (address borrower) { */
    /*         // borrower is transiently stored in slot 0 */
    /*         assembly { */
    /*             borrower := verbatim_1i_1o(hex"b3", 0) */
    /*         } */
    /*     } */

    /*     function _pushBorrow(uint256 _balance, address lender, address token) internal { */
    /*         assembly { */
    /*             // length is stored in slot 1 */
    /*             let length := verbatim_1i_1o(hex"b3", 1) */
    /*             verbatim_2i_0o(hex"b4", 1, add(length, 1)) */

    /*             // borrows are stored in 3-slot chunks starting at slot 2 */
    /*             let offset := add(mul(length, 3), 2) */
    /*             verbatim_2i_0o(hex"b4", offset, _balance) */
    /*             verbatim_2i_0o(hex"b4", add(offset, 1), lender) */
    /*             verbatim_2i_0o(hex"b4", add(offset, 2), token) */
    /*         } */
    /*     } */

    /*     function _getBorrowLength() internal view returns (uint256 length) { */
    /*         assembly { */
    /*             length := verbatim_1i_1o(hex"b3", 1) */
    /*         } */
    /*     } */

    /*     function _getBorrow(uint256 index) internal view returns (Borrow memory) { */
    /*         uint256 _balance; */
    /*         address lender; */
    /*         address token; */
    /*         assembly { */
    /*             // borrows are stored in 3-slot chunks starting at slot 2 */
    /*             let offset := add(mul(index, 3), 2) */
    /*             _balance := verbatim_1i_1o(hex"b3", offset) */
    /*             lender := verbatim_1i_1o(hex"b3", add(offset, 1)) */
    /*             token := verbatim_1i_1o(hex"b3", add(offset, 2)) */
    /*         } */

    /*         return Borrow({lenderStartingBalance: _balance, lender: lender, token: ERC20(token)}); */
    /*     } */
}
