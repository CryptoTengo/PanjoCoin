# 🟢 PNJC Core Protocol

PNJC (PanjoCoin) is a fixed-supply ERC-20 token system deployed on EVM-compatible networks (e.g., Polygon).

The protocol is designed as a minimal, deterministic, and non-upgradeable token infrastructure with modular ecosystem components for liquidity, vesting, airdrop distribution, and treasury management.

---

## 📌 Key Properties

- Fixed supply: 1,000,000,000,000 PNJC  
- No mint function (permanently disabled after deployment)  
- No upgradeability (immutable smart contracts)  
- ERC20 + ERC20Permit (EIP-2612) support  
- Burnable token mechanics  
- No on-chain governance in current version  

---

## 🏗 Architecture Overview

The PNJC ecosystem consists of independent modules:

### 🧱 Core Token
- ERC20 standard implementation
- Fixed supply minted at deployment
- No admin or owner control

### 💧 Liquidity Layer
- Liquidity managed via external wallets
- LP tokens intended to be locked via Liquidity Locker contract

### 🪙 Vesting Layer
- Linear vesting vault contracts (if deployed)
- Time-based token release schedule
- Beneficiary-controlled claims

### 🎁 Airdrop Layer
- Merkle proof-based distribution system
- One-time claim per address
- Off-chain generated distribution tree

### 🏦 Treasury Layer
- Multisig-controlled wallet
- Used for operational expenses, listings, and ecosystem funding
- No on-chain governance enforcement

---

## ⚠️ Protocol Status

This is **Phase 1: Core Infrastructure Deployment**

- Governance module is NOT implemented
- DAO system is NOT included in current version
- Treasury is managed via multisig (off-chain coordination)

---

## 🔐 Security Model

### ✔ Security Guarantees
- No minting capability after deployment
- No hidden administrative functions
- Deterministic ERC20 behavior
- Immutable contract logic

### ⚠ Trust Assumptions
- Security of multisig wallets
- Correct execution of deployment scripts
- Correct off-chain distribution logic (Merkle generation)
- Reliability of external infrastructure (RPC, DEXs)

---

## 📊 System Classification

PNJC is classified as:

> A fixed-supply ERC-20 token system with modular off-chain governed ecosystem components and multisig-controlled treasury operations.

---

## 📚 Documentation

Full technical specification:

👉 `/docs/protocol-spec.md`

---

## 🧩 Modules

- PNJC Token Contract  
- Liquidity Locker Module  
- Vesting Vault Module  
- Airdrop Claim Module  
- Treasury Multisig Wallet  

---

## 🚀 Deployment Philosophy

PNJC is designed with the following principles:

- Minimize attack surface
- Eliminate upgrade risk
- Avoid privileged roles in token logic
- Separate economic modules by responsibility
- Keep governance off-chain in Phase 1

---

## 📌 Version

- Protocol Version: v1  
- Deployment Stage: Core Infrastructure (Phase 1)  
- Governance Model: Off-chain multisig coordination  
