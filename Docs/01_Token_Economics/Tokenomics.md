### PanjoCoin (PNJC) — Tokenomics Document
Version: 2.1 (Revised)
Date: July 25, 2026
Network: Polygon PoS
Total Supply: 1,000,000,000,000 PNJC (fixed)

## 1. Overview
PanjoCoin is a utility token built on Polygon PoS with a fixed supply model. This document details the token distribution, release schedule, governance controls, and transparency measures that ensure long‑term sustainability, clarity, and alignment of incentives among all stakeholders.

All smart contracts are non‑upgradeable, the base token is ownerless, and every module will be audited by independent firms before activation. The tokenomics are designed to prevent inflation, reward long‑term holders, and fund both ecosystem development and charitable initiatives — without imposing any transaction taxes or hidden mechanisms.

## 2. Fixed Supply and Distribution
2.1. Total Supply
The total supply is 1,000,000,000,000 PNJC (1 trillion). The mint() function is permanently disabled, and no additional tokens can ever be created.

On‑Chain Verification:

# Contract: 0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF

Function maxSupply() returns 1000000000000000000000000 (1 trillion with 18 decimals).

No mint() function exists in the contract code.

2.2. Allocation Breakdown
Category	Share	Amount (PNJC)	Control Mechanism
Liquidity Pool (Uniswap V2)	50%	500,000,000,000	Locked via PNJCLiquidityLockerV2 for 12 months. No emergency withdrawal.
Operational Treasury	12%	120,000,000,000	3/5 Multisig. Used for operational expenses, listings, and partnerships.
DAO Treasury	10%	100,000,000,000	Controlled by DAO after launch (Q4 2026). Grants, community initiatives.
Team	10%	100,000,000,000	Locked in VestingVault. 6‑month cliff + 12‑month linear vesting.
Community	8%	80,000,000,000	Airdrops, referral bonuses, marketing campaigns, community rewards.
Founder	5%	50,000,000,000	Locked in VestingVault. 12‑month cliff + 24‑month linear vesting.
Charity Reserve	5%	50,000,000,000	Public wallet for transparent charitable donations. All transactions on‑chain.
Verification: 500 + 120 + 100 + 100 + 80 + 50 + 50 = 1,000 billion PNJC (100%).

2.3. Control Mechanisms
Mechanism	Status	Description
Liquidity Lock	🧩 Code Ready	50% of supply locked in an immutable, ownerless contract (PNJCLiquidityLockerV2). 12‑month lock. No early withdrawal.
Vesting Contracts	🧩 Code Ready	Team and founder allocations subject to linear vesting (Team: 6‑month cliff + 12 months; Founder: 12‑month cliff + 24 months).
Multisig Wallets	✅ Active	Treasury wallets (Operational and DAO) protected by 3/5 multisig until DAO takes over.
DAO Governance	🧩 Code Ready	Key parameters (treasury spending, charitable programs, ecosystem initiatives) subject to community votes after launch.
## 3. Circulation Model
3.1. Initial Circulating Supply
At launch, only 1% of total supply enters circulation — 10,000,000,000 PNJC. This includes:

Liquidity pool tokens for initial DEX trading.

A small portion for initial community incentives.

3.2. Locked Supply and Release Schedule
The remaining 99% (990,000,000,000 PNJC) is locked and will be released gradually.

Release Formula:
Each year, 5% of the remaining locked balance enters circulation. This creates a smooth, predictable supply increase that minimises price volatility and aligns with ecosystem growth.

3.3. Annual Circulation Table
Year	Locked (Billion)	In Circulation (Billion)	% in Circulation
0 (Launch)	990.00	10.00	1.00%
1	940.50	59.50	5.95%
2	893.48	106.52	10.65%
3	848.80	151.20	15.12%
4	806.36	193.64	19.36%
5	766.04	233.96	23.40%
6	727.74	272.26	27.23%
7	691.35	308.65	30.86%
8	656.79	343.21	34.32%
9	623.95	376.05	37.61%
10	592.75	407.25	40.72%
Note: The release schedule is implemented via smart contract (PNJCVestingVault) and is fully transparent.

3.4. Benefits of the Model
Predictable supply – Investors and users can forecast token availability.

Reduced sell pressure – Gradual unlocks prevent sudden market dumps.

Long‑term alignment – Team and ecosystem participants are incentivised to build value over years.

## 4. Governance and Treasury Management
4.1. DAO Governance
The DAO Governor contract (planned for Q4 2026) will allow PNJC holders to propose and vote on:

Governance Area	Description
Treasury Allocation	Approve grants, partnerships, and community initiatives.
Ecosystem Upgrades	Non‑contract changes (contracts themselves are immutable).
Charity Programs	Select and approve charitable initiatives.
Voting Rules:

Parameter	Value
Quorum	4% of total supply
Voting Period	7 days
Proposal Execution	48‑hour timelock for transparency
Voting Power	1 PNJC = 1 vote
4.2. Multisig Wallets
Until the DAO is fully operational, key decisions are managed by a 3/5 multisig:

Signer	Role
1. Tengo Kalandia	Founder
2. (To be appointed)	Technical advisor
3. (To be appointed)	Strategic advisor
4. (To be appointed)	Backup key (auditor)
5. (To be appointed)	Backup key (community representative)
Key Transfer Plan:
After DAO launch, multisig keys will be transferred to elected community members with geographic distribution (Europe, North America, Asia).

## 5. Transparency and On‑Chain Verification
5.1. Public Wallets
All distribution addresses are publicly known (the full addresses are available in the GitHub repository) and can be monitored on PolygonScan.

Monitoring Tools:

PolygonScan – Track wallet balances and transactions.

Dune Analytics – Community dashboards for token flows (planned).

Custom Analytics – Real‑time supply and distribution metrics (planned).

5.2. Verified Code
Contract	Status	Location
Token Contract	✅ Verified	PolygonScan
All Auxiliary Contracts	🧩 Code Published	GitHub
5.3. Audits
Independent audits by CertiK / Hacken are scheduled for each module before its deployment:

Contract	Auditor	Timeline
PanjoCoin (token)	CertiK	Q2 2026
PNJCLiquidityLockerV2	CertiK	Q2 2026
VestingVault	CertiK / Hacken	Q3 2026
Airdrop	CertiK / Hacken	Q2 2026
TreasuryVault	CertiK / Hacken	Q3 2026
DAO Governor	CertiK / Hacken	Q4 2026
Audit results will be published on the website and GitHub repository.

5.4. Real‑Time Monitoring
The community will have access to:

Dune Analytics dashboards for token flows, locked amounts.

On‑chain explorers for all wallet activity.

Regular transparency reports from the team.

## 6. Token Utility and Value Accrual
PNJC serves as the native utility token for the PanjoCoin ecosystem:

Utility	Status	Description
ONE+ Gaming Platform	🧩 Design Phase	Use PNJC to purchase in‑game items, unlock premium features, and earn rewards.
Charitable Contributions	✅ Active	Holders can donate directly to the Charity Reserve with full on‑chain transparency.
Governance	🧩 Code Ready	Influence ecosystem development via DAO proposals (Q4 2026).
Staking (Future)	🔄 Conceptual	Plans for staking pools that reward holders with a share of ecosystem revenue.
6.1. Value Accrual Pathways
Pathway	Description
Increased Demand	As ecosystem utility grows, demand for PNJC increases.
Ecosystem Growth	More users and partners increase token velocity and value.
Revenue Sharing	Future staking mechanisms distribute ecosystem revenue to holders.
## 7. Risk Factors
While the tokenomics are designed for sustainability, participants should consider:

Risk	Description	Mitigation
Market Volatility	Price of PNJC is subject to crypto market fluctuations.	Liquidity locking, treasury support.
Execution Risk	Deployment of advanced modules may be delayed.	Code already ready, audits scheduled, transparent roadmap.
Regulatory Uncertainty	Changes in global crypto regulations could affect token usage.	Utility‑focused design, legal review, compliance awareness.
Liquidity Risks	Pool depth may be insufficient for large orders.	50% allocation to liquidity, 12‑month lock, gradual unlocks.
Adoption Risk	Slower‑than‑expected ecosystem adoption.	Active development, partnerships, community incentives.
Technical Risk	Unknown vulnerabilities in smart contracts.	OpenZeppelin libraries, independent audits, immutable contracts.
For a comprehensive list, refer to the Risk Disclosure document in the GitHub repository.

## 8. Comparison: Original vs. Revised Tokenomics
Parameter	Original (v1.0)	Revised (v2.1)
Transfer Tax	0%	0% (unchanged)
Burn Mechanism	Implied transaction tax	None (no deflationary mechanism)
Team Vesting	12‑month linear	6‑month cliff + 12‑month linear
Founder Vesting	12‑month linear	12‑month cliff + 24‑month linear
Community Allocation	8% (undivided)	8% (Airdrop + Rewards)
DEX	Uniswap V2	Uniswap V2 (unchanged)
LP Lock Period	12 months	12 months (unchanged)
## 9. Conclusion
PanjoCoin's tokenomics combine a fixed supply, a gradual release schedule, and community‑driven governance — all built on a zero‑tax, ownerless token contract. The transparent allocation, immutable contracts, and planned audits build trust and align incentives among users, the team, and investors.

By linking token value to real utility (gaming, charity, governance), PNJC aims to create a sustainable digital economy with a social impact — without relying on artificial deflationary gimmicks.

Key Takeaways:

Benefit	Description
Fixed Supply	No inflation, no hidden emissions.
Zero Tax	0% on all transactions — truly free transfers.
Transparent	All wallets, transactions, and code are public.
Community‑Driven	DAO governance ensures decentralised control.
Utility‑Focused	Real use cases: gaming, charity, governance.
## 10. Document Information
Property	Value
Document	Tokenomics
Version	2.1 (Revised)
Date	July 25, 2026
Next Review	After DAO launch (Q4 2026)
Status	Official
© 2026 PanjoCoin. All rights reserved.
Document Version: 2.1 (Revised)
Last Updated: July 25, 2026
