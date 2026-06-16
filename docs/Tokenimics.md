# 📊 PanjoCoin (PNJC) — Official Tokenomics v1.0

**June 13, 2026**

Strictly aligned with Official WhitePaper v1.0

---

# 📌 1. Purpose

This Tokenomics document defines the economic structure, supply model, distribution model, and circulation mechanics of PanjoCoin (PNJC).

All parameters are derived directly from the Official WhitePaper v1.0 and the deployed smart contract architecture.

No additional economic mechanisms, governance rights, or financial guarantees are introduced in this document.

---

# 🪙 2. Token Overview

| Parameter     | Value                             |
| ------------- | --------------------------------- |
| Token Name    | PanjoCoin                         |
| Symbol        | PNJC                              |
| Network       | Polygon (PoS)                     |
| Standard      | ERC-20 + ERC20Burnable + EIP-2612 |
| Total Supply  | 1,000,000,000,000 PNJC            |
| Decimals      | 18                                |
| Transfer Tax  | 0%                                |
| Mint Function | None                              |
| Owner/Admin   | None                              |

---

# 📊 3. Supply Architecture

## 3.1 Fixed Supply Model

PanjoCoin operates under a permanently capped supply model.

At deployment:

**1,000,000,000,000 PNJC**

were minted.

The protocol contains:

* No mint functionality
* No inflation mechanism
* No supply expansion mechanism
* No owner-controlled issuance

The maximum supply is permanently fixed.

---

## 3.2 Burn Capability

The smart contract includes ERC20Burnable functionality.

Any holder may voluntarily burn tokens from their own balance.

Token burns permanently reduce circulating supply.

No burn mechanism is mandatory or automatic.

---

# 🏦 4. On-Chain Distribution Model

The entire token supply is allocated across seven wallets.

| Category         | Allocation | Amount               |
| ---------------- | ---------- | -------------------- |
| Liquidity        | 50%        | 500,000,000,000 PNJC |
| Project Treasury | 12%        | 120,000,000,000 PNJC |
| DAO Treasury     | 10%        | 100,000,000,000 PNJC |
| Core Team        | 10%        | 100,000,000,000 PNJC |
| Community        | 8%         | 80,000,000,000 PNJC  |
| Founder          | 5%         | 50,000,000,000 PNJC  |
| Charity          | 5%         | 50,000,000,000 PNJC  |

---

## Total Allocation Verification

500B + 120B + 100B + 100B + 80B + 50B + 50B

= 1,000,000,000,000 PNJC

= 100% of total supply

---

# 🔄 5. Circulation Model

## 5.1 Initial Circulating Supply

At listing (T+0):

**100,000,000,000 PNJC**

enter circulation.

This represents:

**10% of total supply**

---

## 5.2 Locked Supply

At genesis:

**900,000,000,000 PNJC**

remain locked.

This represents:

**90% of total supply**

---

## 5.3 Unlock Schedule

Every six months:

**10% of the remaining locked balance**

is released.

The release amount decreases over time because it is calculated from the remaining locked supply.

---

## Unlock Formula

B₀ = 900B

Rₙ = 0.10 × Bₙ₋₁

Bₙ = Bₙ₋₁ − Rₙ

Where:

* B₀ = initial locked supply
* Rₙ = released amount during period n
* Bₙ = remaining locked supply after release

---

# 📈 6. Economic Characteristics

PanjoCoin is designed around three fundamental principles:

### Fixed Supply

A permanently capped token supply with no future minting.

### Transparent Distribution

All allocations exist on-chain and are publicly verifiable.

### Decentralized Architecture

No owner account, no administrative privileges, and no transfer taxation.

---

# 🎭 7. Narrative Foundation

PanjoCoin originates from the story of Panjo, a Shar Pei whose visits brought smiles to children undergoing treatment at M. Iashvili Central Children's Hospital in Tbilisi.

The token combines:

* Meme-driven cultural narrative
* Transparent blockchain distribution
* Charity-oriented utility layer
* Fixed-supply token economics

into a single digital asset ecosystem.

---

# ⚠️ 8. Disclaimer

PanjoCoin (PNJC) is a blockchain-based digital asset.

Nothing in this document constitutes investment advice, financial advice, legal advice, or a guarantee of future performance.

All blockchain assets involve risk, and participation is undertaken solely at the discretion of the holder.

---

# ✅ Tokenomics Summary

* Fixed Supply: 1,000,000,000,000 PNJC
* Maximum Supply: 1,000,000,000,000 PNJC
* Minting: Disabled
* Transfer Tax: 0%
* Owner/Admin: None
* Initial Circulation: 100B PNJC
* Initially Locked: 900B PNJC
* Unlock Frequency: Every 6 Months
* Unlock Rate: 10% of Remaining Locked Supply
* Network: Polygon (PoS)

PanjoCoin is a system where emotional narrative, fixed-supply economics, and transparent on-chain structure merge into one verifiable digital asset.
