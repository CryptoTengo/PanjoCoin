# PanjoCoin Developer Guide

**Version:** 1.0  
**Last Updated:** August 2026  

**Project:** CryptoTengo  
**Token:** PanjoCoin (PNJC)  
**Blockchain:** Polygon Network  

---

# 1. Introduction

Welcome to the PanjoCoin development documentation.

This guide explains how developers can:

- set up the development environment
- work with the smart contracts
- compile and test contracts
- deploy contracts
- verify contracts
- contribute improvements
- follow project development standards

PanjoCoin is an open-source Web3 project focused on:

- ERC-20 token technology
- community ecosystem
- Proof of Kindness (PoK)
- Social Mining
- GameFi integration
- charity impact initiatives

---

# 2. Project Architecture

High-level structure:

```
PanjoCoin/

├── contracts/
│   ├── PanjoCoin.sol
│   ├── LiquidityLocker.sol
│   └── Treasury.sol
│
├── scripts/
│   ├── deploy.js
│   └── verify.js
│
├── test/
│   ├── token.test.js
│   └── security.test.js
│
├── docs/
│
├── hardhat.config.js
├── package.json
└── README.md
```

---

# 3. Technology Stack

## Blockchain

| Component | Technology |
|-|-|
| Network | Polygon |
| Token Standard | ERC-20 |
| Language | Solidity |
| Framework | Hardhat |
| Libraries | OpenZeppelin |
| Testing | Hardhat Tests |

---

# 4. Requirements

Before development, install:

## Node.js

Recommended:

```
Node.js >= 18
```

Check:

```bash
node -v
```

---

## npm

Check:

```bash
npm -v
```

---

## Git

Check:

```bash
git --version
```

---

## Wallet

Recommended:

- MetaMask
- Rabby Wallet

Network:

```
Polygon Mainnet
Polygon Amoy Testnet
```

---

# 5. Clone Repository

Clone:

```bash
git clone https://github.com/CryptoTengo/PanjoCoin.git
```

Enter folder:

```bash
cd PanjoCoin
```

---

# 6. Install Dependencies

Install packages:

```bash
npm install
```

---

Expected dependencies:

```
hardhat

@openzeppelin/contracts

ethers

chai

dotenv
```

---

# 7. Environment Configuration

Create:

```
.env
```

Example:

```env
PRIVATE_KEY=

POLYGON_RPC_URL=

POLYGONSCAN_API_KEY=

DEPLOYER_ADDRESS=
```

Never upload:

```
.env
```

to GitHub.

---

# 8. Smart Contract Development

## Solidity Version

Current version:

```
Solidity 0.8.36
```

---

## Standards Used

PanjoCoin follows:

- ERC-20
- OpenZeppelin Contracts
- ERC20Burnable
- ERC20Permit (EIP-2612)

---

# 9. Smart Contract Features

## Fixed Supply

The token has:

```
1,000,000,000,000 PNJC
```

No additional minting is allowed.

---

## Burn Mechanism

The contract supports:

- token burning
- supply reduction
- deflationary mechanics

---

## Security Controls

Implemented protections:

- anti-bot mechanisms
- transaction limits
- cooldown protection
- tax limitations
- secure ownership management

---

# 10. Compile Contracts

Compile:

```bash
npx hardhat compile
```

Successful output:

```
Compiled successfully
```

---

# 11. Run Tests

Run all tests:

```bash
npx hardhat test
```

---

Tests should cover:

## Token Supply

- total supply
- decimals
- distribution

---

## Transfers

- normal transfers
- failed transfers
- limits

---

## Security

- access control
- ownership
- permissions

---

## Taxes

- charity allocation
- burn allocation
- maximum limits

---

# 12. Local Blockchain Testing

Start local node:

```bash
npx hardhat node
```

Deploy locally:

```bash
npx hardhat run scripts/deploy.js --network localhost
```

---

# 13. Deployment

## Test Network

Recommended first deployment:

```
Polygon Amoy Testnet
```

Command:

```bash
npx hardhat run scripts/deploy.js --network amoy
```

---

## Mainnet Deployment

Polygon:

```bash
npx hardhat run scripts/deploy.js --network polygon
```

---

# 14. Contract Verification

Verify contract:

```bash
npx hardhat verify \
--network polygon \
CONTRACT_ADDRESS
```

Verification provides:

- public transparency
- easier auditing
- community trust

---

# 15. Gas Optimization

Developers should consider:

- storage optimization
- avoiding unnecessary writes
- using custom errors
- minimizing loops
- efficient events

---

# 16. Security Development Rules

All code must follow:

## Checks-Effects-Interactions

External calls should happen after state updates.

---

## Access Control

Sensitive functions require:

- ownership control
- multisig protection

---

## No Hidden Functions

Contracts must not contain:

- hidden minting
- unauthorized withdrawals
- backdoors

---

# 17. Testing Requirements Before Pull Request

Before submitting:

Run:

```bash
npm test
```

Check:

```
✓ compilation

✓ tests

✓ lint

✓ security review
```

---

# 18. Pull Request Requirements

Every Pull Request should include:

## Description

Explain:

- what changed
- why it changed

---

## Testing

Include:

- commands executed
- test results

---

## Security Impact

Explain:

- possible risks
- affected contracts

---

# 19. Code Style

## Solidity

Use:

- clear naming
- NatSpec comments
- meaningful events
- readable functions

Example:

```solidity
/**
 * @notice Burns tokens from caller balance
 */
function burn(uint256 amount) external;
```

---

# 20. Documentation Updates

Developers must update documentation when changing:

- tokenomics
- contract functions
- deployment process
- architecture
- user functionality

---

# 21. Contract Addresses

Official addresses are maintained in:

```
Docs/CONTRACT_ADDRESSES.md
```

Never use unofficial addresses.

---

# 22. Development Branches

Branch format:

```
feature/name

fix/name

security/name

docs/name
```

---

# 23. Release Process

Before release:

1. Code review
2. Testing
3. Security review
4. Documentation update
5. Deployment
6. Verification
7. Release notes

---

# 24. Security Reporting

Do not publicly disclose vulnerabilities.

Report security issues according to:

```
SECURITY.md
```

---

# 25. Contribution

Developers should read:

```
CONTRIBUTING.md
```

before submitting changes.

---

# 26. Useful Resources

OpenZeppelin:

https://openzeppelin.com/

Polygon:

https://polygon.technology/

Hardhat:

https://hardhat.org/

Ethereum ERC-20:

https://ethereum.org/en/developers/docs/standards/tokens/erc-20/

---

# 27. Disclaimer

This developer documentation is provided for technical information purposes.

PanjoCoin (PNJC) is a utility token and does not represent ownership, equity, or guaranteed financial returns.

Developers should perform their own security reviews before interacting with smart contracts.

---

# Version History

## v1.0

Initial Developer Guide release.

---

© CryptoTengo  
PanjoCoin (PNJC)
