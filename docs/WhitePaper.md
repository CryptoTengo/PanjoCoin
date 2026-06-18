# 📄 PanjoCoin (PNJC) — Whitepaper v1.0

**Audit-Grade Institutional Specification**
**Version 1.0 — 2026**

---

# 📌 1. Overview

PanjoCoin (PNJC) is a fixed-supply ERC-20 token deployed on the Polygon network.

The protocol is designed as a non-upgradeable, non-custodial digital asset with deterministic on-chain behavior.

PNJC does not represent equity, ownership, partnership rights, or any claim on revenue.

---

# ⚙️ 2. System Properties

| Parameter      | Value                                |
| -------------- | ------------------------------------ |
| Token          | PanjoCoin (PNJC)                     |
| Network        | Polygon PoS                          |
| Standard       | ERC-20 + ERC20Permit + ERC20Burnable |
| Total Supply   | 1,000,000,000,000 PNJC               |
| Decimals       | 18                                   |
| Supply Model   | Fixed, non-inflationary              |
| Mint Function  | None                                 |
| Admin Keys     | None                                 |
| Upgradeability | None                                 |
| Transfer Tax   | 0%                                   |

---

# 🧬 3. Core Architecture

PNJC operates as a deterministic smart contract system with no external administrative control.

The protocol consists of three functional layers:

---

## 3.1 Asset Layer

* ERC-20 compliant token
* Fully transferable digital asset
* Compatible with all standard EVM wallets
* Supports EIP-2612 (gasless approvals)

---

## 3.2 Liquidity Layer

* Market-driven price discovery via AMM pools (e.g., Uniswap V3)
* No centralized price control
* Liquidity provided by users
* LP-based trading execution

---

## 3.3 Supply Layer

* Fixed supply minted at deployment
* No minting capability
* No inflation or rebasing mechanism
* Optional user-driven burn (ERC20Burnable)

---

# 📊 4. Supply Model

## 4.1 Fixed Supply Principle

* Total supply: **1,000,000,000,000 PNJC**
* Fully minted at deployment
* Permanently capped on-chain
* No future issuance possible

---

## 4.2 Distribution Model

| Category             | Allocation | Amount |
| -------------------- | ---------- | ------ |
| Liquidity            | 50%        | 500B   |
| Project Treasury     | 12%        | 120B   |
| Core Team            | 10%        | 100B   |
| Community Incentives | 8%         | 80B    |
| Founder              | 5%         | 50B    |
| Charity Allocation   | 5%         | 50B    |

---

## 4.3 Allocation Verification

Total supply check:

500B + 120B + 100B + 80B + 50B + 50B
= **1,000,000,000,000 PNJC (100%)**

---

# 🔄 5. Circulation Model

## 5.1 Initial Circulation

At launch:

* 100,000,000,000 PNJC (10%) enters circulation

---

## 5.2 Locked Supply

* 900,000,000,000 PNJC remains locked at genesis
* Released gradually over time

---

## 5.3 Unlock Mechanism

Every 6 months:

* 10% of remaining locked supply is released

---

### Mathematical Model

```text
B₀ = 900B
Rₙ = 0.10 × Bₙ₋₁
Bₙ = Bₙ₋₁ − Rₙ
```

Where:

* B₀ = initial locked supply
* Rₙ = release amount per period
* Bₙ = remaining locked supply

---

# 📈 6. Economic Design Principles

PNJC is structured around three core principles:

### 6.1 Fixed Supply Integrity

No inflation, no minting, no reissuance.

### 6.2 Market-Based Valuation

Token price is determined solely by open market liquidity.

### 6.3 Non-Custodial Design

No administrative privileges, no blacklist, no freeze functions.

---

# 🧩 7. Narrative Context

PanjoCoin is inspired by the story of Panjo, a Shar Pei associated with emotional presence and comfort in a hospital environment in Tbilisi.

The narrative serves as a cultural identity layer and does not imply financial rights, utility guarantees, or contractual obligations.

---

# 🔐 8. Security Model

The protocol is designed with the following constraints:

* No upgradeable contracts
* No administrative roles
* No mint/burn control by privileged accounts
* No blacklist or pause functions
* Deterministic execution only

---

# ⚠️ 9. Risk Disclosure

PNJC is a blockchain-based digital asset.

Users acknowledge risks including:

* Market volatility
* Liquidity fluctuations
* Smart contract vulnerabilities
* Regulatory uncertainty
* Irreversible blockchain transactions

No guarantees are made regarding price, liquidity, or future utility.

---

# 📌 10. Source of Truth Hierarchy

In case of conflict between documents:

1. On-chain smart contract state (highest authority)
2. Blockchain transaction history
3. Verified smart contract source code
4. Official documentation (this Whitepaper)

---

# 📄 11. Final Classification

PanjoCoin (PNJC) is:

* A fixed-supply ERC-20 token
* A non-upgradeable smart contract system
* A liquidity-driven decentralized asset on Polygon
* A culturally narrative-based digital token
