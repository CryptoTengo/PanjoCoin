# 📘 PanjoCoin (PNJC) — WHITEPAPER v1 (SYNCHRONIZED VERSION WITH CODE)
**Document Version:** 1.0  
**Date:** July 4, 2026  
**Status:** Official Agreed Document, Synchronized with Smart Contracts

________________________________________

## 1. INTRODUCTION

### 1.1 General Project Description
PanjoCoin (PNJC) is a next‑generation utility memecoin built on the Polygon PoS blockchain. The project combines meme culture, social gamification, decentralised governance, and real‑world charity with on‑chain transparency.

Unlike classic memecoins, the value of PNJC is created through real user participation in the ecosystem: performing good deeds, creating content, and engaging in governance. The core innovation — **Proof of Kindness** — allows social activity to be monetised.

### 1.2 Vision and Mission
**Vision:** To become a global movement that unites people around the ideals of kindness and mutual support, using blockchain as a tool for positive change.

**Mission:** To build a decentralised ecosystem where every user can monetise social activity, participate in charity, and receive digital recognition for their contribution to the community, while ensuring full transparency and security.

________________________________________

## 2. CORE PROJECT PARAMETERS

| Parameter | Value |
|-----------|-------|
| **Name** | PanjoCoin |
| **Ticker** | PNJC |
| **Blockchain** | Polygon PoS |
| **Standard** | ERC‑20 + EIP‑2612 (Permit) + ERC‑20 Burnable |
| **Total Supply** | 1,000,000,000,000 PNJC (fixed, no additional minting) |
| **Decimals** | 18 |
| **Model** | Deflationary (automatic burning via Golden Phoenix) |
| **Mint** | None (permanently removed) |
| **Ownership** | Renounced (administrative rights revoked) |
| **Upgradeability** | None (immutable code) |
| **Tax** | 0% on all transactions |
| **Blacklist / Freeze** | None |
| **Primary DEX** | QuickSwap V2 (70% liquidity) + Uniswap V3 (30%) |
| **Contract Address** | `0x781C0d15347Cb0B94C42C65c7a67E70371205De5` |

________________________________________

## 3. DEFLATIONARY MECHANISM — GOLDEN PHOENIX PROTOCOL

The Golden Phoenix Protocol is an automated algorithm that creates sustained deflationary pressure through external USDT inflows (revenues from partners, NFT marketplace, voluntary contributions). The protocol is governed by the DAO and multisig, ensuring transparency and decentralised control.

### 3.1 Full Operational Algorithm
The protocol executes the following steps each cycle:

1. **USDT Inflow**  
   USDT is received at the protocol address from external sources (partner fees, ecosystem revenues, voluntary contributions).

2. **Insurance Fund Reservation (`insurancePercent`)**  
   5% of the received amount is directed to the Insurance Fund. This fund is used to protect the PNJC price when it falls below the established level (price floor).  
   The parameter is DAO‑adjustable within the range of 3–10%.

3. **Buyback Amount Calculation (`buybackPercent`)**  
   After reserving the Insurance Fund, the remaining 95% of USDT is distributed as follows:
   - `buybackPercent` (default 25%) of the remaining amount is allocated to buy back tokens via DEX.
   - The remaining funds are accumulated on the contract balance for future cycles, allowing capital to be built up for larger buybacks.  
   The `buybackPercent` parameter is DAO‑adjustable within the range of 15–35%.

4. **Conversion to PNJC**  
   The amount determined in step 3 is converted to PNJC via the QuickSwap V2 Router through the path USDT → WMATIC → PNJC, respecting the maximum slippage (`maxSlippageBps`).

5. **Burning (`burnPercent`)**  
   50% of the purchased tokens are permanently burned (sent to the dead address or via the `burn` function).  
   The parameter is DAO‑adjustable within the range of 30–70%.

6. **Community Rewards (`rewardPercent`)**  
   The remaining 50% of purchased tokens are sent to the community rewards pool for distribution through Proof of Kindness, Social Mining, and Kindness Challenges.  
   The parameter is DAO‑adjustable within the range of 30–70%.

7. **Price Protection (optional)**  
   If the PNJC price falls below the established price floor, the multisig (3/5) may initiate the use of Insurance Fund assets for buybacks and burning to stabilise the price.

### 3.2 Visual Diagram of the Protocol

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                        GOLDEN PHOENIX PROTOCOL                             │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  1️⃣ USDT Inflow (partners, revenues, contributions)                        │
│                  │                                                          │
│                  ▼                                                          │
│  2️⃣ Reserve 5% → Insurance Fund (insurancePercent)                        │
│                  │                                                          │
│                  ▼                                                          │
│  3️⃣ Remaining 95% USDT                                                     │
│                  │                                                          │
│     ┌────────────┴────────────┐                                            │
│     │                         │                                            │
│     ▼                         ▼                                            │
│  25% for buyback         75% accumulated                                   │
│  (buybackPercent)        (on contract balance)                             │
│     │                                                                       │
│     ▼                                                                       │
│  4️⃣ Convert USDT → PNJC via QuickSwap                                     │
│     │                                                                       │
│     ▼                                                                       │
│  5️⃣ 50% BURNED (burnPercent)                                               │
│     │                                                                       │
│     ▼                                                                       │
│  6️⃣ 50% → Community Rewards Pool (rewardPercent)                           │
│                                                                             │
│  🔄 Cycle repeats upon new USDT inflows                                    │
│                                                                             │
│  🛡️ If price drops below price floor → Insurance Fund activation           │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 3.3 Protocol Parameters (DAO‑Adjustable)

| Parameter | Description | Default Value | Adjustment Range |
|-----------|-------------|---------------|------------------|
| `insurancePercent` | Share of USDT reserved in the Insurance Fund | 5% | 3–10% |
| `buybackPercent` | Share of remaining USDT allocated to token buybacks | 25% | 15–35% |
| `burnPercent` | Share of purchased tokens permanently burned | 50% | 30–70% |
| `rewardPercent` | Share of purchased tokens sent to the rewards pool | 50% | 30–70% |
| `priceFloor` | Minimum price triggering the protection mechanism | 0.000000001 PNJC | Subject to DAO review |
| `minExecutionAmount` | Minimum USDT amount to activate the protocol | 100 USDT | 50–10,000 USDT |
| `maxSlippageBps` | Maximum acceptable slippage during swaps | 300 bps (3%) | 50–1000 bps |

**Important smart‑contract constraints:**
- `insurancePercent + buybackPercent == 30` (the sum of these two parameters always equals 30%)
- `burnPercent + rewardPercent == 100` (the sum always equals 100%)

### 3.4 Why is `buybackPercent` not 100%?

**Technical rationale:**
The protocol does not convert all 95% of USDT into PNJC in a single cycle for several reasons:

1. **Slippage Reduction**  
   Large one‑time buybacks can significantly increase the PNJC price, amplifying slippage and making burning less efficient. Gradual buybacks minimise market impact.

2. **Capital Accumulation**  
   Accumulated funds allow for larger buybacks during periods of low liquidity or significant inflows, maximising the deflationary effect.

3. **Management Flexibility**  
   The DAO can adjust `buybackPercent` based on market conditions, increasing buybacks when liquidity is high and reducing them when it is low.

4. **Strategic Reserving**  
   A portion of funds remains on the protocol balance for emergency situations (e.g., to activate price protection via the Insurance Fund without external funds).

### 3.5 Economic Impact

- **Continuous reduction of circulating supply:** Each cycle burns a portion of tokens.
- **Incentivising activity:** 50% of tokens are returned to the community as rewards.
- **Protection against sharp declines:** The Insurance Fund (5% of inflows) provides price protection.
- **Governance flexibility:** The DAO can adapt protocol parameters to market conditions.

________________________________________

## 4. TOKENOMICS (UNIFIED VERSION 3.1)

### 4.1 Total Supply
Fixed — 1,000,000,000,000 PNJC.

### 4.2 Distribution

| Category | % | Amount | Purpose |
|----------|---|--------|---------|
| **Liquidity (DEX)** | 50% | 500B | Providing trading on QuickSwap and Uniswap. LP tokens locked for 12 months. |
| **Project Treasury** | 12% | 120B | Development, marketing, legal support, future audits, listings. Managed by 3/5 multisig. |
| **Team** | 10% | 100B | Team compensation. Vesting: 6‑month cliff, 12‑month linear unlock (1/12 monthly). |
| **DAO Treasury** | 10% | 100B | Managed by PNJC holders through votes (quorum 5%). |
| **Founder** | 5% | 50B | Vesting: 6‑month cliff, 12‑month linear unlock. |
| **Airdrop** | 5% | 50B | Merkle drop for early users. Unclaimed tokens burned after 3 months. |
| **Charity Reserve** | 5% | 50B | Donations to verified funds (selected via DAO). All transactions public. |
| **Community Rewards** | 3% | 30B | Incentives for PoK, Social Mining, Challenges. Monthly budget; unused amounts burned. |

**Sum Check:** 50+12+10+10+5+5+5+3 = 100%.

### 4.3 Vesting Model

- **Cliff:** 6 months (tokens are not unlocked).
- **Vesting:** 12 months linearly, with equal monthly instalments (1/12) of the total vesting allocation.
- All vesting contracts are public and verified.

________________________________________

## 5. SOURCES OF DEMAND (UTILITIES)

| Scenario | Action | Impact on Demand |
|----------|--------|------------------|
| **Proof of Kindness** | Payment for verification of good deeds | Constant small expenditure |
| **Impact Score** | Burning tokens to accelerate rank growth | Deflationary effect |
| **Social Mining** | Collateral of PNJC for participation | Temporary lock‑up |
| **DAO Voting** | Minimum balance for participation | Token retention |
| **Kindness Challenges** | Entry fee in PNJC | Consumption |
| **ONE+ Platform** | Payment for premium services | Regular spending |
| **NFT / Status Levels** | Purchase with PNJC | Burning or lock‑up |
| **Charity** | Voluntary donations | Removal from circulation |

________________________________________

## 6. DAO GOVERNANCE

- **Platform:** Snapshot (off‑chain) with possible transition to on‑chain.
- **Voting Weight:** 1 PNJC = 1 vote.
- **Quorum:** 5% of circulating supply for standard proposals; 10% for amendments to the Agreement; 3% for emergency proposals.
- **Voting Period:** 5 days (48 hours for emergency proposals).
- **Proposal Types:** changes to Golden Phoenix parameters (`insurancePercent`, `buybackPercent`, `burnPercent`, `rewardPercent`, `priceFloor`, `minExecutionAmount`, `maxSlippageBps`), allocation of treasury funds, selection of charitable organisations, addition of new utilities, amendments to the Agreement.

The multisig wallet (3/5) executes DAO‑approved transactions and has veto power only in emergency cases (hack, error) with mandatory public justification.

________________________________________

## 7. CHARITABLE MODEL

- **Transparency:** all charity wallet transactions are public on PolygonScan.
- **Selection of organisations:** determined by the DAO based on community proposals.
- **Primary partner:** ClownCare (supporting children in Tbilisi hospitals).
- **Incentives:** users who donate through the project receive additional Impact Score points (not financial benefit).

________________________________________

## 8. RISK MANAGEMENT

The principal risks are detailed in the separate **Risk Disclosure Statement**. Key measures:

- **Market risks:** the project does not guarantee price stability; users act at their own risk.
- **Technical risks:** the contract is immutable, but an external security audit has not yet been conducted (planned in the coming months). Users assume heightened technical risk.
- **Regulatory risks:** the project is decentralised; users must comply with local legislation.
- **Liquidity risks:** LP tokens are locked for 12 months; a reserve is in place.
- **Concentration risks:** token distribution prevents the dominance of a single address.

________________________________________

## 9. ROADMAP

| Phase | Period | Key Events |
|-------|--------|------------|
| **Pre‑Launch** | Q3 2026 | Contract development and verification; document publication; social media launch; airdrop; community building. |
| **Launch** | Q4 2026 | Liquidity deployment on DEX; LP lock; trading start; publication on aggregators; marketing campaign. |
| **Growth** | Q1–Q2 2027 | Launch of PoK, Impact Score, Social Mining, challenges; Global Kindness Map integration; partnership with ClownCare. |
| **Expansion** | Q3–Q4 2027 | CEX listings; ONE+ launch; multi‑chain expansion; institutional partnerships; NFT collection; full DAO. |
| **Maturity** | 2028+ | Full decentralisation; international recognition; real‑sector integration; Proof of Kindness Foundation; 1M+ users. |

________________________________________

## 10. LEGAL STATUS

PanjoCoin (PNJC) is a digital utility asset and is not a security, investment contract, or financial instrument. The project does not guarantee income or return of funds. All interactions are at the user’s own risk. The full list of restrictions and risks is set out in the **Disclaimer** and **Risk Disclosure Statement**. The project documentation complies with DEX listing standards and the requirements of Swiss legislation.

________________________________________

## 11. CONCLUSION

PanjoCoin (PNJC) is a new‑generation memecoin that addresses fundamental industry issues: lack of utility, centralisation, opacity, and absence of social capital. Through its unique concept of Proof of Kindness, the automatic deflationary Golden Phoenix mechanism with flexible parameters (`buybackPercent`, `insurancePercent`, `burnPercent`), decentralised governance, and transparent charity, the project builds a sustainable ecosystem where kindness becomes a valuable asset.

Join the movement. Be kind. Be Panjo. 🐾

________________________________________

**Document Version:** 1.0  
**Date:** July 4, 2026  
**Status:** Official Agreed Document, Synchronized with Smart Contracts

________________________________________

*This document is an integral part of the PanjoCoin legal package and should be read in conjunction with the Terms of Use (v2.0), Privacy Policy (v2.0), Disclaimer (v2.0), Risk Disclosure Statement (v2.0), DAO Operating Agreement (v2.0), and Tokenomics (v3.1).*
