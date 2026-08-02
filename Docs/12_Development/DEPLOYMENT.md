# PanjoCoin Deployment Guide

**Version:** 1.0  
**Last Updated:** August 2026  

**Project:** CryptoTengo  
**Token:** PanjoCoin (PNJC)  
**Blockchain:** Polygon Network  

---

# 1. Introduction

This document describes the official deployment process for PanjoCoin (PNJC).

It covers:

- development deployment
- testnet deployment
- mainnet deployment
- contract verification
- liquidity deployment
- ownership management
- post-deployment security procedures

The goal is to provide a transparent and reproducible deployment process.

---

# 2. Deployment Architecture

PanjoCoin deployment consists of:

```
Developer Wallet

        |
        |
        v

PanjoCoin ERC-20 Contract

        |
        |
        +----------------+
        |                |
        v                v

Liquidity Pool       Treasury Wallet

        |
        |
        v

DEX Trading

(QuickSwap / Uniswap)
```

---

# 3. Technology Stack

| Component | Technology |
|-|-|
| Blockchain | Polygon |
| Smart Contract | Solidity |
| Framework | Hardhat |
| Library | OpenZeppelin |
| Verification | PolygonScan |
| DEX | QuickSwap / Uniswap |
| Wallet | MetaMask / Hardware Wallet |

---

# 4. Requirements

Before deployment install:

## Node.js

Required:

```
Node.js >=18
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

Required:

- MetaMask
- Hardware wallet recommended

Wallet must contain:

- MATIC for gas fees

---

# 5. Clone Repository

Clone:

```bash
git clone https://github.com/CryptoTengo/PanjoCoin.git
```

Enter project:

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

# 7. Environment Setup

Create:

```
.env
```

Example:

```env
PRIVATE_KEY=YOUR_PRIVATE_KEY

POLYGON_RPC_URL=https://polygon-rpc.com

POLYGONSCAN_API_KEY=YOUR_API_KEY

DEPLOYER_ADDRESS=YOUR_WALLET_ADDRESS
```

---

## Security Warning

Never upload:

```
.env
```

Never share:

```
PRIVATE_KEY
```

Never deploy from an unsecured wallet.

---

# 8. Compile Contracts

Compile:

```bash
npx hardhat compile
```

Expected:

```
Compilation successful
```

---

# 9. Run Tests Before Deployment

Execute:

```bash
npx hardhat test
```

Required checks:

- supply verification
- token transfers
- burn mechanism
- tax logic
- ownership permissions
- security functions

---

# 10. Testnet Deployment

Recommended test network:

```
Polygon Amoy Testnet
```

---

## Configure Network

In:

```
hardhat.config.js
```

Example:

```javascript
networks: {

 amoy: {
  url: process.env.AMOY_RPC_URL,
  accounts: [
   process.env.PRIVATE_KEY
  ]
 }

}
```

---

## Deploy

Run:

```bash
npx hardhat run scripts/deploy.js --network amoy
```

---

Deployment output:

Example:

```
PanjoCoin deployed:

Contract:
0xXXXXXXXXXXXX

Owner:
0xXXXXXXXXXXXX
```

---

# 11. Contract Verification Testnet

Verify:

```bash
npx hardhat verify \
--network amoy \
CONTRACT_ADDRESS
```

Successful verification should show:

```
Contract verified successfully
```

---

# 12. Mainnet Deployment

Before mainnet:

Required:

✅ Contract testing completed  
✅ Security review completed  
✅ Deployment wallet secured  
✅ Documentation prepared  
✅ Token parameters confirmed  

---

# 13. Polygon Mainnet Configuration

Network:

```
Polygon Mainnet
```

RPC:

```
https://polygon-rpc.com
```

---

# 14. Mainnet Deployment Command

Deploy:

```bash
npx hardhat run scripts/deploy.js --network polygon
```

---

Deployment generates:

```
Contract Address

Transaction Hash

Block Number

Deployment Timestamp
```

---

# 15. Contract Verification

Verify:

```bash
npx hardhat verify \
--network polygon \
CONTRACT_ADDRESS
```

After verification:

- source code becomes public
- community can inspect contract
- auditors can review implementation

---

# 16. Post Deployment Checklist

Immediately after deployment:

## Contract

Verify:

☑ Contract address recorded  
☑ Source verified  
☑ Total supply correct  
☑ Decimals correct  
☑ Ownership status confirmed  

---

## Documentation

Update:

```
Docs/CONTRACT_ADDRESSES.md
```

Include:

- contract address
- deployment date
- network
- explorer link

---

# 17. Liquidity Deployment

Initial liquidity allocation:

```
500,000,000,000 PNJC
```

Allocation:

| DEX | Share |
|-|-:|
| QuickSwap | 70% |
| Uniswap V3 | 30% |

---

Liquidity deployment steps:

1. Create trading pair

Example:

```
PNJC / USDT
```

2. Add liquidity

3. Confirm pool creation

4. Lock liquidity

---

# 18. Liquidity Lock

Liquidity protection:

```
Lock Period:
12 months
```

Period:

```
1 July 2026
-
1 July 2027
```

Lock proof should be published:

```
Docs/LIQUIDITY_LOCK.md
```

---

# 19. Treasury Setup

Treasury allocation:

```
120,000,000,000 PNJC
```

Security:

```
Multisig Wallet
3/5
```

Recommended:

- Safe Multisig
- Hardware wallets
- Multiple signers

---

# 20. Ownership Management

After deployment:

Review:

- ownership functions
- admin roles
- permissions

Final security state:

Expected:

```
No hidden admin control

No unauthorized minting

No upgrade backdoor
```

---

# 21. Deployment Verification

Confirm:

## Token

```
Name:
PanjoCoin

Symbol:
PNJC

Decimals:
18
```

---

## Supply

```
1,000,000,000,000 PNJC
```

---

## Network

```
Polygon Mainnet
```

---

# 22. Deployment Records

Maintain:

```
Docs/

CONTRACT_ADDRESSES.md

DEPLOYMENT_HISTORY.md

AUDIT_REPORT.md
```

---

# 23. Deployment History Template

Example:

```
Version:

v1.0

Network:

Polygon Mainnet

Date:

YYYY-MM-DD

Contract:

0x....

Transaction:

0x....

Verified:

YES
```

---

# 24. Emergency Procedures

If critical vulnerability appears:

1. Stop affected operations
2. Notify community
3. Investigate issue
4. Prepare fix
5. Publish transparency report

Follow:

```
SECURITY.md
```

---

# 25. Developer Responsibilities

Developers must:

- test before deployment
- document changes
- follow security practices
- avoid private key exposure
- update documentation

---

# 26. Production Release Checklist

Before announcing launch:

```
[ ] Contract deployed

[ ] Contract verified

[ ] Liquidity added

[ ] Liquidity locked

[ ] Treasury secured

[ ] Documentation updated

[ ] Website updated

[ ] Community announcement prepared
```

---

# 27. Related Documentation

See:

```
Docs/

DEVELOPER_GUIDE.md

TOKEN_INFORMATION.md

TOKENOMICS.md

SECURITY.md

CONTRIBUTING.md

CONTRACT_ADDRESSES.md
```

---

# Disclaimer

This document describes technical deployment procedures.

PanjoCoin (PNJC) is a utility token. Cryptocurrency deployment involves technical, market, and regulatory risks.

Users and developers should perform independent verification.

---

© CryptoTengo  
PanjoCoin (PNJC)
