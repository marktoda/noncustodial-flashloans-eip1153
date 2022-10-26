# EIP-1153 Non-custodial FlashLoans Demo

This is a demo of [Noncustodial flashloans](https://hackmd.io/@7-EMZFyUQNeY0Ttk6APiXA/r1rHOZ8mo#) using [EIP-1153](eip1153.com) on the [EIP1153 testnet](explorer.eip1153.com) 

## Results
[Transaction link](http://explorer.eip1153.com/tx/0xb4dda942852d46ab5cf2967c4e24ffcf901122dc136713302952fba8fd9dc070) 132k gas with TSTORE for accounting
[Transaction link](http://explorer.eip1153.com/tx/0xd019bae9c0e8d6bf473c4c3a2136c0c7a80404e7d71ade6a48ab2daa28c9299c) 566k gas with SSTORE for accounting

## Development quirks

Solidity does not currently support the `transient` keyword, nor does it natively support `verbatim` inline assembly by default. So, to create the bytecode for the tstore version we compiled the contract using the solidity via-ir pipeline with irOptimized output. Then we manually updated relevant sstores using verbatim in the pure yul bytecode
