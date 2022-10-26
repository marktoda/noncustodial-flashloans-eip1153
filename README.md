# EIP-1153 Non-custodial FlashLoans Demo

This is a demo of [Noncustodial flashloans](https://hackmd.io/@7-EMZFyUQNeY0Ttk6APiXA/r1rHOZ8mo#) using [EIP-1153](eip1153.com) on the [EIP1153 testnet](explorer.eip1153.com) 

## Results
132k gas with TSTORE for accounting -- [Transaction](http://explorer.eip1153.com/tx/0xb4dda942852d46ab5cf2967c4e24ffcf901122dc136713302952fba8fd9dc070)

566k gas with SSTORE for accounting -- [Transaction](http://explorer.eip1153.com/tx/0xd019bae9c0e8d6bf473c4c3a2136c0c7a80404e7d71ade6a48ab2daa28c9299c)

## Development quirks

Solidity does not currently support the `transient` keyword, nor does it natively support `verbatim` inline assembly by default. So, to create the bytecode for the tstore version we compiled the contract using the solidity via-ir pipeline with irOptimized output. Then we manually updated relevant sstores using verbatim in the pure yul bytecode

Steps to do this:
- Update foundry config to output IR:
```
via_ir = true
extra_output_files = ['ir', 'irOptimized']
```

- Read in irOptimized:
```
cat out/NonCustodialFlashLoans.sol/NonCustodialFlashLoans.irOptimized > src/NonCustodialFlashLoans.yul
```

- Read the yul, find the relevant sstores and replace with verbatim:

```
// before: sstore(slot, value)
// after: verbatim_2i_0o(hex"b4", slot, value)

// before: value := sload(slot)
// after: value := verbatim_1i_1o(hex"b3", slot)
```

- Compile & deploy bytecode from your yul
```
cat out/NonCustodialFlashLoans.yul | jq '.bytecode'
cast send --create <bytecode>
```
