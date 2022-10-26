/// @use-src 6:"lib/solmate/src/utils/ReentrancyGuard.sol", 8:"src/NonCustodialFlashLoans.sol"
object "NonCustodialFlashLoans_18085" {
    code {
        {
            /// @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..."
            let _1 := memoryguard(0x80)
            mstore(64, _1)
            if callvalue() { revert(0, 0) }
            sstore(/** @src 6:454:455  "1" */ 0x00, 0x01)
            /// @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..."
            let _2 := datasize("NonCustodialFlashLoans_18085_deployed")
            codecopy(_1, dataoffset("NonCustodialFlashLoans_18085_deployed"), _2)
            return(_1, _2)
        }
    }
    /// @use-src 6:"lib/solmate/src/utils/ReentrancyGuard.sol", 8:"src/NonCustodialFlashLoans.sol"
    object "NonCustodialFlashLoans_18085_deployed" {
        code {
            {
                /// @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..."
                let _1 := memoryguard(0x80)
                let _2 := 64
                mstore(_2, _1)
                let _3 := 4
                if iszero(lt(calldatasize(), _3))
                {
                    let _4 := 0
                    switch shr(224, calldataload(_4))
                    case 0xdfab6ef9 {
                        if callvalue() { revert(_4, _4) }
                        if slt(add(calldatasize(), not(3)), _4) { revert(_4, _4) }
                        /// @src 6:522:523  "1"
                        let _5 := 0x01
                        /// @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..."
                        if not(iszero(/** @src 6:512:523  "locked == 1" */ verbatim_1i_1o(hex"b3", _4)))
                        /// @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..."
                        {
                            mstore(_1, shl(229, 4594637))
                            mstore(add(_1, _3), 32)
                            mstore(add(_1, 36), 10)
                            mstore(add(_1, 68), "REENTRANCY")
                            revert(_1, 100)
                        }
                        /// @src 6:558:559  "2"
                        let _6 := 0x02
                        /// @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..."
                        verbatim_2i_0o(hex"b4", _4, /** @src 6:558:559  "2" */ _6)
                        /// @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..."
                        verbatim_2i_0o(hex"b4",/** @src 6:522:523  "1" */ _5, /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ or(and(verbatim_1i_1o(hex"b3",/** @src 6:522:523  "1" */ _5), /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ shl(160, 0xffffffffffffffffffffffff)), /** @src 8:1186:1196  "msg.sender" */ caller()))
                        /// @src 8:1321:1355  "IStartCallback(msg.sender).start()"
                        if iszero(extcodesize(/** @src 8:1186:1196  "msg.sender" */ caller()))
                        /// @src 8:1321:1355  "IStartCallback(msg.sender).start()"
                        {
                            /// @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..."
                            revert(_4, _4)
                        }
                        /// @src 8:1321:1355  "IStartCallback(msg.sender).start()"
                        let _7 := /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ mload(_2)
                        /// @src 8:1321:1355  "IStartCallback(msg.sender).start()"
                        mstore(_7, /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ shl(224, 0xbe9a6555))
                        /// @src 8:1321:1355  "IStartCallback(msg.sender).start()"
                        let _8 := call(gas(), /** @src 8:1186:1196  "msg.sender" */ caller(), /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ _4, /** @src 8:1321:1355  "IStartCallback(msg.sender).start()" */ _7, /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ _3, /** @src 8:1321:1355  "IStartCallback(msg.sender).start()" */ _7, /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ _4)
                        /// @src 8:1321:1355  "IStartCallback(msg.sender).start()"
                        if iszero(_8)
                        {
                            /// @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..."
                            let pos := mload(_2)
                            returndatacopy(pos, _4, returndatasize())
                            revert(pos, returndatasize())
                        }
                        /// @src 8:1321:1355  "IStartCallback(msg.sender).start()"
                        if _8
                        {
                            /// @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..."
                            if gt(_7, 0xffffffffffffffff)
                            {
                                mstore(_4, shl(224, 0x4e487b71))
                                mstore(_3, 0x41)
                                revert(_4, 0x24)
                            }
                            mstore(_2, _7)
                            _4 := _4
                        }
                        /// @src 8:1518:1531  "uint256 i = 0"
                        let var_i := _4
                        /// @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..."
                        let _9 := verbatim_1i_1o(hex"b3",/** @src 6:558:559  "2" */ _6)
                        /// @src 8:1513:1819  "for (uint256 i = 0; i < borrows.length; i++) {..."
                        for { }
                        /** @src 8:1533:1551  "i < borrows.length" */ lt(var_i, _9)
                        /// @src 8:1518:1531  "uint256 i = 0"
                        {
                            /// @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..."
                            if eq(var_i, not(0))
                            {
                                mstore(_4, shl(224, 0x4e487b71))
                                mstore(_3, 0x11)
                                revert(_4, 36)
                            }
                            /// @src 8:1553:1556  "i++"
                            var_i := /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ add(var_i, /** @src 6:522:523  "1" */ _5)
                        }
                        /// @src 8:1553:1556  "i++"
                        {
                            /// @src 8:1596:1606  "borrows[i]"
                            let _10, _11 := storage_array_index_access_struct_Borrow__dyn(var_i)
                            /// @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..."
                            let memPtr := mload(_2)
                            finalize_allocation_4276(memPtr)
                            mstore(memPtr, verbatim_1i_1o(hex"b3", _10))
                            let _12 := sub(shl(160, 1), 1)
                            let cleaned := and(verbatim_1i_1o(hex"b3", add(_10, /** @src 6:522:523  "1" */ _5)), /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ _12)
                            let _13 := 32
                            mstore(add(memPtr, _13), cleaned)
                            let cleaned_1 := and(verbatim_1i_1o(hex"b3", add(_10, /** @src 6:558:559  "2" */ _6)), /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ _12)
                            mstore(add(memPtr, _2), cleaned_1)
                            /// @src 8:1655:1694  "_borrow.token.balanceOf(_borrow.lender)"
                            let _14 := /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ mload(_2)
                            /// @src 8:1655:1694  "_borrow.token.balanceOf(_borrow.lender)"
                            mstore(_14, /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ shl(224, 0x70a08231))
                            mstore(/** @src 8:1655:1694  "_borrow.token.balanceOf(_borrow.lender)" */ add(_14, /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ _3), cleaned)
                            let _15 := 36
                            /// @src 8:1655:1694  "_borrow.token.balanceOf(_borrow.lender)"
                            let _16 := staticcall(gas(), cleaned_1, _14, /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ _15, /** @src 8:1655:1694  "_borrow.token.balanceOf(_borrow.lender)" */ _14, /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ _13)
                            /// @src 8:1655:1694  "_borrow.token.balanceOf(_borrow.lender)"
                            if iszero(_16)
                            {
                                /// @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..."
                                let pos_1 := mload(_2)
                                returndatacopy(pos_1, _4, returndatasize())
                                revert(pos_1, returndatasize())
                            }
                            /// @src 8:1655:1694  "_borrow.token.balanceOf(_borrow.lender)"
                            let expr := _4
                            if _16
                            {
                                let _17 := /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ _13
                                /// @src 8:1655:1694  "_borrow.token.balanceOf(_borrow.lender)"
                                if gt(/** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ _13, /** @src 8:1655:1694  "_borrow.token.balanceOf(_borrow.lender)" */ returndatasize()) { _17 := returndatasize() }
                                finalize_allocation(_14, _17)
                                /// @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..."
                                if slt(sub(/** @src 8:1655:1694  "_borrow.token.balanceOf(_borrow.lender)" */ add(_14, _17), /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ _14), _13) { revert(0, 0) }
                                /// @src 8:1655:1694  "_borrow.token.balanceOf(_borrow.lender)"
                                expr := /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ mload(_14)
                            }
                            if /** @src 8:1655:1727  "_borrow.token.balanceOf(_borrow.lender) >= _borrow.lenderStartingBalance" */ lt(expr, /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ mload(/** @src 8:1698:1727  "_borrow.lenderStartingBalance" */ memPtr))
                            /// @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..."
                            {
                                let memPtr_1 := mload(_2)
                                mstore(memPtr_1, shl(229, 4594637))
                                mstore(add(memPtr_1, _3), _13)
                                mstore(add(memPtr_1, _15), 47)
                                mstore(add(memPtr_1, 68), "You must pay back the person you")
                                mstore(add(memPtr_1, 100), " borrowed from!")
                                revert(memPtr_1, 132)
                            }
                        }
                        /// @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..."
                        return(_4, _4)
                    }
                    case 0xe5cd487f {
                        if callvalue() { revert(_4, _4) }
                        if slt(add(calldatasize(), not(3)), 128) { revert(_4, _4) }
                        let value := calldataload(_3)
                        let _18 := sub(shl(160, 1), 1)
                        let _19 := and(value, _18)
                        if iszero(eq(value, _19)) { revert(0, 0) }
                        let _20 := 36
                        let value_1 := calldataload(_20)
                        let _21 := and(value_1, _18)
                        if iszero(eq(value_1, _21)) { revert(_4, _4) }
                        let value_2 := calldataload(100)
                        let _22 := and(value_2, _18)
                        if iszero(eq(value_2, _22)) { revert(0, 0) }
                        if iszero(/** @src 8:2105:2127  "msg.sender == borrower" */ eq(/** @src 8:2105:2115  "msg.sender" */ caller(), /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ and(verbatim_1i_1o(hex"b3", 1), _18)))
                        {
                            let memPtr_2 := mload(_2)
                            mstore(memPtr_2, shl(229, 4594637))
                            mstore(add(memPtr_2, _3), 32)
                            mstore(add(memPtr_2, _20), 51)
                            mstore(add(memPtr_2, 68), "Must be called from within the I")
                            mstore(add(memPtr_2, 100), "StartCallback#start")
                            revert(memPtr_2, 132)
                        }
                        /// @src 8:2367:2388  "token.balanceOf(from)"
                        let _23 := /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ mload(_2)
                        /// @src 8:2367:2388  "token.balanceOf(from)"
                        mstore(_23, /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ shl(224, 0x70a08231))
                        mstore(/** @src 8:2367:2388  "token.balanceOf(from)" */ add(_23, /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ _3), _19)
                        let _24 := 32
                        /// @src 8:2367:2388  "token.balanceOf(from)"
                        let _25 := staticcall(gas(), _21, _23, /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ _20, /** @src 8:2367:2388  "token.balanceOf(from)" */ _23, /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ _24)
                        /// @src 8:2367:2388  "token.balanceOf(from)"
                        if iszero(_25)
                        {
                            /// @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..."
                            let pos_2 := mload(_2)
                            returndatacopy(pos_2, _4, returndatasize())
                            revert(pos_2, returndatasize())
                        }
                        /// @src 8:2367:2388  "token.balanceOf(from)"
                        let expr_1 := _4
                        if _25
                        {
                            let _26 := /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ _24
                            /// @src 8:2367:2388  "token.balanceOf(from)"
                            if gt(/** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ _24, /** @src 8:2367:2388  "token.balanceOf(from)" */ returndatasize()) { _26 := returndatasize() }
                            finalize_allocation(_23, _26)
                            /// @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..."
                            if slt(sub(/** @src 8:2367:2388  "token.balanceOf(from)" */ add(_23, _26), /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ _23), _24) { revert(0, 0) }
                            /// @src 8:2367:2388  "token.balanceOf(from)"
                            expr_1 := /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ mload(_23)
                        }
                        let memPtr_3 := mload(_2)
                        finalize_allocation_4276(memPtr_3)
                        mstore(memPtr_3, expr_1)
                        /// @src 8:2360:2402  "Borrow(token.balanceOf(from), from, token)"
                        let _27 := add(memPtr_3, /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ _24)
                        mstore(_27, _19)
                        /// @src 8:2360:2402  "Borrow(token.balanceOf(from), from, token)"
                        let _28 := add(memPtr_3, /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ _2)
                        mstore(_28, _21)
                        let oldLen := verbatim_1i_1o(hex"b3", /** @src 8:2347:2354  "borrows" */ 0x02)
                        /// @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..."
                        if iszero(lt(oldLen, 18446744073709551616))
                        {
                            mstore(_4, shl(224, 0x4e487b71))
                            mstore(_3, 0x41)
                            revert(_4, _20)
                        }
                        // length
                        verbatim_2i_0o(hex"b4",/** @src 8:2347:2354  "borrows" */ 0x02, /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ add(oldLen, 1))
                        let slot, offset := storage_array_index_access_struct_Borrow__dyn(oldLen)
                        if offset
                        {
                            mstore(_4, shl(224, 0x4e487b71))
                            mstore(_3, _4)
                            revert(_4, _20)
                        }
                        verbatim_2i_0o(hex"b4", slot, mload(memPtr_3))
                        let memberSlot := add(slot, 1)
                        let _29 := and(mload(_27), _18)
                        let _30 := shl(160, 0xffffffffffffffffffffffff)
                        verbatim_2i_0o(hex"b4", memberSlot, or(and(verbatim_1i_1o(hex"b3", memberSlot), _30), _29))
                        let memberSlot_1 := add(slot, /** @src 8:2347:2354  "borrows" */ 0x02)
                        /// @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..."
                        verbatim_2i_0o(hex"b4", memberSlot_1, or(and(verbatim_1i_1o(hex"b3", memberSlot_1), _30), and(mload(_28), _18)))
                        /// @src 8:2418:2454  "token.transferFrom(from, to, amount)"
                        let _31 := /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ mload(_2)
                        /// @src 8:2418:2454  "token.transferFrom(from, to, amount)"
                        mstore(_31, /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ shl(224, 0x23b872dd))
                        mstore(/** @src 8:2418:2454  "token.transferFrom(from, to, amount)" */ add(_31, /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ _3), _19)
                        mstore(add(/** @src 8:2418:2454  "token.transferFrom(from, to, amount)" */ _31, /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ _20), _22)
                        mstore(add(/** @src 8:2418:2454  "token.transferFrom(from, to, amount)" */ _31, /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ 68), calldataload(68))
                        /// @src 8:2418:2454  "token.transferFrom(from, to, amount)"
                        let _32 := call(gas(), _21, /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ _4, /** @src 8:2418:2454  "token.transferFrom(from, to, amount)" */ _31, /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ 100, /** @src 8:2418:2454  "token.transferFrom(from, to, amount)" */ _31, /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ _24)
                        /// @src 8:2418:2454  "token.transferFrom(from, to, amount)"
                        if iszero(_32)
                        {
                            /// @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..."
                            let pos_3 := mload(_2)
                            returndatacopy(pos_3, _4, returndatasize())
                            revert(pos_3, returndatasize())
                        }
                        /// @src 8:2418:2454  "token.transferFrom(from, to, amount)"
                        if _32
                        {
                            let _33 := /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ _24
                            /// @src 8:2418:2454  "token.transferFrom(from, to, amount)"
                            if gt(/** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ _24, /** @src 8:2418:2454  "token.transferFrom(from, to, amount)" */ returndatasize()) { _33 := returndatasize() }
                            finalize_allocation(_31, _33)
                            /// @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..."
                            if slt(sub(/** @src 8:2418:2454  "token.transferFrom(from, to, amount)" */ add(_31, _33), /** @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..." */ _31), _24) { revert(_4, _4) }
                            let value_3 := mload(_31)
                            if iszero(eq(value_3, iszero(iszero(value_3)))) { revert(_4, _4) }
                        }
                        return(_4, _4)
                    }
                }
                revert(0, 0)
            }
            function finalize_allocation_4276(memPtr)
            {
                let newFreePtr := add(memPtr, 96)
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr))
                {
                    mstore(0, shl(224, 0x4e487b71))
                    mstore(4, 0x41)
                    revert(0, 0x24)
                }
                mstore(64, newFreePtr)
            }
            function finalize_allocation(memPtr, size)
            {
                let newFreePtr := add(memPtr, and(add(size, 31), not(31)))
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr))
                {
                    mstore(0, shl(224, 0x4e487b71))
                    mstore(4, 0x41)
                    revert(0, 0x24)
                }
                mstore(64, newFreePtr)
            }
            function storage_array_index_access_struct_Borrow__dyn(index) -> slot, offset
            {
                if iszero(lt(index, verbatim_1i_1o(hex"b3", /** @src 6:558:559  "2" */ 0x02)))
                /// @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..."
                {
                    mstore(0, shl(224, 0x4e487b71))
                    mstore(4, 0x32)
                    revert(0, 0x24)
                }
                mstore(/** @src -1:-1:-1 */ 0, /** @src 6:558:559  "2" */ 0x02)
                /// @src 8:528:4420  "contract NonCustodialFlashLoans is ReentrancyGuard {..."
                slot := add(29102676481673041902632991033461445430619272659676223336789171408008386403022, mul(index, 3))
                offset := /** @src -1:-1:-1 */ 0
            }
        }
        data ".metadata" hex"a2646970667358221220048593ff31c9d112d2f5d0f25fb2cc853a2523f1508e1ad0c1d55d9a893ac74564736f6c63430008110033"
    }
}
