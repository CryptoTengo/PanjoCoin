Ниже подготовлен полноценный документ **`CONTRACT_VERIFICATION.md`** для GitHub-репозитория **PanjoCoin (PNJC)**. Он предназначен для разработчиков, аудиторов, пользователей, бирж и исследователей блокчейна.

```markdown
# PanjoCoin (PNJC) — Smart Contract Verification Guide

Version: 1.0  
Project: PanjoCoin (PNJC)  
Network: Polygon Mainnet  
Contract Standard: ERC-20  
Solidity Version: 0.8.36  

---

# 1. Overview

This document describes the process for verifying the official PanjoCoin (PNJC) smart contract source code on blockchain explorers.

Contract verification ensures:

- Transparency
- Public code availability
- Community trust
- Easier security review
- Compatibility with Web3 tools

After verification, users can compare the deployed bytecode with the published source code.

---

# 2. Official Contract Information

## Token Name

PanjoCoin

## Symbol

PNJC

## Blockchain

Polygon

## Standard

ERC-20

## Contract Address

```

0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF

```

---

## Explorer

Official verification page:

PolygonScan:

```

[https://polygonscan.com/address/0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF#code](https://polygonscan.com/address/0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF#code)

```

---

# 3. Verification Requirements

Before verification ensure:

✓ Correct contract address  
✓ Correct source code version  
✓ Correct Solidity compiler version  
✓ Correct optimization settings  
✓ Correct constructor parameters  

---

# 4. Compiler Configuration

## Solidity Version

```

0.8.36

```

---

## Optimization

Recommended:

```

Enabled

```

Runs:

```

200

```

---

## EVM Version

Recommended:

```

Default

```

or

```

paris

```

depending on deployment configuration.

---

# 5. Source Code Verification

Verification requires:

- Complete Solidity source files
- Imported dependencies
- Compiler metadata
- Constructor arguments


Example structure:

```

contracts/

├── PanjoCoin.sol
├── interfaces/
├── libraries/
└── dependencies/

```

---

# 6. Verification Using PolygonScan

## Step 1

Open:

```

PolygonScan
→ Contract Address
→ Contract
→ Verify and Publish

```

---

## Step 2

Select:

Compiler Type:

```

Solidity (Single file)

```

or

```

Solidity (Standard JSON Input)

```

---

## Step 3

Enter:

Compiler Version:

```

v0.8.36

```

---

## Step 4

Enable:

```

Optimization: Yes

```

Runs:

```

200

```

---

## Step 5

Upload:

```

PanjoCoin.sol

```

or Standard JSON file.

---

## Step 6

Submit verification.

Expected result:

```

Contract Source Code Verified

````

---

# 7. Verification Using Hardhat

Install verification plugin:

```bash
npm install --save-dev @nomicfoundation/hardhat-verify
````

---

Configure:

`hardhat.config.js`

Example:

```javascript
module.exports = {
 solidity: {
   version: "0.8.36",
   settings: {
     optimizer: {
       enabled: true,
       runs: 200
     }
   }
 }
};
```

---

Run verification:

```bash
npx hardhat verify \
--network polygon \
CONTRACT_ADDRESS
```

---

# 8. Verification Using Foundry

Install Foundry:

```
foundryup
```

Verify:

```bash
forge verify-contract \
CONTRACT_ADDRESS \
PanjoCoin \
--chain polygon
```

---

# 9. Constructor Arguments

If the contract contains constructor parameters:

They must be encoded correctly.

Example:

```
constructor(
address treasury,
address charityWallet
)
```

Verification requires:

```
Encoded Constructor Arguments
```

---

# 10. Verification Checklist

Before publishing:

## Contract

✓ Correct contract deployed
✓ Correct repository version
✓ Correct compiler version
✓ Correct optimization settings

---

## Security

✓ No hidden mint functions
✓ No unauthorized ownership controls
✓ No upgrade mechanisms unless documented
✓ No hidden blacklist functions
✓ No hidden trading restrictions

---

# 11. Post Verification Checks

After verification:

Confirm:

## Source Code

✓ Matches deployed bytecode

---

## Functions

Verify:

* transfer()
* approve()
* allowance()
* transferFrom()
* burn()
* permit()

(if enabled)

---

## Events

Check:

* Transfer events
* Approval events
* Ownership events

---

# 12. Contract Transparency Requirements

PanjoCoin follows transparency principles:

## No Hidden Minting

Maximum supply is fixed.

```
1,000,000,000,000 PNJC
```

---

## No Upgradeability

Contract logic cannot be secretly changed.

---

## Public Verification

Source code is publicly available.

---

# 13. Security Review Checklist

Auditors should verify:

## Access Control

* Owner privileges
* Admin functions
* Treasury permissions

---

## Token Economics

* Supply limits
* Burn logic
* Tax calculations
* Reward mechanisms

---

## Trading Protection

* Anti-bot mechanisms
* Transaction limits
* Cooldown rules

---

# 14. Repository Verification Files

Recommended repository structure:

```
docs/

├── CONTRACT_VERIFICATION.md
├── SMART_CONTRACT_SECURITY.md
├── TESTING_GUIDE.md
├── AUDIT_REPORT.md

contracts/

├── PanjoCoin.sol
├── interfaces/
└── libraries/

deployment/

├── deployment.json
└── addresses.json
```

---

# 15. Verification Status

Current status:

```
Contract:
0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF

Network:
Polygon Mainnet

Verification:
See PolygonScan
```

---

# 16. Community Verification

Anyone can independently verify:

* Contract source code
* Token supply
* Transactions
* Holder distribution
* Contract behavior

---

# 17. Responsible Disclosure

If a security issue is discovered:

Do not:

* Publish exploit details immediately
* Attack the contract
* Harm users

Report responsibly through official channels.

---

# 18. Disclaimer

Contract verification improves transparency but does not guarantee that smart contracts are completely free from risks.

Users should perform their own research before interacting with blockchain contracts.

---

© PanjoCoin (PNJC)
CryptoTengo Ecosystem

```

Для полноценного **audit-ready GitHub репозитория PanjoCoin** после этого документа логично добавить:

```

docs/
├── CONTRACT_VERIFICATION.md   ✅
├── DEPLOYMENT_GUIDE.md
├── SECURITY_POLICY.md
├── AUDIT_REPORT.md
├── BUG_BOUNTY.md
├── SMART_CONTRACT_SECURITY.md
├── CONTRACT_ARCHITECTURE.md
└── EMERGENCY_RESPONSE_PLAN.md

```

Следующий наиболее важный документ для доверия аудиторов и CEX/DEX-листингов — **`SECURITY_POLICY.md`**, потому что он показывает публичный процесс управления уязвимостями.
```
