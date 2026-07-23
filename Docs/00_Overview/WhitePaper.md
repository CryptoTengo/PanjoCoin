# PANJOCOIN (PNJC) — WHITEPAPER

Utility Token on Polygon | Secure Digital Asset for DEX Trading and Ecosystem
Effective Date: July 9, 2026
Updated: July 9, 2026 (roadmap updated)
________________________________________

CORE PARAMETERS (implemented in smart contracts)
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
Transfer Tax	0%
Blacklists / Freezing	None
Token Contract Address	0x45522cD96EA7eBAF28fc760952b1AD9d5fffc848
LP Lock Contract	PNJCLiquidityLockerV2 (code ready, deployment planned)
DEX	Uniswap V2
Compiler	Solidity 0.8.34 (verified)
________________________________________
# 1. THE LEGEND OF PANJO
In the heart of Tbilisi, in the courtyard of the Iashvili Central Children's Clinical Hospital, a Shar Pei named Panjo appeared one day.
He belonged to no one and seemed to have wandered in by chance, to a place where chance usually does not bring visitors. He stopped in the courtyard, raised his head, and gazed for a long time at the sky where clouds drifted slowly—as if searching for something familiar among them.
And it was at that very moment he noticed a window on the second floor.
Behind the glass stood a boy. He was not smiling. He simply looked down quietly—with a tired yet living gaze.
Panjo looked back at him. And instead of walking away, he took a step closer.
He began to behave strangely—sitting down, tilting his head, standing up, sitting again, spinning around as if performing a little dance understood only by himself. His wrinkled face would alternate between serious and comical, as if he were deliberately "breaking" the sadness in the air.
At first, the boy simply watched.
Then his expression changed. And then he smiled.
It was a quiet, almost imperceptible smile—but it became the moment for which everything had happened.
Panjo did not know the words "joy" or "hope." But he understood the most important thing: he could return.
And he began to come again. Almost every day.
From that time on, people in the hospital courtyard began to recognize him. Doctors said his presence changed the atmosphere in the ward. Children waited for him. Some would come to the window, others would go down to the courtyard, and some would simply begin to feel a little better, without even understanding why.
Thus, Panjo became something more than just a dog. He became a reminder that sometimes one living being, one movement, one glance can change more than any words.
And this very story became the foundation of PNJC—a token that exists as a symbol of a simple principle:
Even a small act of kindness can change someone's reality.
________________________________________
# 2. UTILITY ECOSYSTEM: FROM ALGORITHM TO SOCIAL IMPACT
Important Note: The mechanisms described in this section (Proof of Kindness, Impact Score, SocialMining Engine, Global Kindness Map) are at the conceptual development stage. They do not affect the base tokenomics or the current smart contracts deployed on the mainnet. Detailed specifications, architecture, and implementation timelines will be presented in subsequent versions of this Whitepaper as the ecosystem evolves.
The PanjoCoin architecture is built on six key utilities that integrate decentralized finance methods with real social impact, ensuring sustainable ecosystem growth and charitable transparency.
# 2.1. Proof of Kindness (PoK) Mechanism: Blockchain Validation of Good Deeds
Describes the process of transforming social action into a digital asset.
# 2.2. Impact Score: On-Chain Social Reputation System
Describes the dynamic user rating and its influence on DAO status.
# 2.3. SocialMining Engine: Decentralized Marketing Protocol
Describes the reward model for participants promoting the project and creating content.
# 2.4. Global Kindness Map: Interactive Registry of Kindness Transactions
Describes real-time visualization of the project's impact with geographic tagging.
# 2.5. GoldenPhoenix Protocol: Deflationary Sustainability Protocol
Describes the mathematical model for automatic buyback and token burning to stabilize price.
# 2.6. DAO Governance & Trust Bridge: Management and Asset Transparency
Describes decentralized voting mechanisms and direct charitable gateway (ClownCare Bridge).
________________________________________
# EXECUTIVE SUMMARY
PanjoCoin (PNJC) is a utility digital asset deployed on the Polygon PoS network. The token provides holders with access to services and features of the PanjoCoin ecosystem (including the planned ONE+ gaming platform and transparent charity system).
Key characteristics implemented in smart contracts:
•	Security: The contract has no owner (owner = address(0)), is not upgradeable, and contains no hidden functions (mint, blacklist, pause).
•	Economics: Zero tax on all transactions, fixed supply of 1 trillion PNJC.
•	Transparency: All distribution wallets are public, liquidity will be locked through an immutable contract for 12 months (code ready, deployment planned, exact date to be announced at deployment).
•	Accessibility: The token can be freely transferred and optionally burned (ERC20Burnable).
Important: All additional modules (DAO, deflationary engine, vesting, airdrop, treasury) have code ready, but their deployment and activation will be carried out in stages according to the roadmap. At the time of this Whitepaper publication, they are not yet deployed on the mainnet (except for the base token). This ensures flexibility and the ability to independently audit each module before launch.
________________________________________
# 3. PROBLEM STATEMENT
The modern memecoin market is characterized by systemic problems:
Problem	Description
Lack of Utility	Over 99% of memecoins provide no real functions or services
Security Risks	Hidden emissions, predatory taxes (up to 50–90%), centralized control
Opacity	Lack of public code verification and fund distribution transparency
Short-termism	Most projects survive a few weeks and disappear
PNJC addresses these issues through:
•	Open source code (verified on PolygonScan)
•	No administrative privileges (ownerless contract)
•	Public wallets (full distribution transparency)
•	Planned utility (gaming platform, charity, DAO)
________________________________________
# 4. SOLUTION
# 4.1. Technical Security (implemented in code)
•	The contract has no owner (owner = address(0)) — no one can change functions, emission, or taxes.
•	Code verified on PolygonScan.
•	No mint(), blacklist, pause(), or freeze() functions.
•	0% tax on all transactions.
# 4.2. Economic Model (implemented)
•	Fixed supply (1 trillion PNJC) — emission occurred once at deployment.
•	Zero fees on all operations (buying, selling, transferring).
•	Transparent distribution with public addresses.
# 4.3. Future Utility and Additional Modules (code ready / design phase)
All modules listed below are not part of the currently deployed token contract. Smart contracts (DAO, deflation, vesting, airdrop, treasury) have ready code uploaded to the open repository. ONE+ and ClownCare Bridge services are backend services currently in the design phase.
Module	Purpose	Planned Timeline
GoldenPhoenixProtocol	Optional deflationary engine (automatic buyback/burn) + insurance fund	Q3 2026
DAO Governor	Decentralized token holder voting (quorum 4%, 7-day period)	Q4 2026
VestingVault	Linear token distribution schedule for team and founder (12 months)	Q3 2026
MerkleAirdrop	Gas-efficient token distribution to pre-determined addresses	Q2 2026
TreasuryVault	Treasury management with transparent reporting (multisig)	Q3 2026
ONE+ Gaming Platform	Access to games, in-game items, and rewards (design phase)	Q3 2027
ClownCare Bridge	Transparent charitable payment system with on-chain reporting (design phase)	Q2 2027
All smart contracts will undergo independent audits (CertiK / Hacken) before deployment. Results will be published.
________________________________________
# 5. CORE ARCHITECTURE
# 5.1. Deployed and Active Components (✅ Active, code on GitHub)
Component	Description	Status
PNJC Token	ERC-20 with Permit (EIP 2612) and Burnable. Ownerless, no mint. Code verified on PolygonScan.	✅ Active
Liquidity Locker	Immutable contract for locking LP NFT (ERC721). Ownerless, no emergencyWithdraw, with ReentrancyGuard. Code published on GitHub.	🧩 Code ready, deployment planned (12 month lock period, exact date to be announced at deployment)
Confirmed token functions (from code):
•	transfer, transferFrom, approve, permit (EIP 2612)
•	burn, burnFrom (ERC20Burnable)
•	maxSupply() — returns constant 1,000,000,000,000
•	No mint() — emission is impossible
•	No owner — contract does not inherit Ownable
Confirmed locker functions (from code):
•	lock() — creates LP NFT lock with beneficiary and unlock time
•	withdraw() — returns NFT after expiration (beneficiary only)
•	getLock(), isUnlocked(), timeRemaining(), exists(), isActive() — view functions for status checking
•	Constants: HAS_ADMIN = false, UPGRADABLE = false, EMERGENCY_WITHDRAW = false
# 5.2. Components with Ready Code Awaiting Deployment (🧩 Code ready / design phase)
All smart contracts listed below are already written and available in the GitHub repository. They will be deployed according to the roadmap after successful completion of independent audits. ONE+ and ClownCare Bridge services are in the design phase.
Module	Purpose	Planned Deployment
GoldenPhoenixProtocol	Automatic buyback/burn and insurance fund	Q3 2026
VestingVault	Linear vesting for team and founder	Q3 2026
MerkleAirdrop	Token distribution via Merkle tree	Q2 2026
TreasuryVault	Treasury multisig contract	Q3 2026
DAO Governor	Governance through voting	Q4 2026
ONE+ Gaming Platform	(design phase, not a smart contract)	Q3 2027
ClownCare Bridge	(design phase, not a smart contract)	Q2 2027
Contract Management with Ownable:
GoldenPhoenixProtocol and MerkleAirdrop contracts use Ownable2Step, with the owner being a multisig wallet (Gnosis Safe) or, after DAO launch, the DAO contract itself. This ensures no single individual has sole control.
________________________________________
# 6. TOKENOMICS
# 6.1. Fixed Supply
Total supply — 1,000,000,000,000 PNJC. Emission occurred at deployment; the mint() function is physically absent.
# 6.2. Distribution
Allocation	Share	Amount (PNJC)	Wallet Address	Control Mechanism
Liquidity Pool (Uniswap V2)	50%	500,000,000,000	 	Will be locked via PNJCLiquidityLockerV2. Lock period — 12 months. Exact end date and contract address to be announced at deployment.
Treasury	12%	120,000,000,000	 	Multisig 3/5 (organizational control)
DAO Treasury	10%	100,000,000,000	 	Will be governed by DAO after launch
Team	10%	100,000,000,000	 	Distribution schedule (to be implemented in VestingVault)
Community	8%	80,000,000,000	 	Airdrop, referral programs
Founder	5%	50,000,000,000	 	Distribution schedule (to be implemented in VestingVault)
Charity Reserve	5%	50,000,000,000	 	Public wallet (on-chain verifiable)
Verification: 500 + 120 + 100 + 100 + 80 + 50 + 50 = 1,000 billion PNJC (100%).
# 6.3. Control Mechanisms (implemented and planned)
Mechanism	Status	Description
LP Lock	🧩 Code ready, deployment planned	500 billion PNJC (50% of total supply) will be locked via immutable PNJCLiquidityLockerV2 contract. Lock period — 12 months. Exact end date and contract address to be announced at deployment. Contract has no owner and no emergencyWithdraw function, protected against reentrancy.
Distribution Schedule	🧩 Code ready, deployment planned	Will be implemented in separate VestingVault contract (12 month linear schedule for team and founder).
Transparency	✅ Active	All wallets are public, transactions verifiable on PolygonScan.
DAO Governance	🧩 Code ready, deployment planned	Will be implemented in separate DAO Governor contract after development and audit completion.
Deflationary Engine	🧩 Code ready, deployment planned	GoldenPhoenixProtocol contract provides automatic buyback/burn and insurance fund. Parameters managed via multisig (subsequently — DAO).
________________________________________
# 7. CIRCULATION MODEL
# 7.1. Initial Circulation
At launch, 1% of total supply enters circulation = 10,000,000,000 PNJC.
# 7.2. Locked Supply
The remaining 99% = 990,000,000,000 PNJC remains locked and is distributed according to schedule (to be implemented in VestingVault).
# 7.3. Distribution Schedule
Annually, 5% of the remaining locked volume enters circulation.
Year	Locked (billion)	In Circulation (billion)	% in Circulation

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

# Model Advantages:

•	Gradual token release prevents sharp price crashes
•	Predictability for holders
•	Long-term team motivation
________________________________________
# 8. UTILITY & ECOSYSTEM
# 8.1. Current Utility (available now, implemented in code)
Function	Description
DEX Trading	Free transfer between wallets (0% tax)
Transparent Charity	Public Charity Reserve wallet (0xa22E...) — all transfers on chain verifiable
Optional Burning	Users can burn their tokens via burn() function (inherited from ERC20Burnable)
# 8.2. Future Utility (code ready / design phase)
Function	Description	Planned Timeline
GoldenPhoenixProtocol	Automatic buyback/burn using USDT revenues, insurance fund for price protection. Parameters: insurancePercent (3–10%), buybackPercent (15–35%), burnPercent and rewardPercent (30–70%, sum 100%). Invariant: insurance + buyback = 30.	Q3 2026
DAO Voting	Participation in ecosystem development votes (contract in development, code ready)	Q4 2026
ONE+ Platform	Access to gaming features, mini games, and in game items (design phase)	Q3 2027
ClownCare Bridge	Transparent fund distribution system with on chain reporting and monthly reports (design phase)	Q2 2027
________________________________________
# 9. TECHNOLOGY & SECURITY
# 9.1. Deployed Contracts (code published and verified)
Contract	Status	Link
PanjoCoin (token)	✅ Verified	PolygonScan
PNJCLiquidityLockerV2	✅ Code published	GitHub: /Smart Contracts/PNJC_LiquidityLocker.sol
PNJC_GoldenPhoenixProtocol	✅ Code published	GitHub: /Smart Contracts/PNJC_GoldenPhoenixProtocol.sol
PNJCAirdrop	✅ Code published	GitHub: /Smart Contracts/PNJCAirdrop.sol
PNJCVestingVault	✅ Code published	GitHub: /Smart Contracts/PNJCVestingVault.sol
PNJCTreasuryVault	✅ Code published	GitHub: /Smart Contracts/PNJCTreasuryVault.sol
DAO Governor	✅ Code published	GitHub: /Smart Contracts/PNJC_DAO_Governor.sol
# 9.2. Confirmed Security Measures (from code)
Measure	Status	Evidence
OpenZeppelin 5.0.2	✅	Imported in token and other contracts
ReentrancyGuard	✅	Used in locker and GoldenPhoenix
No selfdestruct	✅	Absent from code
No delegatecall	✅	Absent from code
No upgradeable	✅	Contracts do not inherit UUPS or TransparentUpgradeableProxy
No owner (token)	✅	Contract does not inherit Ownable
Owner — multisig (for Ownable contracts)	✅	Constructors provide ownership transfer to multisig
Code verified	✅	PolygonScan
# 9.3. Gas Optimization
•	Average transfer cost: ~50,000 gas
•	Token bytecode size: ~12 KB
•	Contract optimized for Polygon network (compiler 0.8.34 with optimizations)
# 9.4. On-Chain Confirmations
Token Contract Verification:
PolygonScan — 0x781C0d15347Cb0B94C42C65c7a67E70371205De5
Planned Liquidity Lock:
•	Locker contract: PNJCLiquidityLockerV2 (code published on GitHub, deployment scheduled imminently)
•	Lock volume: 500,000,000,000 PNJC (50% of total supply)
•	Lock period: 12 months. Exact end date and contract address to be announced at deployment.
•	Early withdrawal right: none (contract contains no emergencyWithdraw)
•	Locker contract address and lock transaction hash will be published in official sources after deployment
•	Status verification: call getLock(lockId) on deployed locker contract
Distribution Wallets (all public):
Each address is listed in Section 6.2 and is viewable on PolygonScan.
________________________________________
# 10. AUDIT & VERIFICATION
# 10.1. Completed Checks
Check	Status
Verification on PolygonScan	✅ Completed
Internal testing (unit tests using Hardhat)	✅ Completed
Community code review (open GitHub)	🔄 Available to all
# 10.2. Planned Independent Audits
All contracts (both deployed and ready for deployment) will be reviewed by independent audit firms. Audit results will be published on the website and GitHub repository.
Contract	Planned Auditor	Timeline
PanjoCoin (token)	CertiK	Q2 2026
PNJCLiquidityLockerV2	CertiK	Q2 2026
GoldenPhoenixProtocol	CertiK / Hacken	Q3 2026
VestingVault	CertiK / Hacken	Q3 2026
Airdrop	CertiK / Hacken	Q2 2026
TreasuryVault	CertiK / Hacken	Q3 2026
DAO Governor	CertiK / Hacken	Q4 2026
Note: At the time of this Whitepaper publication, independent audit has not yet been conducted. The project is in its early stages, and audits will be completed before listings on centralized exchanges and before activation of each module.
________________________________________
# 11. LEGAL & COMPLIANCE
# 11.1. Token Status (Not a Security)
PNJC is a utility token that provides access to ecosystem services. The token does not grant rights to:
•	Income or dividends
•	Share in the project
•	Expectation of profit from project activities
•	Property rights (DAO voting, when implemented, does not grant rights to project assets)
# 11.2. Country Classification by Regulation
Users bear personal responsibility for complying with their country's laws. As of 2026:
🚫 Countries with Absolute Prohibition (ownership, trading, mining prohibited)
Afghanistan, Algeria, Bangladesh, Bolivia, China, Egypt, Iraq, Morocco, Nepal, Qatar, Tunisia, North Macedonia.
⚠️ Countries with Restrictions (partial prohibition or high taxes)
•	India: 30% tax on profits + 1% TDS
•	Indonesia: payments prohibited, trading permitted
•	Turkey: payments prohibited
•	Nigeria: banking channels disabled for crypto operations
•	Russia
✅ Countries with Permitted Circulation (trading and ownership permitted)
USA, UK, Germany, Japan, Brazil, Mexico, Philippines, Singapore, Switzerland, UAE, El Salvador, South Korea, all EU countries (under MiCA).
Full list and conditions are provided in the "Restricted Countries List v1.0" document.
11.3. KYC/AML Policy
The project complies with basic AML/CFT principles as described in AML Policy v1.0. For listings on centralized exchanges, KYC verification will be implemented in accordance with specific exchange requirements.
________________________________________
# 12. RISK DISCLOSURE
Purchasing and using PNJC involves the following risks (full list provided in "Risk Disclosure v1.0"):
Risk	Description
Market Risks	Token price is determined by the market and may fluctuate both upward and downward; complete loss of value is possible
Liquidity Risks	Ability to sell tokens is not guaranteed; pool depth may be insufficient
Technical Risks	Possibility of unknown vulnerabilities in smart contracts (despite verification and future audits)
Regulatory Risks	Cryptocurrency laws may change in any jurisdiction, affecting token usability
Development Risks	Planned features (DAO, deflation, games) may not be fully implemented, may be delayed, or may not be implemented at all (although code is ready, deployment may be postponed for technical or regulatory reasons)
Centralization Risks	Currently, key wallet management is through multisig; full decentralization will only be achieved after DAO launch
Important to understand:
The token provides access to ecosystem services. Its acquisition is not an investment and does not guarantee income. The token price may fall to zero. Only participate with funds you are prepared to lose completely.
________________________________________
# 13. ROADMAP — 24 MONTHS
Updated as of July 9, 2026, reflecting actual progress.
Distribution Principles:
•	Priority — completion of delayed Q2 2026 stages (audit, LP lock, airdrop) in the first two months.
•	Most smart contract code is already ready, so main efforts are focused on audit, deployment, configuration, and integration.
•	Backend services (ONE+, ClownCare Bridge) require full development, hence extended timelines.
•	Post release activities (scaling, marketing, partnerships) fill the remaining months.
Month	Period	Module / Stage	Details
1	July 2026	Completion of token and locker audit
Liquidity Lock
MerkleAirdrop	Conduct independent audit (if not done). Deploy PNJCLiquidityLockerV2, lock 50% LP for 12 months. Launch Merkle tree airdrop.
2	August 2026	VestingVault
TreasuryVault	Deploy vesting contracts for team and founder (12 month linear schedule). Activate multisig treasury with transparent reporting.
3	September 2026	GoldenPhoenixProtocol	Deploy deflationary engine (automatic buyback/burn + insurance fund). Initial parameter configuration (insurance 5%, buyback 25%, burn 70%).
4	October 2026	DAO Governor Preparation	DAO code audit, parameter configuration (quorum 4%, voting period 7 days). Integration with Snapshot for off chain voting.
5	November 2026	DAO Governor Testing	Deploy to Polygon testnet, internal testing, community engagement for trial votes.
6	December 2026	DAO Governor Launch	Mainnet deployment, transfer of governance to DAO (first votes on key ecosystem parameters).
7	January 2027	Post DAO: Marketing & Community	Launch educational campaigns, ambassador program, crypto media partnerships.
8	February 2027	Utility Development (quick wins)	Integration with additional DEX aggregators, launch referral program (smart contract based).
9	March 2027	Analysis & Adjustment	Collect metrics on deflationary engine, DAO votes, community activity. Prepare community report.
10	April 2027	ClownCare Bridge — Design	Formalize requirements for charity platform, develop backend and smart contract architecture.
11	May 2027	ClownCare Bridge — Development	Write smart contracts (if modifications needed) and backend services for transparent on chain reporting.
12	June 2027	ClownCare Bridge — Testing & Audit	Internal testing, independent audit, testnet deployment.
13	July 2027	ClownCare Bridge — Launch	Mainnet deployment, first charitable disbursements (pilot with SmileDonate foundation).
14	August 2027	ONE+ — Development Start	Gaming platform design: stack selection, UI design, PNJC token integration.
15	September 2027	ONE+ — Prototype	Create MVP with basic games (mini games, in game items).
16	October 2027	ONE+ — Internal Testing	QA testing, critical bug fixes, gas optimization.
17	November 2027	ONE+ — Community Beta	Open access for PNJC holders, feedback collection.
18	December 2027	ONE+ — Official Launch	Public platform release, in game referral system launch.
19	January 2028	ONE+ Scaling	Add new games, integrate with NFT marketplaces, gaming studio partnerships.
20	February 2028	DAO & Deflation Model Enhancement	Implement changes based on voting results (buyback parameters, insurance fund distribution).
21	March 2028	Cross Chain Integration (optional)	Research feasibility of deploying PNJC on other networks (e.g., Arbitrum, Optimism) via bridges.
22	April 2028	New Charity Programs Launch	Expand ClownCare Bridge to new regions, automate reporting.
23	May 2028	"2 Years of PNJC" Marketing Campaign	Summary of results, public reporting, team interviews, active participant awards.
24	June 2028	Next Cycle Planning	Define 2028–2029 priorities based on DAO votes and metrics.
Key Changes from Original Roadmap:
•	MerkleAirdrop moved to July 2026 (was Q2 2026, not completed).
•	Liquidity lock shifted to July 2026, but lock period remains 12 months.
•	All contract audits integrated into first months (July–September 2026) to avoid deployment delays.
•	ONE+ and ClownCare Bridge preserved in same quarters but detailed by month.
•	Post release stages added (months 19–24) to ensure long term development and community retention.
Risks and Assumptions:
•	All timelines depend on independent audit results. Critical vulnerability discoveries may delay deployment.
•	Backend service development (ONE+, ClownCare) may require additional resources, affecting the schedule.
•	Regulatory changes may require legal and functional adjustments.
________________________________________
# 14. TEAM
# 14.1. Founder
Parameter	Details
Name	Tengo Kalandia
Experience	11+ years in charitable sector (Director of SmileDonate Foundation)
Role in Project	Smart contract developer, Whitepaper author, strategic development
Status	Fully doxxed (public reputation, not anonymous)
# 14.2. Council (expansion planned)
Currently, the project is managed by the founder with support from a multisig wallet (3 of 5). In the future, management will be transferred to DAO.
Multisig key holders (until DAO launch):
1.	Tengo Kalandia (founder)
2.	Technical advisor (to be appointed)
3.	Strategic advisor (to be appointed)
4.	Backup key (auditor)
5.	Backup key (community)
Key Transfer Plan (after DAO launch):
•	Keys will be transferred to independent community members elected through DAO.
•	Geographic distribution of keys (Europe, North America, Asia).
________________________________________
# 15. SOURCE OF TRUTH
Priority in case of conflicts between documents:
1.	Smart contract state on blockchain (Polygon)
2.	Blockchain transaction history
3.	Verified smart contract source code
4.	This Whitepaper (document)
________________________________________
# 16. COMMUNITY & MARKETING
"Organic Joy" Strategy:
•	Viral memes and videos featuring real Shar Pei Panjo
•	Video reports from Iashvili Hospital (charity transparency)
•	Partnerships with crypto influencers and social bloggers
•	Active community engagement via X (Twitter), Telegram, and YouTube
________________________________________
# 17. CONCLUSION
PanjoCoin (PNJC) is a utility digital asset that currently provides a secure and transparent token for DEX trading, with phased deployment of additional modules (DAO, deflation, vesting, airdrop, treasury) according to the roadmap. All additional contracts already have ready code published in the open repository and will undergo independent audit before activation.
Key advantages right now:
•	Maximum security (ownerless contract, 0% tax, no hidden functions)
•	Full transparency (all addresses and transactions public)
•	Verified code on PolygonScan and open GitHub
The roadmap and ready modules ensure long term perspective and real token utility.
Join us — every step brings us closer to a child's smile and a sustainable ecosystem.
________________________________________
# 18. OFFICIAL LINKS
Resource	Link
Website	www.cryptotengo.com

Smart Contract (token)	0x781C0d15347Cb0B94C42C65c7a67E70371205De5
GitHub (contract code)	github.com/CryptoTengo/PanjoCoin

Liquidity Lock (transaction)	To be added after locker deployment
Network	Polygon PoS
DEX	Uniswap V2
Socials	X (Twitter)
________________________________________
# 19. FINAL CLASSIFICATION
#	Criterion	Status	Explanation
1	Fixed Supply	✅	1 trillion PNJC, emission occurred at deployment
2	Ownerless Contract	✅	owner = address(0), no Ownable
3	No Hidden Functions	✅	No mint(), blacklist, pause(), freeze()
4	Zero Transaction Tax	✅	0% on buy, sell, transfer
5	Open and Verified Code	✅	PolygonScan + GitHub
6	Transparent Distribution	✅	All addresses and amounts published
7	Doxxed Team	✅	Founder publicly known
8	Clear Separation of Implemented and Planned	✅	Sections 5.1 and 5.2, roadmap
9	Decentralization Plan via DAO	🧩	Code ready, deployment planned (Q4 2026)
10	Liquidity Lock	🧩	Code ready, deployment planned (12 months, to be announced)
11	No Investment Formulations	✅	Clearly stated token does not grant income rights
12	Risk Disclosure	✅	Full risk section (and separate document)
13	Legal Country Classification	✅	Prohibited, restricted, permitted (separate document)
14	Independent Audit Plan	🧩	Scheduled but not yet conducted (will be before module activation)
15	Additional Contracts Ready	🧩	All module code published, staged deployment
________________________________________
© 2026 PanjoCoin. All rights reserved.
Document Version: v1.0 (roadmap updated)
Last Updated: July 9, 2026

