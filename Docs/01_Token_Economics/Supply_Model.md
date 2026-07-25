## Supply Model
PanjoCoin (PNJC)
Version: 1.1 (Updated)
Date: July 25, 2026
Network: Polygon PoS
Token Standard: ERC-20 (ERC20Burnable + ERC20Permit)
Smart Contract Address: 0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF

## 1. Overview
This document defines the supply model of PanjoCoin (PNJC).

The PNJC supply model is designed around:

Fixed maximum supply (1 trillion PNJC);

No future minting (mint() function disabled);

Transparent allocation (all wallets public);

Controlled token release (5% annual unlock);

Long-term ecosystem sustainability;

Optional user-driven burning (ERC20Burnable).

## 2. Token Supply Parameters
Total Supply
1,000,000,000,000 PNJC (1 Trillion)

Supply Characteristics
Parameter	Status
Maximum Supply	Fixed
Minting	Disabled (no mint() function)
Inflation	None
Upgradeable Supply	No
Hidden Allocation	None
Transfer Tax	0%
Burn Mechanism	Optional, user-driven
Automatic Burn Tax	None
## 3. Supply Architecture
text
            Total Supply
        1,000,000,000,000 PNJC
                 |
   ┌─────────────┼─────────────┐
   │             │             │
 Liquidity   Treasury      Team    DAO    Founder   Community   Charity
   50%         12%         10%     10%      5%         8%         5%
## 4. Token Allocation
Allocation	Percentage	Amount (PNJC)	Control Mechanism
Liquidity Pool (Uniswap V2)	50%	500,000,000,000	Locked for 12 months (no early withdrawal)
Operational Treasury	12%	120,000,000,000	3/5 Multisig
Team	10%	100,000,000,000	Vesting: 6-month cliff + 12-month linear
DAO Treasury	10%	100,000,000,000	Controlled by DAO after launch (Q4 2026)
Founder	5%	50,000,000,000	Vesting: 12-month cliff + 24-month linear
Community	8%	80,000,000,000	Airdrops, referrals, campaigns
Charity Reserve	5%	50,000,000,000	Public wallet, on-chain transparent
Verification: 500 + 120 + 100 + 100 + 50 + 80 + 50 = 1,000 billion PNJC (100%).

## 5. Liquidity Allocation
Allocation
Property	Value
Percentage	50%
Amount	500,000,000,000 PNJC
Platform	Uniswap V2
Purpose	DEX liquidity, market accessibility, trading availability, price discovery
Liquidity Distribution
Platform	Percentage	Amount (PNJC)
Uniswap V2	100%	500,000,000,000
## 6. Liquidity Lock Model
Liquidity Protection: PNJCLiquidityLockerV2

Property	Value
Purpose	Prevent liquidity removal, increase investor confidence, reduce rug-pull risk.
Lock Period	12 months
Emergency Withdrawal	None
Contract Type	Immutable, ownerless
Verification	Public on PolygonScan
Lock Timeline:

Start: Deployment (July 2026);

End: 12 months from deployment.

## 7. Operational Treasury Allocation
Property	Value
Percentage	12%
Amount	120,000,000,000 PNJC
Purpose	Ecosystem development, partnerships, marketing, technology development, operational expenses.
Management	3/5 Multisig
## 8. Team Allocation
Property	Value
Percentage	10%
Amount	100,000,000,000 PNJC
Purpose	Core contributors, long-term development.
Vesting Schedule
Property	Value
Initial Cliff	6 months
Vesting Period	12 months after cliff
Purpose	Prevent early sell pressure, align team incentives, support long-term commitment.
## 9. DAO Treasury Allocation
Property	Value
Percentage	10%
Amount	100,000,000,000 PNJC
Purpose	Community governance, ecosystem grants, developer incentives, future initiatives.
Management	DAO Governance (Q4 2026)
## 10. Founder Allocation
Property	Value
Percentage	5%
Amount	50,000,000,000 PNJC
Purpose	Founder commitment, strategic development.
Vesting Schedule
Property	Value
Initial Cliff	12 months
Vesting Period	24 months after cliff
Purpose	Long-term alignment with ecosystem growth.
## 11. Community Allocation
Property	Value
Percentage	8%
Amount	80,000,000,000 PNJC
Purpose	Airdrops, referral bonuses, marketing campaigns, community rewards.
Distribution Mechanisms
Merkle Tree airdrops (gas-efficient);

Anti-sybil protection;

Transparent claims.

## 12. Charity Reserve
Property	Value
Percentage	5%
Amount	50,000,000,000 PNJC
Purpose	Social impact programs, verified charity initiatives, transparent donations.
Management	Public wallet, on-chain transparent.
## 13. Token Release Schedule
Initial Circulating Supply
At launch:

Property	Value
Amount	10,000,000,000 PNJC
Percentage	1% of total supply
Purpose	Initial liquidity, market creation, price discovery.
## 14. Locked Supply Model
Remaining supply:

Property	Value
Amount	990,000,000,000 PNJC
Percentage	99% of total supply
Control	Vesting contracts, treasury management, DAO governance, release schedules.
## 15. Annual Unlock Schedule
Locked allocations follow:

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
16. Circulating Supply Model
Circulating supply consists of:

DEX liquidity tokens (Uniswap V2);

Released ecosystem tokens;

Community distributions;

Approved treasury usage.

Excluded from circulating supply:

Locked tokens (liquidity lock);

Vesting allocations (team, founder);

Future DAO reserves (until released).

## 17. Deflationary Mechanism
PNJC includes optional, user-driven burning through the burn() function inherited from ERC20Burnable.

Feature	Status
Type	Optional, user-initiated
Burn Tax	None (0%)
Control	Token holders only
Permanence	Irreversible
Transparency	All burns on-chain
Important: PNJC does not impose any automatic burn tax on transactions. Burning is entirely voluntary.

## 18. Supply Control Rules
The PNJC ecosystem follows:

Rule	Description
No Minting	The supply cannot increase.
Transparent Unlocks	All releases are publicly verifiable.
Controlled Treasury	Treasury movements require multisig/DAO approval.
Community Transparency	Supply changes are publicly announced.
## 19. Supply Risk Management
Risk	Impact	Mitigation
Excessive Token Release	High	Vesting schedules, controlled unlocks, multisig approval.
Market Sell Pressure	High	Gradual releases (5% annually), liquidity management.
Supply Manipulation	High	Fixed supply contract, no mint permissions, blockchain verification.
## 20. Supply Analytics
The ecosystem monitors:

Metric	Purpose
Total Supply	Maximum and current supply.
Circulating Supply	Available tokens in the market.
Locked Supply	Tokens in vesting and liquidity locks.
Burned Supply	Tokens permanently removed.
Holder Distribution	Decentralization of ownership.
Treasury Movements	Transparency of fund usage.
## 21. Transparency Requirements
Public information includes:

Token allocation breakdown;

Vesting wallet addresses;

Treasury wallet addresses;

Burn transactions (on-chain);

Liquidity lock details.

All information is available on PolygonScan.

## 22. Future Supply Extensions
Future ecosystem contracts may introduce:

Reward distribution contracts;

DAO-controlled grants;

Ecosystem incentive programs.

These MUST NOT increase maximum supply.

## 23. Supply Model Summary
PanjoCoin supply model is based on:

text
Fixed Supply (1 Trillion PNJC)
        +
Transparent Allocation (Public Wallets)
        +
Controlled Unlocks (5% Annually)
        +
Optional User-Driven Burning
        +
Community Growth
        =
Sustainable Token Economics
The model is designed to provide:

Predictable economics;

Investor transparency;

Long-term sustainability;

Ecosystem stability.

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
Document	Supply Model
Version	1.1 (Updated)
Date	July 25, 2026
Status	Official
© 2026 PanjoCoin (PNJC) / CryptoTengo. All rights reserved.
Document Version: 1.1 (Updated)
Last Updated: July 25, 2026
