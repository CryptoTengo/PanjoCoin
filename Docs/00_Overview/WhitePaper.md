### PanjoCoin (PNJC) — WHITEPAPER
Version: 2.0 (Revised and Updated)
Date: July 23, 2026
Network: Polygon PoS

## 1. THE LEGEND OF PANJO
In the heart of Tbilisi, in the courtyard of the Iashvili Central Children's Clinical Hospital, a Shar Pei named Panjo appeared one day. He belonged to no one and seemed to have wandered in by chance — to a place where chance usually does not bring visitors. He stopped in the courtyard, raised his head, and gazed for a long time at the sky where clouds drifted slowly — as if searching for something familiar among them.

It was at that very moment he noticed a window on the second floor. Behind the glass stood a boy. He was not smiling. He simply looked down quietly — with a tired yet living gaze. Panjo looked back at him. And instead of walking away, he took a step closer.

He began to behave strangely — sitting down, tilting his head, standing up, sitting again, spinning around as if performing a little dance understood only by himself. His wrinkled face would alternate between serious and comical, as if he were deliberately "breaking" the sadness in the air.

At first, the boy simply watched. Then his expression changed. And then he smiled. It was a quiet, almost imperceptible smile — but it became the moment for which everything had happened.

Panjo did not know the words "joy" or "hope." But he understood the most important thing: he could return. And he began to come again. Almost every day.

From that time on, people in the hospital courtyard began to recognize him. Doctors said his presence changed the atmosphere in the ward. Children waited for him. Some would come to the window, others would go down to the courtyard, and some would simply begin to feel a little better, without even understanding why.

Thus, Panjo became something more than just a dog. He became a reminder that sometimes one living being, one movement, one glance can change more than any words. And this very story became the foundation of PNJC — a token that exists as a symbol of a simple principle:

Even a small act of kindness can change someone's reality.

## 2. INTRODUCTION AND CORE PARAMETERS
PanjoCoin (PNJC) is a utility digital asset deployed on the Polygon PoS network. The token provides holders with access to services and features of the PanjoCoin ecosystem (including the planned ONE+ gaming platform and transparent charity system).

Core Parameters (implemented in smart contracts):

Parameter	Value
Name	PanjoCoin
Ticker	PNJC
Network	Polygon PoS
Standard	ERC-20 + ERC20Permit (EIP 2612) + ERC20Burnable
Total Supply	1,000,000,000,000 PNJC
Decimals	18
Supply Model	Fixed (emission occurred at deployment)
Mint Function	Absent
Admin Keys	None (ownerless contract)
Upgradeability	None
Transfer Tax	0% (on all transactions)
Blacklists / Freezing	None
Token Contract Address	0x45522cD96EA7eBAF28fc760952b1AD9d5fffc848
DEX	Uniswap V2
Compiler	Solidity 0.8.34 (verified)
## 3. PROBLEM STATEMENT
The modern memecoin market is characterized by systemic problems:

Problem	Description
Lack of Utility	Over 99% of memecoins provide no real functions or services.
Security Risks	Hidden emissions, predatory taxes (up to 50–90%), centralized control.
Opacity	Lack of public code verification and fund distribution transparency.
Short-termism	Most projects survive a few weeks and disappear.
PNJC addresses these issues through:

Open source code (verified on PolygonScan).

No administrative privileges (ownerless contract).

Public wallets (full distribution transparency).

Planned utility (gaming platform, charity, DAO).

## 4. SOLUTION: SECURITY ARCHITECTURE
4.1. Technical Security (implemented in code)
The contract has no owner (owner = address(0)) — no one can change functions, emission, or taxes.

Code verified on PolygonScan.

No mint(), blacklist, pause(), or freeze() functions.

0% tax on all transactions.

4.2. Economic Model (implemented)
Fixed supply (1 trillion PNJC) — emission occurred once at deployment.

Zero fees on all operations (buying, selling, transferring).

Transparent distribution with public addresses.

4.3. Future Utility (code ready / design phase)
Module	Purpose	Planned Timeline
GoldenPhoenixProtocol	Optional deflationary engine (automatic buyback/burn) + insurance fund	Q3 2026
DAO Governor	Decentralized token holder voting (quorum 4%, 7-day period)	Q4 2026
VestingVault	Linear token distribution schedule for team and founder	Q3 2026
MerkleAirdrop	Gas-efficient token distribution to pre-determined addresses	Q2 2026
TreasuryVault	Treasury management with transparent reporting (multisig)	Q3 2026
ONE+ Gaming Platform	Access to games, in-game items, and rewards (design phase)	Q3 2027
ClownCare Bridge	Transparent charitable payment system with on-chain reporting (design phase)	Q2 2027
## 5. TOKENOMICS AND DISTRIBUTION
5.1. Fixed Supply
Total supply is 1,000,000,000,000 PNJC (1 trillion). The mint() function is permanently disabled, and no additional tokens can ever be created.

5.2. Allocation Breakdown
Category	Share	Amount (PNJC)	Wallet Address	Control Mechanism
Liquidity Pool (Uniswap V2)	50%	500,000,000,000	0xf55B...988A	Locked via PNJCLiquidityLockerV2 for 12 months. No emergency withdrawal.
Operational Treasury	12%	120,000,000,000	0xD539...C581	3/5 Multisig for operational expenses, listings, and partnerships.
DAO Treasury	10%	100,000,000,000	0xD5e2...FE2	Governed by DAO after launch (Q4 2026). Grants, community initiatives.
Team	10%	100,000,000,000	0xdEBA...9FE	Locked in VestingVault (6-month cliff, 12-month linear vesting).
Community	8%	80,000,000,000	0x54D3...D089	Airdrops, referral bonuses, marketing campaigns, community rewards.
Founder	5%	50,000,000,000	0xF488...A74	Locked in VestingVault (12-month cliff, 24-month linear vesting).
Charity Reserve	5%	50,000,000,000	0xa22E...555	Public wallet for transparent charitable donations.
Verification: 500 + 120 + 100 + 100 + 80 + 50 + 50 = 1,000 billion PNJC (100%).

5.3. Control Mechanisms
Liquidity Lock: 50% of supply is locked in an immutable, ownerless contract with no early withdrawal option for 12 months.

Vesting Contracts: Team and founder allocations are subject to linear vesting to ensure long-term commitment.

Multisig Wallets: Treasury wallets are protected by 3/5 multisig until DAO launch.

## 6. CIRCULATION MODEL
6.1. Initial Circulating Supply
At launch, 1% of total supply enters circulation — 10,000,000,000 PNJC. This provides initial liquidity and price discovery.

6.2. Locked Supply and Release Schedule
The remaining 99% (990,000,000,000 PNJC) is locked and released gradually.

Release Formula:
Each year, 5% of the remaining locked balance enters circulation. This creates a smooth, predictable supply increase.

6.3. Annual Circulation Table
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
Model Advantages:

Predictable for holders.

Reduced sell pressure.

Long-term team alignment.

## 7. DEFLATIONARY MECHANISM: GOLDENPHOENIX PROTOCOL
To counteract inflation and provide price stability, GoldenPhoenixProtocol will be deployed in Q3 2026.

Important: This mechanism does not tax token transactions. Burning is funded by external ecosystem revenue (e.g., fees from ONE+ or other services) in stablecoins (USDT).

7.1. Key Parameters
insurancePercent: 3–10% of revenue allocated to an insurance fund (protects against extreme volatility).

buybackPercent: 15–35% used for market buybacks.

burnPercent: 30–70% of the buyback amount is burned permanently.

rewardPercent: Remaining portion distributed to stakers or liquidity providers.

Invariant: insurancePercent + buybackPercent = 30% of total revenue. Exact ratios will be adjustable via DAO vote.

7.2. Insurance Fund
The accumulated insurance can be deployed during market downturns to support the price, adding a safety net for holders.

7.3. Deflationary Impact
Regular burning gradually reduces the total supply, creating long-term deflationary pressure. All burn transactions are on-chain and verifiable.

## 8. UTILITY AND ECOSYSTEM
8.1. Current Utility (available now)
Function	Description
DEX Trading	Free transfers between wallets (0% tax).
Transparent Charity	Public Charity Reserve wallet — all transfers are on-chain verifiable.
Optional Burning	Users can burn their tokens via the burn() function.
8.2. Future Utility (code ready / design phase)
Function	Description	Planned Timeline
GoldenPhoenixProtocol	Automatic buyback/burn using USDT revenue, insurance fund.	Q3 2026
DAO Voting	Participation in ecosystem development votes.	Q4 2026
ONE+ Platform	Access to games, in-game items, and rewards (design phase).	Q3 2027
ClownCare Bridge	Transparent fund distribution with on-chain reporting (design phase).	Q2 2027
## 9. TECHNOLOGY AND SECURITY
9.1. Deployed Contracts
Contract	Status	Link
PanjoCoin (token)	✅ Active	PolygonScan
PNJCLiquidityLockerV2	🧩 Code Ready	GitHub
GoldenPhoenixProtocol	🧩 Code Ready	GitHub
PNJCAirdrop	🧩 Code Ready	GitHub
PNJCVestingVault	🧩 Code Ready	GitHub
PNJCTreasuryVault	🧩 Code Ready	GitHub
DAO Governor	🧩 Code Ready	GitHub
9.2. Confirmed Security Measures
Measure	Status
OpenZeppelin 5.0.2	✅
ReentrancyGuard	✅
No selfdestruct	✅
No delegatecall	✅
No upgradeability	✅
No owner (token)	✅
Owner — multisig	✅
Code verified	✅
## 10. AUDIT AND VERIFICATION
10.1. Completed Checks
Check	Status
Verification on PolygonScan	✅ Completed
Internal testing (Hardhat)	✅ Completed
Community code review	🔄 Available
10.2. Planned Independent Audits
Contract	Auditor	Timeline
PanjoCoin (token)	CertiK	Q2 2026
PNJCLiquidityLockerV2	CertiK	Q2 2026
GoldenPhoenixProtocol	CertiK / Hacken	Q3 2026
VestingVault	CertiK / Hacken	Q3 2026
Airdrop	CertiK / Hacken	Q2 2026
TreasuryVault	CertiK / Hacken	Q3 2026
DAO Governor	CertiK / Hacken	Q4 2026
## 11. ROADMAP (24 MONTHS)
Month	Period	Module / Stage	Details
1	July 2026	Audit / LP Lock / Airdrop	Deploy PNJCLiquidityLockerV2, lock 50% LP for 12 months. Launch Merkle tree airdrop.
2	August 2026	VestingVault / TreasuryVault	Deploy vesting contracts for team and founder. Activate multisig treasury.
3	September 2026	GoldenPhoenixProtocol	Deploy deflationary engine. Initial parameter configuration.
4	October 2026	DAO Governor Preparation	DAO code audit, parameter configuration (quorum 4%, 7-day voting).
5	November 2026	DAO Governor Testing	Deploy to Polygon testnet, internal testing.
6	December 2026	DAO Governor Launch	Mainnet deployment, transfer of governance to DAO.
7-9	Jan–Mar 2027	Marketing & Analysis	Educational campaigns, DEX aggregator integration, metrics collection.
10-13	Apr–Jul 2027	ClownCare Bridge	Design, development, testing, and launch of charity bridge.
14-18	Aug–Dec 2027	ONE+ Platform	Development, MVP, internal testing, community beta, official launch.
19-24	Jan–Jun 2028	Scaling & Enhancements	New games, DAO improvements, cross-chain research.
## 12. TEAM
12.1. Founder
Parameter	Details
Name	Tengo Kalandia
Experience	11+ years in charitable sector (Director of SmileDonate Foundation)
Role	Smart contract developer, Whitepaper author, strategic development
Status	Fully doxxed (public reputation)
12.2. Governance (until DAO launch)
3/5 Multisig signers:

Tengo Kalandia (founder)

Technical advisor (to be appointed)

Strategic advisor (to be appointed)

Backup key (auditor)

Backup key (community representative)

After DAO launch, keys will be transferred to independently elected community members.

## 13. RISK DISCLOSURE
Risk	Description
Market Risks	Token price is determined by the market and may fall to zero.
Liquidity Risks	Pool depth may be insufficient for large orders.
Technical Risks	Unknown vulnerabilities may exist in smart contracts.
Regulatory Risks	Cryptocurrency laws may change, affecting token usability.
Development Risks	Planned features may be delayed or not implemented.
Important: The token provides access to ecosystem services. Its acquisition is not an investment and does not guarantee income. Participate only with funds you are prepared to lose completely.

## 14. LEGAL STATUS
PNJC is a utility token that provides access to ecosystem services. The token does not grant rights to:

Income or dividends.

Share in the project.

Expectation of profit from project activities.

Users bear personal responsibility for complying with their country's laws.

## 15. SOURCE OF TRUTH
Priority in case of conflicts between documents:

Smart contract state on blockchain (Polygon).

Blockchain transaction history.

Verified smart contract source code.

This Whitepaper.

## 16. CONCLUSION
PanjoCoin (PNJC) is a utility digital asset that currently provides a secure and transparent token for DEX trading, with phased deployment of additional modules (DAO, deflation, vesting, airdrop, treasury) according to the roadmap.

Key Advantages:

Maximum security (ownerless contract, 0% tax, no hidden functions).

Full transparency (all addresses and transactions public).

Verified code on PolygonScan and open GitHub.

Join us — every step brings us closer to a child's smile and a sustainable ecosystem.

## 17. OFFICIAL LINKS
Resource	Link
Website	www.cryptotengo.com
Smart Contract (token)	0x45522cD96EA7eBAF28fc760952b1AD9d5fffc848
GitHub	github.com/CryptoTengo/PanjoCoin
Liquidity Lock	To be added after locker deployment
Network	Polygon PoS
DEX	Uniswap V2
Socials	X (Twitter), Telegram
### © 2026 PanjoCoin. All rights reserved.
Document Version: 2.0 (Revised)
Last Updated: July 23, 2026
