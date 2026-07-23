# Economic Model  
## PanjoCoin (PNJC)

**Version:** 2.0  
**Aligned with:** WhitePaper v1.0 + Tokenomics v1.0  
**Date:** July 23, 2026  
**Network:** Polygon PoS  
**Token Standard:** ERC-20 + ERC20Permit (EIP-2612) + ERC20Burnable  

**Supersedes:** Economic Model v1.0 (July 2026)

---

# Table of Contents

- [1. Overview](#1-overview)
- [2. Economic Philosophy](#2-economic-philosophy)
- [3. Economic Structure](#3-economic-structure)
- [4. Supply Economics](#4-supply-economics)
- [5. Demand Model](#5-demand-model)
- [6. Value Creation Model](#6-value-creation-model)
- [7. Token Velocity Model](#7-token-velocity-model)
- [8. Supply Release Economics](#8-supply-release-economics)
- [9. Reward Economy](#9-reward-economy)
- [10. Treasury Economics](#10-treasury-economics)
- [11. Liquidity Economics](#11-liquidity-economics)
- [12. Economic Participants](#12-economic-participants)
- [13. Network Effect Model](#13-network-effect-model)
- [14. Economic Sustainability](#14-economic-sustainability)
- [15. Economic Risks](#15-economic-risks)
- [16. Economic Metrics](#16-economic-metrics)
- [17. Long-Term Economic Roadmap](#17-long-term-economic-roadmap)
- [18. Economic Model Summary](#18-economic-model-summary)
- [19. Conclusion](#19-conclusion)
- [20. Changelog](#20-changelog)

---

# 1. Overview

This document defines the economic model of **PanjoCoin (PNJC)**.

The PNJC economic model explains how value is created, distributed, maintained, and expanded inside the ecosystem.

The model is based on:

- Fixed token supply
- Zero-tax transaction layer
- Utility-driven demand
- Community participation
- Social impact incentives
- Sustainable token circulation
- Transparent treasury management

PNJC is designed as a **utility ecosystem token**, not purely as a speculative asset.

According to the Source of Truth hierarchy defined in the WhitePaper, this document is subordinate to:

1. On-chain contract state
2. Blockchain transaction history
3. Verified source code
4. WhitePaper

All figures in this document are reconciled with these sources.

---

# 2. Economic Philosophy

The PNJC economy follows:


Real Utility
↓
Community Participation
↓
Ecosystem Growth
↓
Sustainable Token Economy


The long-term objective is to create sustainable demand through real ecosystem usage rather than speculation.

---

# 3. Economic Structure

The PNJC economy consists of five interconnected layers:

             PNJC Economy

                  |
| | | |
Supply Demand Incentives Governance
| | | |
Fixed Utility Rewards DAO /
Supply Usage Programs Treasury
                  |
          Ecosystem Growth

---

# 4. Supply Economics

## 4.1 Fixed Supply Model

Maximum supply:


1,000,000,000,000 PNJC


Confirmed by the deployed contract `maxSupply()` function.

Supply characteristics:

- No inflation
- No future minting
- `mint()` function does not exist
- No hidden allocations
- No admin-controlled emission
- Contract ownership is renounced (`owner = address(0)`)

---

## 4.2 Supply Allocation

The following allocation is the official source of truth.

| Category | Share | Amount | Control Mechanism |
|---|---:|---:|---|
| Liquidity Pool | 50% | 500,000,000,000 PNJC | PNJCLiquidityLockerV2, 12-month lock |
| Operational Treasury | 12% | 120,000,000,000 PNJC | 3/5 Multisig |
| DAO Treasury | 10% | 100,000,000,000 PNJC | DAO Governance |
| Team | 10% | 100,000,000,000 PNJC | VestingVault, 12 months |
| Community | 8% | 80,000,000,000 PNJC | Airdrops, campaigns, rewards |
| Founder | 5% | 50,000,000,000 PNJC | VestingVault, 12 months |
| Charity Reserve | 5% | 50,000,000,000 PNJC | Public wallet |

**Total Supply:**


100% = 1,000,000,000,000 PNJC


---

# 5. Demand Model

PNJC demand is designed around ecosystem utility.

Important:

> All modules except DEX trading are currently planned, conceptual, or code-ready. They are not active inside the deployed token contract.

---

## 5.1 Ecosystem Utility Demand

**Status: Design Phase**

Future PNJC usage:

- ONE+ platform services
- Premium features
- Digital products
- Ecosystem access

Target launch:


Q3 2027


---

## 5.2 SocialFi Demand

**Status: Conceptual**

Based on the Proof of Kindness (PoK) concept:


Positive Action
↓
Verification
↓
Impact Score
↓
PNJC Reward Economy


PoK is not currently deployed.

---

## 5.3 GameFi Demand

**Status: Design Phase**

Future ONE+ GameFi economy:

- Gameplay rewards
- Digital assets
- NFT interactions
- Competitive events

Planned:


Q3 2027


---

## 5.4 Partner Demand

**Status: Conceptual**

Organizations may use PNJC for:

- Community campaigns
- Social initiatives
- Digital engagement programs

---

## 5.5 Direct DEX Demand

**Status: Active**

Currently active demand source:

- Buying
- Selling
- Trading

Properties:

- 0% transfer tax
- Free transfers
- Open market trading

---

# 6. Value Creation Model

Target ecosystem cycle:


More Users
↓
More Activity
↓
Higher Utility
↓
More Transactions
↓
Greater Ecosystem Value
↓
More Adoption


This represents a strategic objective, not a guaranteed result.

---

# 7. Token Velocity Model

A healthy economy balances:

## Circulation

Tokens used for:

- Payments
- Ecosystem activity
- Rewards

## Retention

Tokens held for:

- Governance
- Ecosystem access
- Long-term participation

Goal:


Sustainable Velocity =
Usage + Retention Balance


---

# 8. Supply Release Economics

PNJC has:

- 0% transaction tax
- 0% burn tax
- No hidden fees

Supply discipline is achieved through vesting.

---

## 8.1 Scheduled Unlock Model

At launch:


Circulating Supply:
10,000,000,000 PNJC (1%)


Locked:


990,000,000,000 PNJC (99%)


Release:


5% of remaining locked supply annually


Example:

| Year | Locked Supply | Circulating Supply |
|---|---:|---:|
| Launch | 990B | 10B |
| Year 1 | 940.5B | 59.5B |
| Year 2 | 893.48B | 106.52B |
| Year 3 | 848.80B | 151.20B |
| Year 5 | 766.04B | 233.96B |
| Year 10 | 592.75B | 407.25B |

---

# 9. Reward Economy

**Status: Conceptual**

Future reward sources:

- Community programs
- Social Mining
- Proof of Kindness
- GameFi activities
- Ecosystem contributions

Rules:

- Rewards funded only from Community allocation (8%)
- No new minting
- No inflation mechanism

---

# 10. Treasury Economics

## Operational Treasury

Allocation:


120,000,000,000 PNJC
(12%)


Purpose:

- Development
- Marketing
- Partnerships
- Grants
- Ecosystem growth

Management:


3/5 Multisig


---

## DAO Treasury

Allocation:


100,000,000,000 PNJC
(10%)


Activated after DAO deployment.

---

# 11. Liquidity Economics

Liquidity allocation:


500,000,000,000 PNJC
(50%)


Purpose:

- Market accessibility
- Trading availability
- Price discovery

DEX:


Uniswap V2


Liquidity protection:

- PNJCLiquidityLockerV2
- 12-month lock
- No emergency withdrawal
- Reentrancy protection

---

# 12. Economic Participants

## Users

Role:

- Consume services
- Participate in ecosystem

Benefits:

- Future rewards
- Ecosystem access

---

## Contributors

Role:

- Create ecosystem value

Benefits:

- PNJC incentives
- Reputation

---

## Developers

Role:

- Build applications

Benefits:

- DAO grants
- Community support

---

## Partners

Role:

- Expand adoption

Benefits:

- Access to ecosystem economy

---

# 13. Network Effect Model


More Users
↓
More Content
↓
More Utility
↓
More Demand
↓
More Growth
↓
More Users


This is an aspirational long-term model.

---

# 14. Economic Sustainability

Sustainability depends on:

## Demand Growth

Driven by:

- Utility expansion
- Partnerships
- Applications

## Controlled Supply

Managed through:

- Vesting
- Unlock schedules
- Treasury discipline

## Responsible Rewards

Rules:

- Contribution-based
- Anti-abuse mechanisms
- Community allocation only

---

# 15. Economic Risks

| Risk | Impact | Mitigation |
|-|-|-|
| Low Adoption | Reduced demand | Product development, partnerships |
| Selling Pressure | Market volatility | Vesting + liquidity locks |
| Reward Inflation | Reduced value | Fixed community allocation |
| Speculation Dependency | Economic instability | Utility-first approach |
| Documentation inconsistency | Loss of trust | Single source of truth |

---

# 16. Economic Metrics

## Adoption Metrics

- Holder count
- Active wallets
- Transactions
- Community growth

## Financial Metrics

- Liquidity depth
- Trading volume
- Treasury balance

## Utility Metrics

Until deployment:


PoK = N/A
GameFi = N/A
ONE+ = N/A


---

# 17. Long-Term Economic Roadmap

## Phase 1 — Foundation

**Months 1-2**

- Token trading
- Audits
- LP locks
- Merkle Airdrop
- VestingVault

---

## Phase 2 — Utility Groundwork

**Months 3-6**

- DAO preparation
- Governance deployment

---

## Phase 3 — Expansion

**Months 7-18**

- ClownCare Bridge
- ONE+ development
- Community beta

---

## Phase 4 — Decentralization

**Months 19-24**

- DAO governance
- Ecosystem expansion

---

# 18. Economic Model Summary

PNJC is based on:

- Fixed supply
- Zero transaction tax
- Utility-driven demand
- Community incentives
- Charity impact
- Controlled treasury management

The objective:

> Build a sustainable Web3 economy connecting blockchain technology, SocialFi, GameFi, governance, and real-world impact.

---

# 19. Conclusion

PanjoCoin transforms a simple token into an ecosystem coordination mechanism.

The economic model combines:

- Blockchain economics
- SocialFi
- GameFi
- DAO governance
- Charity impact
- Sustainable token management

Success depends on:

- Transparent operations
- Continuous development
- Real utility adoption
- Responsible economic management

---

# 20. Changelog

## Version 1.0 → Version 2.0

| Section | Previous | Updated |
|-|-|-|
| Allocation | Incorrect totals | Fixed 100% allocation |
| Taxes | Burn tax references | Removed, 0% tax confirmed |
| DEX | Multiple venues | Uniswap V2 only |
| Modules | Mixed status | Active / Planned / Conceptual labels added |

---

© 2026 CryptoTengo  
PanjoCoin (PNJC)
