# Minimal ERC20 Token (Solidity)

A minimal ERC20-style token built in Solidity and tested on Sepolia using Remix + MetaMask.

## What it does
- Tracks balances and allowances
- Supports `transfer`, `approve`, and `transferFrom`
- Mints initial supply in the constructor
- Emits Transfer and Approval events

## Remix (Sepolia)
- Compile `contracts/MyToken.sol` with Solidity 0.8.20
- Deploy with initial supply (example: 1000 tokens = `1000000000000000000000`)
- Transfer 1 token: `transfer(<address>, 1000000000000000000)`

## On-chain proof
See `PROGRESS_LOG.md`.
