# 🐕 PanjoCoin (PNJC)

## DEX-Ready README v1.0

---

# 📌 Overview

PanjoCoin (PNJC) is a fixed-supply ERC-20 token deployed on **Polygon PoS**, designed for decentralized exchange trading with a fully transparent, non-upgradeable smart contract architecture.

PNJC is a **pure asset token**:

* no governance
* no admin keys
* no minting
* no protocol control layer

---

# ⚙️ Token Details

| Parameter    | Value                                |
| ------------ | ------------------------------------ |
| Name         | PanjoCoin                            |
| Symbol       | PNJC                                 |
| Network      | Polygon (PoS)                        |
| Standard     | ERC-20 + ERC20Permit + ERC20Burnable |
| Total Supply | 1,000,000,000,000                    |
| Decimals     | 18                                   |
| Minting      | Disabled                             |
| Ownership    | None                                 |
| Transfer Tax | 0%                                   |

---

# 📍 Contract Information

**Contract Address:**
`0x781C0d15347Cb0B94C42C65c7a67E70371205De5`

**Explorer:**
[https://polygonscan.com/address/0x781C0d15347Cb0B94C42C65c7a67E70371205De5](https://polygonscan.com/address/0x781C0d15347Cb0B94C42C65c7a67E70371205De5)

---

# 🔄 DEX Deployment Status

## 🟢 Ready for Trading

PNJC is fully compatible with:

* Uniswap V3 (Polygon)
* QuickSwap
* SushiSwap (Polygon forks)

---

## 📊 Trading Pair Setup

Recommended initial pair:

* PNJC / USDT

Alternative pairs:

* PNJC / WETH
* PNJC / MATIC

---

# 💧 Liquidity Model

## Initial Liquidity Requirement

Liquidity is externally provided and not protocol-controlled.

Minimum viable liquidity (market-driven):

* Determined by DEX pool creation
* No enforced threshold in smart contract

---

## LP Mechanics

* LP tokens represent ownership of liquidity position
* LP tokens should be locked via external locker contract
* No internal liquidity management logic exists

---

# 🔥 Supply Model

## Fixed Supply

[
S = 1,000,000,000,000
]

No additional minting is possible:

[
S_{max} = S_{initial}
]

---

## Burn Mechanism

* Holders may burn tokens voluntarily
* Burn reduces circulating supply permanently

[
S_{effective} = S - B
]

---

# 🧱 System Architecture

## 1. Token Layer

* ERC-20 base logic
* deterministic balances
* non-upgradeable contract

## 2. Market Layer

* DEX-based price discovery
* AMM liquidity pools
* permissionless trading

## 3. Ownership Model

* no admin role
* no privileged functions
* no blacklist / pause

---

# 🔐 Security Model

PNJC is designed with the following constraints:

* no upgradeability
* no proxy contracts
* no centralized control
* no hidden mint functions
* deterministic execution

---

# 📈 Market Behavior

Token value is determined exclusively by:

* liquidity depth
* trading volume
* market demand
* holder distribution

No algorithmic pricing exists.

---

# 🧾 Deployment Checklist (DEX Launch)

## Before liquidity add:

* [x] ERC-20 deployed
* [x] contract verified on Polygonscan
* [ ] liquidity pool created
* [ ] initial LP provided
* [ ] LP tokens locked (recommended)
* [ ] trading enabled on DEX UI

---

## After launch:

* index on DexScreener
* index on DexTools
* enable analytics tracking
* monitor LP stability

---

# ⚠️ Risk Disclosure

PNJC involves standard crypto asset risks:

* price volatility
* liquidity fluctuations
* smart contract risk
* market uncertainty

No guarantees of value or returns.

---

# 📌 Classification

PNJC is:

* ERC-20 utility-free asset
* decentralized market token
* fixed-supply Polygon-based digital asset
* fully non-custodial contract system

---

# 🧠 Final Statement

PNJC operates as a **pure decentralized market instrument** with:

* deterministic supply
* no administrative control
* full DEX compatibility
* transparent on-chain behavior
