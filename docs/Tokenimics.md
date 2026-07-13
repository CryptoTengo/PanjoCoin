PANJOCOIN (PNJC) — TOKENOMICS
Synchronized with WhitePaper | Comprehensive Economic Model of the Utility Token on Polygon
Effective Date: July 9, 2026
Updated: July 9, 2026 (Roadmap Update)
________________________________________
Executive Summary (Tokenomics Overview)
PanjoCoin (PNJC) is a utility digital asset with a fixed supply, deployed on the Polygon PoS network. The tokenomics are designed with a focus on security, transparency, and long-term sustainability.
Core Tokenomics Principles:
•	Fixed Supply — 1,000,000,000,000 PNJC, minting occurred once at deployment.
•	Zero Tax — 0% on all operations (buying, selling, transfers).
•	Full Transparency — All distribution wallets are public and verifiable.
•	Liquidity Lock — 50% of total supply will be locked through an immutable contract for 12 months (deployment scheduled for July 2026; exact date and address to be announced).
•	Gradual Decentralization — Governance to be progressively transferred to the community via DAO (code ready; deployment scheduled for December 2026).
________________________________________
1. TOKEN SPECIFICATIONS
Parameter	Value
Name	PanjoCoin
Ticker	PNJC
Network	Polygon PoS
Standard	ERC-20 + ERC20Permit (EIP-2612) + ERC20Burnable
Total Supply	1,000,000,000,000 PNJC
Decimals	18
Supply Model	Fixed (no minting)
Mint Function	Absent
Administrative Keys	None (ownerless contract)
Upgradeability	None (not upgradeable)
Transfer Tax	0%
Blacklists / Freezes	None
Token Contract Address	0x781C0d15347Cb0B94C42C65c7a67E70371205De5
Compiler	Solidity 0.8.34 (verified)
________________________________________
2. TOKEN DISTRIBUTION
2.1. Overall Distribution Structure
#	Allocation	Share	Amount (PNJC)	Wallet Address	Control Mechanism
1	Liquidity Pool (Uniswap V3)	50%	500,000,000,000	0xf55B994FDD7019d8E99c632c76A6e0AdE765988A	Will be locked via PNJCLiquidityLockerV3. Lock period — 12 months (July 2026 – July 2027). Exact date and address to be announced at deployment.
2	Treasury	12%	120,000,000,000	0xD539a54f54e9B174F831D9Da6b48ac15441fC581	Multisig 3/5 (pre-DAO)
3	DAO Treasury	10%	100,000,000,000	0xD5e2DD65BA4984565b53EFdcec6A9D2F494b5FE2	Will be managed by DAO after launch (December 2026)
4	Team	10%	100,000,000,000	0xdEBACbF7f51C3865dc2034ED676D3d344954f9FE	Vesting to be implemented (VestingVault, 12 months; deployment August 2026)
5	Community	8%	80,000,000,000	0x54D3beB9e0F473803cC7a972Db2C17f005a2D089	Airdrop, referral programs (MerkleAirdrop; deployment July 2026)
6	Founder	5%	50,000,000,000	0xF48840486697AE3c15D38E30e45cECB9897CfA74	Vesting to be implemented (VestingVault, 12 months; deployment August 2026)
7	Charity Reserve	5%	50,000,000,000	0xa22E471BF4e405c92bDD074792d8d36923e31055	Public wallet (on-chain verification)
	TOTAL	100%	1,000,000,000,000	—	—
2.2. Distribution Verification
500,000,000,000 (50%)
•	120,000,000,000 (12%)
•	100,000,000,000 (10%)
•	100,000,000,000 (10%)
•	80,000,000,000 (8%)
•	50,000,000,000 (5%)
•	50,000,000,000 (5%)
= 1,000,000,000,000 PNJC (100%)
________________________________________
3. SECURITY AND CONTROL MECHANISMS
3.1. Liquidity Lock — Code Ready; Deployment Scheduled for July 2026
Parameter	Value
Locked Amount	500,000,000,000 PNJC (50% of total supply)
Lock Contract	PNJCLiquidityLockerV3
Lock Type	LP-NFT (ERC721 from Uniswap V3)
Lock Period	12 months (July 2026 – July 2027)
Early Withdrawal Rights	None (contract without emergencyWithdraw)
Contract Owner	None (ownerless contract)
Reentrancy Protection	✅ Implemented (ReentrancyGuard)
Locker Contract Address	To be announced after deployment
Lock Transaction	To be added after deployment
Status Verification	getLock(lockId) on locker contract
3.2. Token Vesting Schedule — Code Ready; Deployment Scheduled for August 2026
Parameter	Value
Tokens Under Vesting	Team (10%) + Founder (5%) = 150,000,000,000 PNJC (15%)
Vesting Duration	12 months
Release Model	Linear (monthly ~8.33% of locked volume)
Vesting Contract	VestingVault (code ready)
Status	🧩 Code ready; deployment scheduled for August 2026
Vesting Release Schedule (Team + Founder):
Month	Released (Billion)	Cumulative in Circulation (Billion)
0	0	0
1	12.50	12.50
2	12.50	25.00
3	12.50	37.50
4	12.50	50.00
5	12.50	62.50
6	12.50	75.00
7	12.50	87.50
8	12.50	100.00
9	12.50	112.50
10	12.50	125.00
11	12.50	137.50
12	12.50	150.00
3.3. Multisig Wallet (Treasury) — IMPLEMENTED
Parameter	Value
Wallet Address	0xD539a54f54e9B174F831D9Da6b48ac15441fC581
Type	Gnosis Safe (multisig 3 of 5)
Number of Keys	5
Transaction Quorum	3
Purpose	Operational expenses, listings, marketing
Transparency	All transactions public on PolygonScan
Key Holders (Pre-DAO):
1.	Tengo Kalandia (Founder)
2.	Technical Advisor (to be appointed)
3.	Strategic Advisor (to be appointed)
4.	Backup Key 1 (Auditor)
5.	Backup Key 2 (Community)
3.4. DAO Treasury — Code Ready; Deployment Scheduled for December 2026
Parameter	Value
Wallet Address	0xD5e2DD65BA4984565b53EFdcec6A9D2F494b5FE2
Status	Code ready; deployment scheduled for December 2026
Governance	Through DAO Governor contract (code ready)
Volume	100,000,000,000 PNJC (10% of total supply)
Purpose	Ecosystem development, grants, partnerships
________________________________________
4. CIRCULATION MODEL
4.1. Initial Circulation
At launch, 1% of total supply enters circulation = 10,000,000,000 PNJC.
Composition of Initial Circulation:
•	Portion of liquidity pool
•	Portion of charity reserve
•	Portion of community allocation
4.2. Locked Supply
The remaining 99% = 990,000,000,000 PNJC remains locked and is distributed according to schedule (to be implemented in VestingVault).
Locked Categories:
•	Liquidity Pool (500 billion) — locked for 12 months (July 2026 – July 2027)
•	Team + Founder (150 billion) — vesting for 12 months (deployment August 2026)
•	Treasury (120 billion) — managed by multisig (implemented)
•	DAO Treasury (100 billion) — awaiting DAO launch (December 2026)
•	Community (80 billion) — used for airdrops (deployment July 2026)
•	Charity Reserve (40 of 50 billion) — gradual utilization
4.3. Token Release Schedule
Annually, 5% of the remaining locked volume enters circulation.
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
4.4. Mathematical Model
Notation:
•	S₀ = 990 billion — initial locked supply
•	Sₙ — locked supply after n years
•	Rₙ — release volume in year n
•	Cₙ — cumulative tokens in circulation after n years
•	Pₙ — percentage of tokens in circulation relative to total supply
Formulas:
text
S₀ = 990,000,000,000 PNJC
Rₙ = 0.05 × Sₙ₋₁
Sₙ = Sₙ₋₁ − Rₙ
Cₙ = 1,000,000,000,000 − Sₙ
Pₙ = (Cₙ / 1,000,000,000,000) × 100%
Where:
•	n — number of years since launch (n ≥ 1)
•	Each year, 5% of the current locked supply is released
•	Released tokens enter circulation
________________________________________
5. TOKEN UTILITY
5.1. Current Utility (Available Now; Implemented in Code)
Feature	Description
DEX Trading	Free transfer between wallets (0% tax)
Transparent Charity	Public Charity Reserve wallet — all transfers verifiable
Optional Burning	Users can burn their tokens via burn()
5.2. Future Utility (Code Ready / Design Phase)
Feature	Description	Target Date
ONE+ Platform	Access to gaming features, mini-games, and in-game items (design phase)	Q3 2027 (beta), Q4 2027 (launch)
ClownCare Bridge	Transparent fund distribution system with on-chain reporting (design phase)	Q3 2027 (launch)
DAO Voting	Participation in ecosystem development votes (1 PNJC = 1 vote)	December 2026
Deflationary Engine	Optional automatic burning by DAO decision (GoldenPhoenixProtocol)	September 2026
Note: Smart contracts (DAO, deflationary engine, vesting, airdrop, treasury) have code ready, published in the open repository. ONE+ Platform and ClownCare Bridge are backend services in the design phase.
________________________________________
6. SMART CONTRACT TECHNICAL SPECIFICATIONS
6.1. Implemented Token Functions (from code)
Function	Description	Status
transfer()	Transfer tokens	✅ Implemented
transferFrom()	Transfer with approval	✅ Implemented
approve()	Approve token usage	✅ Implemented
permit()	Gasless approval (EIP-2612)	✅ Implemented
burn()	Burn own tokens	✅ Implemented
burnFrom()	Burn tokens with approval	✅ Implemented
maxSupply()	Returns total supply	✅ Implemented
mint()	Mint new tokens	❌ Absent
6.2. Implemented Locker Functions (Code Ready; Deployment Scheduled)
Function	Description	Status
lock()	Create LP-NFT lock	✅ Implemented
withdraw()	Return NFT after expiry	✅ Implemented
getLock()	Check lock status	✅ Implemented
isUnlocked()	Check if position is unlocked	✅ Implemented
timeRemaining()	Time until unlock	✅ Implemented
exists()	Check if lock exists	✅ Implemented
isActive()	Check if lock is active	✅ Implemented
emergencyWithdraw()	Emergency withdrawal	❌ Absent
6.3. Contract Security
Measure	Status
OpenZeppelin 5.0.2	✅
ReentrancyGuard	✅
No selfdestruct	✅
No delegatecall	✅
No upgradeable	✅
No owner (owner = address(0))	✅
Code verified on PolygonScan	✅
________________________________________
7. ECONOMIC PRINCIPLES
Principle	Description
Fixed Supply Integrity	No inflation, minting, or re-issuance
Market Valuation	Token price determined exclusively by open market liquidity
Non-Codifiable Design	No administrative privileges, blacklists, or freeze functions
Transparency	All wallets and transactions public and verifiable
Long-Term Sustainability	Gradual token release into circulation; team motivation extending years ahead
________________________________________
8. RISK DISCLOSURE
Risk	Description
Market Risks	Token price is market-determined and may fluctuate; complete loss of value is possible
Liquidity Risks	Pool depth may be insufficient for large trades
Technical Risks	Possibility of unknown vulnerabilities in smart contracts (despite verification and future audits)
Regulatory Risks	Cryptocurrency laws may change in any jurisdiction
Development Risks	Planned features may be partially implemented, delayed, or not implemented at all (though code is ready, deployment may be delayed)
Centralization Risks	Currently, key wallet management is through multisig; full decentralization will only be achieved after DAO launch
Important to Understand:
The token provides access to ecosystem services. Its acquisition is not an investment and does not guarantee income. The token price may fall to zero.
________________________________________
9. ROADMAP (24 MONTHS) — Synchronized with WhitePaper v1.2
Below is a detailed implementation plan for all modules, synchronized with the updated WhitePaper roadmap.
Month	Period	Module / Stage	Details
1	July 2026	Token & Locker Audit Completion; Liquidity Lock; MerkleAirdrop	Conduct independent audit (if not done). Deploy PNJCLiquidityLockerV3; lock 50% LP for 12 months. Launch Merkle-tree airdrop.
2	August 2026	VestingVault; TreasuryVault	Deploy vesting contracts for team and founder (12-month linear schedule). Activate multisig treasury with transparent reporting.
3	September 2026	GoldenPhoenixProtocol	Deploy deflationary engine (automatic buyback/burn + insurance fund). Initial parameter configuration (insurance 5%, buyback 25%, burn 70%).
4	October 2026	DAO Governor Preparation	DAO code audit; parameter configuration (quorum 4%, voting period 7 days). Integration with Snapshot for off-chain voting.
5	November 2026	DAO Governor Testing	Deploy to Polygon testnet; internal testing; community engagement for trial votes.
6	December 2026	DAO Governor Launch	Deploy to mainnet; transfer governance to DAO (first votes on key ecosystem parameters).
7	January 2027	Post-DAO: Marketing & Community	Launch educational campaigns; ambassador program; crypto media partnerships.
8	February 2027	Utility Development (Quick Wins)	Integration with additional DEX aggregators; launch referral program (smart contract-based).
9	March 2027	Analysis & Adjustment	Collect metrics on deflationary engine, DAO votes, community activity. Prepare community report.
10	April 2027	ClownCare Bridge — Design	Formalize requirements for charity platform; develop backend and smart contract architecture.
11	May 2027	ClownCare Bridge — Development	Write smart contracts (if revisions needed) and backend services for transparent on-chain reporting payments.
12	June 2027	ClownCare Bridge — Testing & Audit	Internal testing; independent audit; testnet deployment.
13	July 2027	ClownCare Bridge — Launch	Mainnet deployment; first charitable payments (pilot with SmileDonate foundation).
14	August 2027	ONE+ — Development Start	Gaming platform design: technology stack selection, interface design, PNJC token integration.
15	September 2027	ONE+ — Prototype	Create MVP with basic games (mini-games, in-game items).
16	October 2027	ONE+ — Internal Testing	QA testing; critical bug fixes; gas cost optimization.
17	November 2027	ONE+ — Community Beta	Open access for PNJC holders; feedback collection.
18	December 2027	ONE+ — Official Launch	Public platform release; launch in-game referral system.
19	January 2028	ONE+ Scaling	Add new games; NFT marketplace integration; gaming studio partnerships.
20	February 2028	DAO & Deflation Model Improvement	Implement changes based on vote results (buyback parameters, insurance fund allocation).
21	March 2028	Cross-Chain Integration (Optional)	Research possibility of deploying PNJC on other networks (e.g., Arbitrum, Optimism) via bridges.
22	April 2028	Launch New Charity Programs	Expand ClownCare Bridge to new regions; automate reporting.
23	May 2028	"2 Years of PNJC" Marketing Campaign	Summary of results; public reporting; team interviews; active participant awards.
24	June 2028	Next Cycle Planning	Determine 2028–2029 priorities based on DAO votes and metrics.
Note: All timelines depend on independent audit results and may be subject to adjustment.
________________________________________
10. PROJECTION MODEL
10.1. Supply and Circulation (First 10 Years)
Year	Total Supply	In Circulation	Locked	% in Circulation
0	1,000B	10B	990B	1.00%
1	1,000B	59.5B	940.5B	5.95%
2	1,000B	106.5B	893.5B	10.65%
3	1,000B	151.2B	848.8B	15.12%
4	1,000B	193.6B	806.4B	19.36%
5	1,000B	234.0B	766.0B	23.40%
6	1,000B	272.3B	727.7B	27.23%
7	1,000B	308.7B	691.3B	30.86%
8	1,000B	343.2B	656.8B	34.32%
9	1,000B	376.1B	623.9B	37.61%
10	1,000B	407.3B	592.7B	40.72%
10.2. Long-Term Perspective (20 Years)
Metric	Value
Locked Supply	~358.85 billion PNJC
In Circulation	~641.15 billion PNJC
Percentage in Circulation	~64.12%
The remaining ~358.85 billion PNJC will continue unlocking using the same formula until all tokens enter circulation. Full unlocking is mathematically achieved asymptotically (infinite horizon), ensuring a perpetual economic model without sharp supply spikes.
________________________________________
11. TOKENOMICS COMPLIANCE CHECKLIST — WHITEPAPER v1.2
#	Criterion	Status	Confirmation
1	Fixed Supply	✅	1 trillion PNJC, no mint()
2	Ownerless Contract	✅	owner = address(0)
3	No Hidden Functions	✅	No blacklist, pause, freeze
4	Zero Tax	✅	0% on all operations
5	Liquidity Lock	🧩	50% via immutable locker (deployment July 2026, 12-month term)
6	Team Vesting	🧩	15% over 12 months (deployment August 2026)
7	Multisig for Treasury	✅	3/5 Gnosis Safe (implemented)
8	DAO Governance	🧩	Code ready; deployment December 2026
9	Transparency	✅	All addresses published
10	Decentralization Plan	🧩	Gradual governance transfer to DAO
11	Country Legal Classification	✅	Prohibited, restricted, permitted
12	Risk Disclosure	✅	Full risk section
13	Audit Plan	🧩	Scheduled (token and locker — July 2026; others — before deployment)
14	24-Month Roadmap	✅	Detailed and synchronized with WhitePaper v1.2
________________________________________
12. VERIFICATION LINKS
Resource	Link
Token Contract (PolygonScan)	0x781C0d15347Cb0B94C42C65c7a67E70371205De5
Liquidity Pool	0xf55B994FDD7019d8E99c632c76A6e0AdE765988A
Treasury (Multisig)	0xD539a54f54e9B174F831D9Da6b48ac15441fC581
DAO Treasury	0xD5e2DD65BA4984565b53EFdcec6A9D2F494b5FE2
Team (Vesting)	0xdEBACbF7f51C3865dc2034ED676D3d344954f9FE
Community	0x54D3beB9e0F473803cC7a972Db2C17f005a2D089
Founder	0xF48840486697AE3c15D38E30e45cECB9897CfA74
Charity Reserve	0xa22E471BF4e405c92bDD074792d8d36923e31055
GitHub (Contract Code)	github.com/CryptoTengo/PanjoCoin

WhitePaper v1.2	github.com/CryptoTengo/PanjoCoin/blob/main/docs/WhitePaper.md

________________________________________
13. APPENDIX: DISTRIBUTION DIAGRAM
text
Total Supply: 1,000,000,000,000 PNJC
│
├── 50% (500B) — Liquidity Pool (Uniswap V3)
│   └── To be locked via PNJCLiquidityLockerV3 (12-month term; July 2026)
│
├── 12% (120B) — Treasury
│   └── Multisig 3/5 (Gnosis Safe) — IMPLEMENTED
│
├── 10% (100B) — DAO Treasury
│   └── To be managed by DAO (December 2026)
│
├── 10% (100B) — Team
│   └── Vesting schedule (VestingVault, 12 months; August 2026)
│
├── 8% (80B) — Community
│   └── Airdrop, referral programs (MerkleAirdrop; July 2026)
│
├── 5% (50B) — Founder
│   └── Vesting schedule (VestingVault, 12 months; August 2026)
│
└── 5% (50B) — Charity Reserve
    └── Public wallet (on-chain verification)
________________________________________
14. FINAL COMPLIANCE WITH WHITEPAPER v1.2
#	Whitepaper Section	Tokenomics Compliance
1	Core Parameters	✅ Full compliance
2	Token Distribution	✅ All 7 categories and addresses
3	Liquidity Lock	🧩 Code ready; deployment July 2026 (12-month term)
4	Vesting (Team + Founder)	🧩 Code ready; deployment August 2026 (12 months)
5	Multisig	✅ Gnosis Safe 3/5 (implemented)
6	DAO Treasury	🧩 Code ready; deployment December 2026
7	Circulation Model	✅ 1% initial; 5% annually
8	Utility (Current)	✅ Trading, charity, burning
9	Utility (Future)	🧩 Code ready / design phase
10	Technical Parameters	✅ All functions from code
11	Security	✅ All measures from code
12	Risks	✅ Full section
13	Projection Model	✅ 10 years + 20 years
14	Doxxed Team	✅ Founder publicly known
15	No Investment Formulations	✅ Clearly stated token does not confer income rights
16	Roadmap (24 Months)	✅ Fully synchronized with WhitePaper v1.2
________________________________________
© 2026 PanjoCoin. All rights reserved.
Document Version: v1.2 (Synchronized with WhitePaper v1.2)
Last Updated: July 9, 2026
________________________________________
This document is a translation of the original Russian-language PanjoCoin Tokenomics document. In case of any discrepancies, the original Russian version shall prevail. For the most up-to-date information, please refer to the official website and GitHub repository.
This response is AI-generated, for reference only.

