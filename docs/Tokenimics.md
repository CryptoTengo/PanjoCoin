# 📊 PanjoCoin (PNJC) — Official Tokenomics v.1.0

Я вставил все кошельки прямо в токеномику и аккуратно синхронизировал их с разделами (чтобы это выглядело как единый WhitePaper-документ, а не просто список адресов).

---

# 📊 PanjoCoin (PNJC) — Tokenomics v1.1 (WhitePaper-Aligned + Wallet Layer)

**Version 1.1 | June 2026**
*Fully aligned with WhitePaper v1.0 + on-chain wallet architecture*

---

## 📌 0. Core Principle Alignment

PNJC Tokenomics is a direct extension of:

* Smart contract (immutable layer)
* Operational wallet architecture (off-chain execution layer)

---

## 🪙 1. Token Identity

| Parameter  | Value                            |
| :--------- | :------------------------------- |
| Token Name | PanjoCoin                        |
| Symbol     | PNJC                             |
| Network    | Polygon PoS                      |
| Max Supply | 1,000,000,000,000 PNJC           |
| Standard   | ERC-20 + ERC-20Permit + Burnable |

---

## 🧠 2. Wallet Architecture Layer (NEW — FULL ON-CHAIN MAPPING)

All PNJC supply is distributed into **7 verified operational wallets**.

---

## 📊 3. Full Token Distribution (WITH ADDRESSES)

### 🧩 Fixed Allocation Model (100%)

| Category                      | %   | Amount          | Wallet Address                               | Role                              |
| :---------------------------- | :-- | :-------------- | :------------------------------------------- | :-------------------------------- |
| Liquidity Pool                | 50% | 500,000,000,000 | `0xf55B994FDD7019d8E99c632c76A6e0AdE765988A` | DEX Liquidity (Uniswap V3 LP)     |
| Project Treasury              | 12% | 120,000,000,000 | `0xD539a54f54e9B174F831D9Da6b48ac15441fC581` | Development + operations          |
| DAO Treasury                  | 10% | 100,000,000,000 | `0xD5e2DD65BA4984565b53EFdcec6A9D2F494b5FE2` | Governance-controlled funds       |
| Core Team                     | 10% | 100,000,000,000 | `0xdEBACbF7f51C3865dc2034ED676D3d344954f9FE` | Team allocation (vesting planned) |
| Community & Growth            | 8%  | 80,000,000,000  | `0x54D3beB9e0F473803cC7a972Db2C17f005a2D089` | Rewards + airdrops                |
| Founder (Tengo)               | 5%  | 50,000,000,000  | `0xF48840486697AE3c15D38E30e45cECB9897CfA74` | Strategic founder allocation      |
| Charity Reserve (SmileDonate) | 5%  | 50,000,000,000  | `0xa22E471BF4e405c92bDD074792d8d36923e31055` | ClownCare program                 |

---

## 🔄 4. Operation Range (UPDATED)

### ✔️ Definition

**Operation Range = 10% of Total Supply**

```text
Operation Range Wallet Exposure:
= Liquidity + Active Circulation
= 100,000,000,000 PNJC
```

### ✔️ Source Wallets contributing to Operation Range:

| Wallet                                       | Contribution                       |
| :------------------------------------------- | :--------------------------------- |
| `0xf55B994FDD7019d8E99c632c76A6e0AdE765988A` | Primary liquidity (dominant)       |
| `0x54D3beB9e0F473803cC7a972Db2C17f005a2D089` | Community active circulation       |
| `0xD539a54f54e9B174F831D9Da6b48ac15441fC581` | Partial treasury liquidity support |

---

## 🔁 5. Supply Control Model

All wallets operate under **off-contract logic only**:

* No mint authority exists
* No admin override exists
* Transfers only via wallet-to-wallet execution

---

## 🔒 6. Security Wallet Layer

### 🧱 Immutable Contract Layer

* No owner
* No mint
* No tax

---

### 🧱 Operational Wallet Layer

| Type      | Wallet                                       |
| :-------- | :------------------------------------------- |
| Liquidity | `0xf55B994FDD7019d8E99c632c76A6e0AdE765988A` |
| Treasury  | `0xD539a54f54e9B174F831D9Da6b48ac15441fC581` |
| DAO       | `0xD5e2DD65BA4984565b53EFdcec6A9D2F494b5FE2` |
| Team      | `0xdEBACbF7f51C3865dc2034ED676D3d344954f9FE` |
| Community | `0x54D3beB9e0F473803cC7a972Db2C17f005a2D089` |
| Founder   | `0xF48840486697AE3c15D38E30e45cECB9897CfA74` |
| Charity   | `0xa22E471BF4e405c92bDD074792d8d36923e31055` |

---

## 💧 7. Liquidity Structure

* DEX: Uniswap V3
* Pair: PNJC / USDT (or POL)
* Primary liquidity wallet:
  `0xf55B994FDD7019d8E99c632c76A6e0AdE765988A`
* Lock mechanism: Planned (6–12 months)

---

## 🏦 8. Treasury System

### Project Treasury

`0xD539a54f54e9B174F831D9Da6b48ac15441fC581`

Used for:

* marketing
* dev
* ecosystem scaling
* liquidity reinforcement

---

### DAO Treasury

`0xD5e2DD65BA4984565b53EFdcec6A9D2F494b5FE2`

Controlled via:

* Snapshot voting
* multisig execution (planned)

---

## 🎯 9. Charity Wallet (100% Transparent)

Wallet:
`0xa22E471BF4e405c92bDD074792d8d36923e31055`

Purpose:

* SmileDonate foundation
* ClownCare pediatric program
* Iashvili Hospital support

---

## 👤 10. Founder Wallet

Wallet:
`0xF48840486697AE3c15D38E30e45cECB9897CfA74`

Role:

* long-term alignment
* vested release model (planned)
* no control over protocol

---

## 👥 11. Team Wallet

Wallet:
`0xdEBACbF7f51C3865dc2034ED676D3d344954f9FE`

Role:

* development compensation
* vesting-based release (planned)
* aligned with global unlock curve

---

## 📊 12. Community Wallet

Wallet:
`0x54D3beB9e0F473803cC7a972Db2C17f005a2D089`

Role:

* airdrops
* incentives
* engagement campaigns

---

## 🔥 13. Deflationary Mechanics

* Burnable ERC-20
* No minting
* Lost wallet entropy
* voluntary burns

---

## 📈 14. Final System Integrity

| Layer               | Status        |
| :------------------ | :------------ |
| Smart Contract      | Immutable     |
| Wallet Distribution | Complete      |
| Operation Range     | Defined (10%) |
| Liquidity Structure | Active        |
| DAO Layer           | Planned       |
| Vesting Layer       | Planned       |
| Charity Layer       | Active        |

---

## 🏁 Conclusion

PNJC Tokenomics is now a **fully wallet-mapped economic system**, where:

* every allocation has a real address
* every supply segment is traceable
* Operation Range defines real market exposure (10%)
* liquidity dominates stability model (50%)

Operation Range defines real market exposure (10%)
liquidity dominates stability model (50%)
