# Nintondo Core

Simplified Dogecoin Core fork configured for the Nintondo network. Run a full node, mine, and interact via JSON-RPC with the Scrypt-based chain.

## Quick start
- Build from source: follow [INSTALL.md](INSTALL.md). For cross-builds (Windows/macOS), use `depends/` with the host triplets in CI.
- Launch a node: `src/dogecoind` (or packaged binaries). Use `-testnet` or `-regtest` for non-main networks.
- CLI: `src/dogecoin-cli help` lists all RPC calls; `dogecoin-cli help <cmd>` for details.

## Network details
| Function | mainnet | testnet | regtest |
| :------- | ------: | ------: | ------: |
| P2P      |  58080  |  48480  |  18444  |
| RPC      |  58081* |  48481* |  18332  |
`*` default RPC is P2P-1 unless overridden by `-rpcport`.

Message start (magic bytes) are customized per network; ensure peers and services match the build.

## Binaries and branding
- Coin icon: `share/pixmaps/nintondo.ico` (also usable for installers).
- macOS bundle icon: drop an `.icns` counterpart alongside if you build new DMGs.
- Background assets for macOS packaging: see `background.tiff*` in the repo root.

## Contributing
- Target branch: `master`.
- Issues/PRs: describe network, platform, and steps to reproduce. For consensus or networking changes, include test coverage or reproducible scenarios.

## Licensing
Nintondo Core inherits Dogecoin Core’s MIT license. See [COPYING](COPYING).
