### PanjoCoin (PNJC) — Tokenomics Document
Version: 2.2 
Date: August 2, 2026 
Network: Polygon PoS
Total Supply: 1,000,000,000,000 PNJC (fixed)

> **Revision note (v2.2):** This version fixes two issues found during a documentation audit: (1) the on‑chain `maxSupply()` figure in Section 2.1 was arithmetically incorrect by six orders of magnitude and has been corrected; (2) statements describing the Liquidity Locker, VestingVault, TreasuryVault, MerkleAirdrop, and the full 3/5 multisig as already locked/active have been changed to future/conditional tense, since these modules are code‑complete but **not yet deployed to mainnet**. For live deployment status, see the "Current Project Status" table in the project README, which takes precedence over this document (see Whitepaper Section 14, "Source of Truth").

## 1. Overview
PanjoCoin is a utility token built on Polygon PoS with a fixed supply model. This document details the token distribution, release schedule, governance controls, and transparency measures that ensure long‑term sustainability, clarity, and alignment of incentives among all stakeholders.

All smart contracts are non‑upgradeable, the base token is ownerless, and every additional module will be audited by independent firms before activation and deployment. The tokenomics are designed to prevent inflation, reward long‑term holders, and fund both ecosystem development and charitable initiatives — without imposing any transaction taxes or hidden mechanisms.

## 2. Fixed Supply and Distribution

### 2.1. Total Supply
The total supply is 1,000,000,000,000 PNJC (1 trillion). The `mint()` function is permanently disabled, and no additional tokens can ever be created.

**On‑Chain Verification:**

Contract: `0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF`

`maxSupply()` returns `1000000000000000000000000000000` — i.e. 1,000,000,000,000 PNJC expressed in the token's 18 decimals (1 trillion × 10¹⁸ = 10³⁰).

> *Correction: earlier versions of this document quoted this value as `1000000000000000000000000` (10²⁴), which understated the correct figure by a factor of one million. The value above has been verified against 1 trillion × 10¹⁸ and should be independently re‑checked against the `maxSupply()` return value on PolygonScan before being relied upon.*

No `mint()` function exists in the contract code.

### 2.2. Allocation Breakdown

| Category | Share | Amount (PNJC) | Control Mechanism | Deployment Status |
|---|---|---|---|---|
| Liquidity Pool (Uniswap V2) | 50% | 500,000,000,000 | Will be locked via PNJCLiquidityLockerV2 for 12 months once deployed, with no early withdrawal | 🧩 Code ready — **not deployed; LP is not currently locked** |
| Operational Treasury | 12% | 120,000,000,000 | 3/5 Multisig. Used for operational expenses, listings, and partnerships | ⏳ Multisig setup in progress — **1 of 5 signers currently appointed** |
| DAO Treasury | 10% | 100,000,000,000 | Will be controlled by DAO after launch (targeted Q4 2026). Grants, community initiatives | 🧩 Code ready — not deployed |
| Team | 10% | 100,000,000,000 | Will be locked in VestingVault once deployed. 6‑month cliff + 12‑month linear vesting | 🧩 Code ready — not deployed |
| Community | 8% | 80,000,000,000 | Airdrops, referral bonuses, marketing campaigns, community rewards — to be distributed via PNJCMerkleAirdrop once deployed | 🧩 Code ready — not deployed |
| Founder | 5% | 50,000,000,000 | Will be locked in VestingVault once deployed. 12‑month cliff + 24‑month linear vesting | 🧩 Code ready — not deployed |
| Charity Reserve | 5% | 50,000,000,000 | Public wallet for transparent charitable donations. All transactions on‑chain | ✅ Wallet public and active |

Verification: 500 + 120 + 100 + 100 + 80 + 50 + 50 = 1,000 billion PNJC (100%).

**Important:** until the corresponding contract is deployed and funded, allocations marked "not deployed" above are held on a project/founder‑controlled address and are **not technically locked, vested, or restricted** in any way. Only the Charity Reserve currently operates under its intended control mechanism.

### 2.3. Control Mechanisms

| Mechanism | Status | Description |
|---|---|---|
| Liquidity Lock | 🧩 Code Ready — not deployed | Once deployed, 50% of supply will be locked in an immutable, ownerless contract (PNJCLiquidityLockerV2) for 12 months with no early withdrawal. Not active today. |
| Vesting Contracts | 🧩 Code Ready — not deployed | Once deployed, Team and Founder allocations will be subject to linear vesting (Team: 6‑month cliff + 12 months; Founder: 12‑month cliff + 24 months). Not active today. |
| Multisig Wallets | ⏳ Partially active (1/5 signers) | Treasury wallets (Operational and DAO) are intended to be protected by a 3/5 multisig until DAO takes over. Currently only the founder's key is appointed; the 3‑signature threshold cannot yet be met. |
| DAO Governance | 🧩 Code Ready — not deployed | Key parameters (treasury spending, charitable programs, ecosystem initiatives) will be subject to community votes once the DAO Governor is deployed. |

## 3. Circulation Model

### 3.1. Initial Circulating Supply
At launch, 1% of total supply entered circulation — 10,000,000,000 PNJC, intended to provide initial DEX liquidity and community incentives. As of this revision, no Uniswap V2 pool has been created yet — see Whitepaper Section 2.

### 3.2. Locked Supply and Release Schedule
The remaining 99% (990,000,000,000 PNJC) is intended to be locked and released gradually once the VestingVault and related contracts are deployed. **As of this revision, this 99% is not yet locked by any contract** — it is held on project‑controlled addresses pending deployment (see Section 2.3).

**Release Formula (target, once deployed):** Each year, 5% of the remaining locked balance enters circulation. This creates a smooth, predictable supply increase that minimises price volatility and aligns with ecosystem growth.

### 3.3. Annual Circulation Table (target schedule)

| Year | Locked (Billion) | In Circulation (Billion) | % in Circulation |
|---|---|---|---|
| 0 (Launch) | 990.00 | 10.00 | 1.00% |
| 1 | 940.50 | 59.50 | 5.95% |
| 2 | 893.48 | 106.52 | 10.65% |
| 3 | 848.80 | 151.20 | 15.12% |
| 4 | 806.36 | 193.64 | 19.36% |
| 5 | 766.04 | 233.96 | 23.40% |
| 6 | 727.74 | 272.26 | 27.23% |
| 7 | 691.35 | 308.65 | 30.86% |
| 8 | 656.79 | 343.21 | 34.32% |
| 9 | 623.95 | 376.05 | 37.61% |
| 10 | 592.75 | 407.25 | 40.72% |

Note: This release schedule will be implemented via the PNJCVestingVault smart contract and will be fully transparent **once that contract is deployed**. It is currently a target model, not a live mechanism.

### 3.4. Benefits of the Model (once deployed)
- Predictable supply – Investors and users can forecast token availability.
- Reduced sell pressure – Gradual unlocks prevent sudden market dumps.
- Long‑term alignment – Team and ecosystem participants are incentivised to build value over years.

## 4. Governance and Treasury Management

### 4.1. DAO Governance
The DAO Governor contract (targeted for Q4 2026, not yet deployed) will allow PNJC holders to propose and vote on:

| Governance Area | Description |
|---|---|
| Treasury Allocation | Approve grants, partnerships, and community initiatives. |
| Ecosystem Upgrades | Non‑contract changes (contracts themselves are immutable). |
| Charity Programs | Select and approve charitable initiatives. |

**Voting Rules (once deployed):**

| Parameter | Value |
|---|---|
| Quorum | 4% of total supply |
| Voting Period | 7 days |
| Proposal Execution | 48‑hour timelock for transparency |
| Voting Power | 1 PNJC = 1 vote |

### 4.2. Multisig Wallets
Until the DAO is fully operational, key decisions are intended to be managed by a 3/5 multisig. **Currently only 1 of 5 seats is filled:**

| Signer | Role | Status |
|---|---|---|
| 1. Tengo Kalandia | Founder | ✅ Appointed |
| 2. (To be appointed) | Technical advisor | ⏳ Open |
| 3. (To be appointed) | Strategic advisor | ⏳ Open |
| 4. (To be appointed) | Backup key (auditor) | ⏳ Open |
| 5. (To be appointed) | Backup key (community representative) | ⏳ Open |

Until at least two more signers are appointed, the multisig cannot reach its 3‑signature threshold, and treasury operations requiring multisig approval are effectively bottlenecked on the founder's key.

**Key Transfer Plan:** After DAO launch, multisig keys will be transferred to elected community members with geographic distribution (Europe, North America, Asia).

## 5. Transparency and On‑Chain Verification

### 5.1. Public Wallets
All distribution addresses are publicly known (the full addresses are available in the GitHub repository) and can be monitored on PolygonScan.

**Monitoring Tools:**
- PolygonScan – Track wallet balances and transactions.
- Dune Analytics – Community dashboards for token flows (planned).
- Custom Analytics – Real‑time supply and distribution metrics (planned).

### 5.2. Verified Code

| Contract | Status | Location |
|---|---|---|
| Token Contract | ✅ Verified and deployed | PolygonScan |
| All Auxiliary Contracts (Locker, VestingVault, TreasuryVault, MerkleAirdrop, DAO Governor) | 🧩 Code Published — not yet deployed | GitHub |

### 5.3. Audits

| Contract | Audit Type | Auditor | Timeline | Status |
|---|---|---|---|---|
| All 5 contracts | Automated static analysis (Slither) | Internal | — | ✅ Completed — 95/100, no critical or high‑severity findings. Bilingual (Georgian/Russian) reports available. |
| PanjoCoin (token) | Independent audit | CertiK | Q2 2026 | ⏳ Not started — original target passed, being rescheduled |
| PNJCLiquidityLockerV2 | Independent audit | CertiK | Q2 2026 | ⏳ Not started — original target passed, being rescheduled |
| VestingVault | Independent audit | CertiK / Hacken | Q3 2026 | ⏳ Not started |
| Airdrop | Independent audit | CertiK / Hacken | Q2 2026 | ⏳ Not started — original target passed, being rescheduled |
| TreasuryVault | Independent audit | CertiK / Hacken | Q3 2026 | ⏳ Not started |
| DAO Governor | Independent audit | CertiK / Hacken | Q4 2026 | ⏳ Not started |

An automated audit is a preliminary sanity check, not a substitute for an independent professional audit. Audit results will be published on the website and GitHub repository in full and unedited, regardless of outcome. No auxiliary module will be deployed to mainnet before its respective independent audit is complete.

### 5.4. Real‑Time Monitoring
The community will have access to:
- Dune Analytics dashboards for token flows, locked amounts (planned).
- On‑chain explorers for all wallet activity (available now via PolygonScan).
- Regular transparency reports from the team.

## 6. Token Utility and Value Accrual
PNJC serves as the native utility token for the PanjoCoin ecosystem:

| Utility | Status | Description |
|---|---|---|
| Charitable Contributions | ✅ Active | Holders can donate directly to the Charity Reserve with full on‑chain transparency. |
| Governance | 🧩 Code Ready — not deployed | Will allow influence over ecosystem development via DAO proposals once the DAO Governor is deployed (targeted Q4 2026). |
| ONE+ Gaming Platform | 🔄 Design Phase | Use PNJC to purchase in‑game items, unlock premium features, and earn rewards. |
| Staking | 🔄 Conceptual — no contract, no timeline | Potential future staking pools that reward holders with a share of ecosystem revenue. Not implemented; do not treat as a near‑term feature. |

### 6.1. Value Accrual Pathways (aspirational — dependent on ecosystem execution)

| Pathway | Description |
|---|---|
| Increased Demand | As ecosystem utility grows, demand for PNJC may increase. |
| Ecosystem Growth | More users and partners may increase token velocity and value. |
| Revenue Sharing | A potential future staking mechanism could distribute ecosystem revenue to holders, if built. |

None of the pathways above are guaranteed outcomes; they describe intended mechanisms contingent on successful, timely execution of the roadmap.

## 7. Risk Factors
While the tokenomics are designed for sustainability, participants should consider:

| Risk | Description | Mitigation (current status) |
|---|---|---|
| Market Volatility | Price of PNJC is subject to crypto market fluctuations. | Liquidity locking is planned but **not yet deployed**; treasury support is limited while the multisig is only 1‑of‑5 appointed. |
| Execution Risk | Deployment of advanced modules may be delayed. | Code is written for all modules; automated (Slither) audit completed; independent professional audits and mainnet deployment are still pending, and original Q2 2026 audit targets have already passed. |
| Regulatory Uncertainty | Changes in global crypto regulations could affect token usage. | Utility‑focused design; legal review has **not yet been performed** — see Legal Disclaimer. |
| Liquidity Risks | No liquidity pool currently exists; once created, pool depth may be insufficient for large orders. | 50% allocation reserved for liquidity; 12‑month lock and gradual unlocks are planned but **not yet active**. |
| Governance/Custody Risk | Treasury and future module deployments currently depend on a single appointed signer. | Multisig framework exists in code; expanding to 3/5 appointed signers is in progress. |
| Adoption Risk | Slower‑than‑expected ecosystem adoption. | Active development, planned partnerships, community incentives. |
| Technical Risk | Unknown vulnerabilities in smart contracts. | OpenZeppelin libraries used; automated audit completed (95/100); independent professional audits still pending; contracts immutable once deployed. |

For a comprehensive list, refer to the Risk Disclosure document in the GitHub repository.

## 8. Comparison: Original vs. Revised Tokenomics

| Parameter | Original (v1.0) | Revised (v2.2) |
|---|---|---|
| Transfer Tax | 0% | 0% (unchanged) |
| Burn Mechanism | Implied transaction tax | None (no deflationary mechanism) |
| Team Vesting | 12‑month linear | 6‑month cliff + 12‑month linear (not yet deployed) |
| Founder Vesting | 12‑month linear | 12‑month cliff + 24‑month linear (not yet deployed) |
| Community Allocation | 8% (undivided) | 8% (Airdrop + Rewards, not yet deployed) |
| DEX | Uniswap V2 | Uniswap V2 (listing pending — no pool live yet) |
| LP Lock Period | 12 months | 12 months (not yet deployed — LP currently unlocked) |

## 9. Conclusion
PanjoCoin's tokenomics combine a fixed supply, a gradual release schedule, and community‑driven governance — all built on a zero‑tax, ownerless token contract. The transparent allocation, planned immutable contracts, and scheduled independent audits are designed to build trust and align incentives among users, the team, and investors, **once fully deployed**. As of this revision, only the token contract itself and the public Charity Reserve wallet are live; all other control mechanisms described in this document are code‑complete but pending deployment.

By linking token value to real utility (gaming, charity, governance), PNJC aims to create a sustainable digital economy with a social impact — without relying on artificial deflationary gimmicks.

**Key Takeaways:**

| Benefit | Description |
|---|---|
| Fixed Supply | No inflation, no hidden emissions. |
| Zero Tax | 0% on all transactions — truly free transfers. |
| Transparent | All wallets, transactions, and code are public, including honest disclosure of what is and isn't deployed yet. |
| Community‑Driven (planned) | DAO governance will enable decentralised control once deployed. |
| Utility‑Focused | Real use cases planned: gaming, charity, governance. |

## 10. Document Information

| Property | Value |
|---|---|
| Document | Tokenomics |
| Version | 2.2 (Reconciled with Whitepaper v2.3 and README v2.0) |
| Date | August 2, 2026 |
| Next Review | After DAO launch (Q4 2026) or upon deployment of any module described above, whichever comes first |
| Status | Official |

For the most current deployment status of any mechanism described in this document, refer to the "Current Project Status" table in the project README, which is updated more frequently than this document.

© 2026 PanjoCoin. All rights reserved.
Document Version: 2.2 (Reconciled)
Last Updated: August 2, 2026
