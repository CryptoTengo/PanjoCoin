## Vesting
PanjoCoin (PNJC)
Version: 1.1 (Updated)
Date: July 25, 2026
Network: Polygon PoS
Token Standard: ERC-20 (ERC20Burnable + ERC20Permit)
Smart Contract Address: 0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF

## 1. Overview
This document defines the vesting model of PanjoCoin (PNJC).

The purpose of the vesting mechanism is to ensure:

Long-term alignment between contributors and ecosystem growth;

Controlled token circulation;

Reduced market sell pressure;

Investor transparency;

Sustainable ecosystem development.

Vesting applies to allocated tokens that are not part of the initial circulating supply.

## 2. Vesting Principles
The PNJC vesting model follows:

Principle	Description
Long-Term Commitment	Vesting schedules incentivise long-term participation.
Controlled Release	Tokens are released gradually over time.
Transparency	All vesting contracts and schedules are publicly verifiable.
Market Stability	Prevents sudden release of large token amounts into circulation.
3. Total Supply Reference
Property	Value
Maximum Supply	1,000,000,000,000 PNJC
Initial Circulating Supply	10,000,000,000 PNJC (1%)
Locked / Controlled Supply	990,000,000,000 PNJC (99%)
## 4. Initial Circulating Supply
At launch:

Property	Value
Amount	10,000,000,000 PNJC
Percentage	1% of total supply
Purpose	Initial DEX liquidity (Uniswap V2), market creation, price discovery, community access.
## 5. Vesting Allocation Overview
Allocation	Amount (PNJC)	Vesting / Control
Team	100,000,000,000	6-month cliff + 12-month linear vesting
Founder	50,000,000,000	12-month cliff + 24-month linear vesting
Operational Treasury	120,000,000,000	Controlled release via 3/5 Multisig
DAO Treasury	100,000,000,000	Governance controlled (Q4 2026)
Charity Reserve	50,000,000,000	Program-based, on-chain transparent
Community	80,000,000,000	Distribution-based (airdrops, campaigns)
## 6. Team Vesting Schedule
Allocation
Property	Value
Amount	100,000,000,000 PNJC
Percentage	10% of total supply
Purpose	Core contributors, developers, operations team, long-term incentives.
Team Vesting Terms
Property	Value
Cliff Period	6 months (0% unlocked)
Vesting Period	12 months after cliff
Release	Monthly linear unlocks
Release Example
Period	Unlock Status
Month 0-6	Locked (0 PNJC released)
Month 7-18	Monthly linear unlock
Month 18	Fully unlocked
## 7. Founder Vesting Schedule
Allocation
Property	Value
Amount	50,000,000,000 PNJC
Percentage	5% of total supply
Purpose	Founder commitment, strategic development, long-term ecosystem alignment.
Founder Vesting Terms
Property	Value
Cliff Period	12 months (0% unlocked)
Vesting Period	24 months after cliff
Release	Monthly linear unlocks
Timeline
Period	Unlock Status
Year 1	0% (Cliff)
Year 2	Gradual monthly release
Year 3	Continued monthly release
Year 4	Fully unlocked
Reason: Founder allocation demonstrates long-term commitment to the ecosystem.

## 8. Operational Treasury Release Model
Allocation
Property	Value
Amount	120,000,000,000 PNJC
Percentage	12%
Purpose
Development;

Marketing;

Partnerships;

Ecosystem expansion.

Control
Property	Value
Management	3/5 Multisig Wallet
Release Requires	Operational approval, transparent reporting, community communication.
## 9. DAO Treasury Vesting
Allocation
Property	Value
Amount	100,000,000,000 PNJC
Percentage	10%
Purpose
Governance;

Ecosystem grants;

Community initiatives.

Release Mechanism
text
DAO Proposal
        ↓
Community Vote
        ↓
Treasury Execution
        ↓
Public Blockchain Record
Control: DAO Governance (Q4 2026)

## 10. Charity Reserve Vesting
Allocation
Property	Value
Amount	50,000,000,000 PNJC
Percentage	5%
Purpose
Social impact initiatives;

Verified charity programs.

Release Conditions
Condition	Description
Verified Programs	Charitable initiatives must be publicly verified.
Public Reporting	All transactions are on-chain and transparent.
On-Chain Verification	All movements are recorded on PolygonScan.
## 11. Community Allocation Vesting
Allocation
Property	Value
Amount	80,000,000,000 PNJC
Percentage	8%
Purpose
Airdrops;

Referral bonuses;

Marketing campaigns;

Community rewards.

Distribution Method
Method	Description
Merkle Tree Allocation	Gas-efficient distribution.
Sybil Protection	Anti-fraud mechanisms.
Claim Periods	Transparent and time-limited claims.
## 12. Annual Ecosystem Unlock Model
For controlled allocations:

5% of remaining locked supply per year

Annual Circulation Table
Year	Locked Supply (Billion)	Circulating Supply (Billion)	% in Circulation
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
## 13. Circulating Supply Growth Model
Circulating supply increases through:

text
Vesting Releases (Team + Founder)
        +
Community Rewards (Airdrops, Campaigns)
        +
Treasury Allocations (Controlled)
        +
Ecosystem Programs
The release rate must remain aligned with:

Adoption growth;

Liquidity conditions;

Ecosystem demand.

## 14. Vesting Security Requirements
Vesting contracts must support:

Requirement	Description
Transparent Schedules	All unlock dates are publicly known.
Public Verification	Code is verified on PolygonScan.
Immutable Release Rules	No changes to vesting parameters after deployment.
Blockchain Tracking	All releases are on-chain and verifiable.
## 15. Recommended Vesting Contract Features
Future vesting contracts include:

Feature	Description
OpenZeppelin VestingWallet	Industry-standard vesting implementation.
Timelock Protection	Delayed execution for transparency.
Multisig Ownership	3/5 approval for treasury releases.
Public Contract Verification	Code verified on PolygonScan.
## 16. Vesting Risk Management
Risk	Impact	Mitigation
Early Token Dumping	High	Cliff periods, linear vesting, locked wallets.
Excessive Circulation Growth	High	Controlled unlocks (5% annually), treasury governance.
Transparency Concerns	Medium	Public vesting addresses, blockchain verification, regular reports.
Misaligned Incentives	Medium	Vesting aligns team and founder with long-term growth.
## 17. Investor Transparency
Publicly available information:

Information	Source
Allocation Wallets	PolygonScan
Vesting Contracts	PolygonScan
Unlock Dates	On-chain verification
Released Amounts	PolygonScan
Remaining Locked Supply	On-chain verification
## 18. Vesting Analytics
Recommended tracking metrics:

Metric	Description
Total Locked Tokens	Remaining vesting balance.
Released Tokens	Tokens already unlocked.
Upcoming Unlocks	Scheduled release amounts and dates.
Circulating Supply Ratio	Percentage of total supply in circulation.
Wallet Movements	Tracking of released tokens.
## 19. Long-Term Alignment
The PNJC vesting model aligns:

Stakeholder	Alignment
Team	6-month cliff + 12-month vesting
Founder	12-month cliff + 24-month vesting
Treasury	Controlled multisig releases
Community	Activity-based distribution
Investors	Transparent and predictable unlocks
toward the same objective:

Long-Term Ecosystem Growth

## 20. Summary
The PanjoCoin vesting model provides:

Benefit	Description
Controlled Token Distribution	Gradual releases prevent market shocks.
Reduced Market Pressure	Cliff periods and linear vesting prevent dumping.
Transparent Economics	All schedules are publicly verifiable.
Long-Term Commitment Incentives	Aligns contributors with ecosystem growth.
The vesting structure supports a sustainable ecosystem based on:

Utility;

Community growth;

Social impact;

Responsible token management.

Disclaimer
This document is provided for informational purposes only.

It does not constitute:

Investment advice;

Financial advice;

Legal advice;

Tax advice;

An offer to sell securities;

A solicitation to purchase financial instruments.

Participation in blockchain ecosystems involves significant risks. Individuals should conduct independent research and seek professional advice where appropriate before making financial or legal decisions.

Document Information
Property	Value
Document	Vesting
Version	1.1 (Updated)
Date	July 25, 2026
Status	Official
© 2026 PanjoCoin (PNJC) / CryptoTengo. All rights reserved.
Document Version: 1.1 (Updated)
Last Updated: July 25, 2026

