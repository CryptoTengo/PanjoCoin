# 🐕 PanjoCoin (PNJC)

## Institutional Grade Documentation

**Version 1.0 — 2026**

---

# 📌 Overview

PanjoCoin (PNJC) is a fixed-supply ERC-20 token deployed on the Polygon Mainnet.

It is designed as a transparent, non-upgradeable digital asset with deterministic on-chain behavior and liquidity-driven market pricing.

PNJC does not represent equity, ownership, partnership rights, or any claim on future revenue.

---

# ⚙️ Core Properties

| Parameter        | Value                                |
| ---------------- | ------------------------------------ |
| Token Name       | PanjoCoin                            |
| Symbol           | PNJC                                 |
| Network          | Polygon (PoS)                        |
| Standard         | ERC-20 + ERC20Permit + ERC20Burnable |
| Solidity Version | 0.8.34                               |
| Total Supply     | 1,000,000,000,000 PNJC               |
| Supply Model     | Fixed, non-inflationary              |
| Mint Function    | None                                 |
| Admin Keys       | None                                 |
| Upgradeability   | None                                 |
| Transfer Tax     | 0%                                   |

---

# 📍 Smart Contract Reference

**Contract Address:**
0x781C0d15347Cb0B94C42C65c7a67E70371205De5

**Verified on PolygonScan:**
[https://polygonscan.com/address/0x781C0d15347Cb0B94C42C65c7a67E70371205De5](https://polygonscan.com/address/0x781C0d15347Cb0B94C42C65c7a67E70371205De5)

---

# 🧬 System Architecture

PNJC operates under a strictly deterministic smart contract model with no external administrative control.

The system consists of three functional layers:

---

## 1. Asset Layer (LIVE)

* ERC-20 token standard compliance
* Fixed supply distribution model
* Transferable on-chain asset
* DEX tradable on Polygon liquidity pools

---

## 2. Liquidity Layer (LIVE)

* Market-driven price discovery via AMMs
* Liquidity pool-based trading (e.g., Uniswap V3)
* LP-based execution model
* No centralized price control

---

## 3. Supply Mechanism (LIVE)

* Fixed initial mint at deployment
* No minting capability
* ERC20Burnable enabled (optional user-driven burn)
* No inflation or rebasing mechanisms

---

# 📊 Token Distribution Model

| Category         | Allocation | Amount    |
| ---------------- | ---------- | --------- |
| Liquidity        | 50%        | 500B PNJC |
| Project Treasury | 12%        | 120B PNJC |
| Core Team        | 10%        | 100B PNJC |
| Community        | 8%         | 80B PNJC  |
| Founder          | 5%         | 50B PNJC  |
| Charity Reserve  | 5%         | 50B PNJC  |

---

## Verification

500B + 120B + 100B + 80B + 50B + 50B =
**1,000,000,000,000 PNJC (100%)**

---

# 🔥 Circulation Model

## Initial Circulation (T+0)

* 100,000,000,000 PNJC (10%) enters circulation at launch

---

## Locked Supply

* 900,000,000,000 PNJC remains locked at genesis
* Released gradually over time

---

## Unlock Schedule

Every 6 months:

* 10% of remaining locked supply is released

### Mathematical Model

```text
B₀ = 900B  
Rₙ = 0.10 × Bₙ₋₁  
Bₙ = Bₙ₋₁ − Rₙ
```

---

# 🧠 Economic Design Principles

PNJC is structured around the following principles:

### 1. Fixed Supply Certainty

No inflation, no reissuance, no hidden minting mechanisms.

### 2. Market-Based Pricing

Token value is determined solely by open-market liquidity dynamics.

### 3. Non-Custodial Design

No administrative control, no blacklist functions, no freeze capability.

---

# 🧩 Ecosystem Status Classification

| Component         | Status                    |
| ----------------- | ------------------------- |
| ERC-20 Token      | LIVE                      |
| Liquidity Trading | LIVE                      |
| Burn Mechanism    | LIVE                      |
| Vesting System    | DEPLOYABLE (optional)     |
| Staking System    | NOT DEPLOYED              |
| Governance Layer  | NOT ACTIVE / NOT REQUIRED |

---

# 🐕 Narrative Context

PanjoCoin is inspired by the story of “Panjo”, a Shar Pei dog associated with emotional comfort and presence in a hospital environment in Tbilisi.

This narrative serves as a cultural identity layer and does not imply financial or utility guarantees.

---

# ⚠️ Risk Disclosure

PNJC is a blockchain-based digital asset subject to inherent risks, including but not limited to:

* Market volatility and price fluctuations
* Liquidity constraints
* Smart contract and infrastructure risks
* Regulatory uncertainty

No guarantees are made regarding value, adoption, or future utility.

---

# 📄 Legal Classification

PNJC:

* is not an equity instrument
* does not represent ownership in any entity
* does not confer governance rights
* does not guarantee financial return

---

# 📌 Source of Truth

In case of any inconsistency between documentation and smart contract execution:

> The on-chain smart contract state is the sole source of truth.

---

# 🧾 Final Classification

PanjoCoin (PNJC) is:

* A fixed-supply ERC-20 token
* A non-upgradeable smart contract system
* A liquidity-driven decentralized asset on Polygon
* A culturally narrative-based digital token
---
