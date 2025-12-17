# Nintondo Core Emission Schedule

This document summarizes the current block subsidy schedule as configured in the source tree (`src/dogecoin.cpp` and consensus params in `src/chainparams.cpp`).

## Halving interval
- `nSubsidyHalvingInterval = 100,000` blocks.

## Reward phases (mainnet/testnet)
- **0 – 99,999**: Deterministic 400,000 DOGE.
- **100,000 – 199,999**: Deterministic 275,000 DOGE 
- **200,000 – 299,999**: Deterministic 144,000 DOGE.
- **300,000 – 399,999**: Deterministic 64,500 DOGE.
- **400,000 – 499,999**: Deterministic 32,000 DOGE.
- **500,000 and onward**: Constant 45,000 DOGE per block (no further halvings).

Regtest and other networks follow the same formulas unless their `nSubsidyHalvingInterval` or `fSimplifiedRewards` are changed.

## Notes
- Rewards are deterministic across all heights (`fSimplifiedRewards = true` from genesis in current params).
- After height 500,000, the reward no longer halves and remains at 45,000 DOGE per block.
