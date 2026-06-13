# 📄 PanjoCoin (PNJC) — Official Whitepaper

**June 13, 2026 | Version 1.0**

*Full compliance with smart contract, on-chain distribution, and Technical Specification v.1.0*

🐕 **Official token of Panjo the Shar Pei in support of SmileDonate (ClownCare)**

✅ DEX READY

---

## 📖 Prologue: The Legend of Panjo the Shar Pei

In a quiet district of Tbilisi, where old chestnut trees lean over the avenue, stands the **M. Iashvili Central Children's Hospital**. A place where every day, young patients fight the most serious illnesses: oncological hematology, neurosurgical pathologies.

One day, a **Shar Pei named Panjo** (affectionately — Panjo) was passing by the hospital. He had neither money nor power. Only a charming wrinkled face and a huge loving heart.

Suddenly, from the **third floor** — where the oncology-hematology and neurosurgery wards are located — he heard a child crying. It wasn't a tantrum. It was the cry of a child who had been fighting pain for too long.

Panjo stopped. Looked up. Saw a small tear-streaked face in the window.

Shar Peis cannot speak, but they know how to love. And Panjo **smiled** — the way only they can: wide, with squinted eyes and his tongue hanging out, turning his wrinkled face into a bundle of joy.

Not for food. Not for praise. Simply because he couldn't do otherwise.

He started shuffling his paws comically, wagging his tail, pretending to catch an invisible ball. And after a few seconds, a miracle happened: **the child smiled back**.

That smile became the greatest reward of Panjo's life.

From that day on, he kept coming back to the hospital. He would sit under the third-floor windows and wait. And when he saw a familiar face, he would begin his performance. The children waited for him. The children laughed. And with the laughter, the pain receded.

Thus came the first **"Panjo the Shar Pei's Coin"** — not as a symbol of wealth, but as a symbol of a smile that cannot be bought but can be given.

Today, this story lives on the Polygon blockchain. Every **PNJC** token is not just a digital coin. It is a piece of that very smile of a wrinkled Shar Pei that once changed the life of one child at the Iashvili Hospital.

---

## 📑 Table of Contents

1. [Executive Summary](#1--executive-summary)
2. [Vision & Mission](#2--vision--mission)
3. [Technical Specifications](#3-️-technical-specifications)
4. [Tokenomics & Distribution](#4--tokenomics--distribution)
5. [Staged Market Release Mechanism](#5--staged-market-release-mechanism)
6. [Investor Protection Mechanisms](#6--investor-protection-mechanisms)
7. [Deflationary Model](#7--deflationary-model)
8. [Liquidity Model](#8--liquidity-model)
9. [Treasury Management](#9--treasury-management)
10. [Charity Mission: SmileDonate & ClownCare](#10--charity-mission-smiledonate--clowncare)
11. [Agile Development Note & Roadmap](#11--agile-development-note--roadmap)
12. [How to Buy PNJC (with Slippage Settings)](#12--how-to-buy-pnjc-with-slippage-settings)
13. [Investor's Risk Checklist](#13-️-investors-risk-checklist)
14. [FAQ (Frequently Asked Questions)](#14--faq-frequently-asked-questions)
15. [Glossary for Beginners](#15--glossary-for-beginners)
16. [Social Channels & Community](#16--social-channels--community)
17. [Risks & Disclaimers](#17-️-risks--disclaimers)
18. [Conclusion](#18--conclusion)
19. [Official Links](#19--official-links)
20. [Epilogue](#20--epilogue)

---

## 1. 🧠 Executive Summary

**PanjoCoin (PNJC)** is a deflationary ERC-20 token with a fixed supply, deployed on the Polygon network. The project combines meme coin culture with institutional-grade transparency and a real social mission, inspired by the legend of Panjo the Shar Pei — a symbol of kindness and selfless giving.

### Key Facts

| Parameter | Value |
| :--- | :--- |
| **Ticker** | PNJC |
| **Network** | Polygon (PoS) |
| **Total Supply** | 1,000,000,000,000 (1 trillion) |
| **Initial Circulation** | ~100 billion (10%) |
| **Release Mechanism** | Staged (10% initially → +10% of remaining every 6 months) |
| **Charity Allocation** | 5% → SmileDonate → ClownCare |
| **Contract Status** | Verified, no owner, no mint |

### Why PNJC Differs from 99% of Meme Tokens

| Principle | Implementation | Advantage |
| :--- | :--- | :--- |
| **Scarcity** | `_MAX_TOTAL_SUPPLY = 1T`, no `mint()` | Inflation protection |
| **Trustless** | No `Ownable`, no `owner()`. Fixed supply, no admin functions | No centralized control |
| **0% Tax** | No fee mechanisms | Maximum liquidity |
| **Transparency** | 7 public wallets with verified distribution | Fully verifiable |
| **Social Mission** | 5% to charity reserve | On-chain allocatable |

---

## 2. 🌐 Vision & Mission

### Vision

To create a sustainable funding model for pediatric medical clowning through a decentralized crypto ecosystem, where every token holder becomes **a participant in healing through smiles**.

### Mission

1. Provide regular funding for the ClownCare program in the oncology-hematology and neurosurgery wards of the M. Iashvili Central Children's Hospital.
2. Expand the program to other wards and hospitals in Georgia and beyond.
3. Prove that meme coins can be an effective tool for charity, not just speculation.

### Philosophical Foundation

The project is built upon two fundamental sources:

👉 The Legend of Panjo the Shar Pei — a symbol of selfless kindness and transparency.
👉 Founder's article: ["Meme Coins — A Threat or an Opportunity for the Crypto Industry?"](https://medium.com/@cryptotengo/meme-coins-a-threat-or-an-opportunity-for-the-crypto-industry-0f757c08cf31)

---

## 3. ⚙️ Technical Specifications

### 3.1. Token Parameters

| Parameter | Value | Status |
| :--- | :--- | :--- |
| **Token Name** | PanjoCoin | ✅ LIVE |
| **Ticker** | PNJC | ✅ LIVE |
| **Network** | Polygon (PoS) | ✅ LIVE |
| **Standard** | ERC-20 + EIP-2612 + ERC20Burnable | ✅ LIVE |
| **Contract Address** | `0x781C0d15347Cb0B94C42C65c7a67E70371205De5` | ✅ Verified |
| **Total Supply** | 1,000,000,000,000 PNJC | ✅ FIXED |
| **Decimals** | 18 | ✅ |
| **Mint Function** | ❌ Absent | ✅ Absolute protection |
| **Owner / Admin** | ❌ Absent | ✅ No centralized control |
| **Proxy / Upgrade** | ❌ Absent | ✅ Immutable code |

### 3.2. Key Code Constants

```solidity
// FROM SMART CONTRACT (PNJC.sol):
uint256 private constant _MAX_TOTAL_SUPPLY = 1_000_000_000_000 * 10**18;
// 1,000,000,000,000 PNJC (one trillion)

// No mint() function
// No Ownable import
// Inherits: ERC20, ERC20Permit, ERC20Burnable
3.3. Trading Infrastructure
Parameter	Value	Status
Primary DEX	Uniswap V3	⏳ To be created after launch
Trading Pair	PNJC / USDT (or PNJC / POL)	⏳ To be created
CEX Listing	❌ Not planned at this stage	—
Data Aggregators	❌ Applications not submitted	—
📌 Important clarification: At this stage, the project focuses exclusively on DEX (Uniswap V3). CEX listings and data aggregator applications are not planned until the project proves its viability and achieves sufficient market capitalization.

4. 📊 Tokenomics & Distribution
4.1. Architectural Decision
The PNJC smart contract is a pure ERC-20 token and contains no built-in distribution, vesting, or locking mechanisms. All tokens (1 trillion PNJC) were minted to the initialOwner address at deployment, then immediately distributed across 7 target wallets via on-chain transactions. The deployer address now holds 0 PNJC.

4.2. Final On-Chain Distribution
#	Purpose	Share	Amount (PNJC)	Wallet Address (Polygon)
1	Liquidity (DEX)	50%	500,000,000,000	0xf55B994FDD7019d8E99c632c76A6e0AdE765988A
2	Project Treasury	12%	120,000,000,000	0xD539a54f54e9B174F831D9Da6b48ac15441fC581
3	DAO Treasury	10%	100,000,000,000	0xD5e2DD65BA4984565b53EFdcec6A9D2F494b5FE2
4	Core Team	10%	100,000,000,000	0xdEBACbF7f51C3865dc2034ED676D3d344954f9FE
5	Community & Growth	8%	80,000,000,000	0x54D3beB9e0F473803cC7a972Db2C17f005a2D089
6	Founder (Tengo)	5%	50,000,000,000	0xF48840486697AE3c15D38E30e45cECB9897CfA74
7	Charity Reserve (SmileDonate)	5%	50,000,000,000	0xa22E471BF4e405c92bDD074792d8d36923e31055
TOTAL	100%	1,000,000,000,000	All wallets public
4.3. Distribution Visualization
text
┌─────────────────────────────────────────────────────────────────┐
│                    PNJC TOTAL SUPPLY: 1T                        │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ████████████████████████████████████████████  50% Liquidity    │
│  ████████████████████████                      12% Treasury     │
│  ████████████████████                          10% Core Team    │
│  ████████████████████                          10% DAO Treasury │
│  ████████                                       8% Community    │
│  ██████████                                     5% Founder      │
│  ██████████                                     5% Charity      │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
✅ All addresses are verified. Distribution transactions are confirmed on-chain. Every PNJC holder can check any wallet's balance in real time via PolygonScan.

5. 🔄 Staged Market Release Mechanism
5.1. Core Principle
At the time of listing (T+0), only 10% of total supply (100 billion PNJC) is in free circulation.
Every 6 months thereafter, an additional 10% of the remaining locked supply is released to the market.

5.2. Calculation Formula
Let:

S_total = 1,000,000,000,000 PNJC

R_0 = 0.10 × S_total = 100,000,000,000 PNJC (initial release)

B_0 = S_total - R_0 = 900,000,000,000 PNJC (initially locked)

Every 6 months:

text
R_n = 0.10 × B_n-1
B_n = B_n-1 - R_n
5.3. Release Schedule (First 3 Years)
Period	Market Release	Cumulative Release	Remaining Locked
T+0 (Listing)	100B (10%)	100B (10%)	900B (90%)
T+6 months	90B (9%)	190B (19%)	810B (81%)
T+12 months	81B (8.1%)	271B (27.1%)	729B (72.9%)
T+18 months	72.9B (7.29%)	343.9B (34.39%)	656.1B (65.61%)
T+24 months	65.61B (6.56%)	409.51B (40.95%)	590.49B (59.05%)
T+30 months	59.05B (5.90%)	468.56B (46.86%)	531.44B (53.14%)
T+36 months	53.14B (5.31%)	521.70B (52.17%)	478.30B (47.83%)
5.4. Advantages of This Model
Advantage	Description
No dump at listing	Only 10% of supply on the market initially
Predictability	Anyone can calculate the schedule
Exponential deceleration	Each subsequent release is smaller
Team alignment	Team and Founder follow the same schedule
6. 🔒 Investor Protection Mechanisms
6.1. Liquidity Lock (Planned)
Parameter	Value
Wallet	0xf55B994FDD7019d8E99c632c76A6e0AdE765988A
Volume	500,000,000,000 PNJC (50% of supply)
Initial LP Release	50 billion (10% of Liquidity Wallet)
Lock Platform	Unicrypt / PinkSale
Lock Duration	6–12 months from DEX launch
Status	⏳ Planned — to be executed at DEX launch
✅ Value to investors: Once locked, liquidity remains on DEX regardless of any individual wallet compromises.

6.2. Vesting (Team + Founder)
Parameter	Value
Wallets	Core Team + Founder
Total Volume	150,000,000,000 PNJC (15%)
Initial Release	0 PNJC
Cliff Period	6 months
Release Schedule	Follows global schedule
Status	⏳ To be implemented via separate vesting contract
6.3. Multisig Treasury (Planned)
Parameter	Value
Wallets	Project Treasury + DAO Treasury
Platform	Gnosis Safe (Safe.global)
Signature Type	Multisig 3/5
Signers	5 trusted individuals from different jurisdictions
Status	⏳ Planned — to be configured
✅ Value to investors: Once implemented, compromising one private key will not lead to treasury fund theft.

6.4. Lock Structure Summary
Wallet	Volume	Initial Release	Lock Mechanism	Status
Liquidity (DEX)	500B	50B	Lock 6–12 months	⏳ Planned
Project Treasury	120B	20B	Multisig 3/5	⏳ Planned
DAO Treasury	100B	0	Governance-lock	⏳ Planned
Core Team	100B	0	Vesting	⏳ Planned
Community & Growth	80B	10B	Reward Pool	⏳ Planned
Founder	50B	0	Vesting	⏳ Planned
Charity Reserve	50B	0	Charity use	✅ Active
Total	1T	~100B (10%)	90% locked	—
⚠️ Important: Investor protection mechanisms described above are currently at the planning stage and will be implemented before or at DEX launch. The contract itself provides no built-in locking or vesting. Current protection relies on transparent on-chain distribution across 7 public wallets and the deployer address holding 0 tokens.

7. 🔥 Deflationary Model
7.1. Burnable Mechanism
The PNJC smart contract inherits ERC20Burnable:

solidity
// Any holder can burn their tokens:
function burn(uint256 amount) external;
function burnFrom(address account, uint256 amount) external;
7.2. Sources of Deflation
Factor	Effect
Fixed supply	Supply is hard-capped at 1 trillion
Burnable function	Holders can voluntarily burn tokens
Token loss	Tokens on "dead" wallets (lost access)
7.3. What Is Absent (No Inflation)
Mechanism	Status
Mint function	❌ Absent
Ownable	❌ Absent
Transaction taxes	❌ 0%
Rebase mechanism	❌ Absent
Inflationary staking	❌ Absent
8. 💧 Liquidity Model
8.1. Uniswap V3 Pool Configuration
Parameter	Value
DEX	Uniswap V3
Trading Pair	PNJC / USDT (or PNJC / POL)
Initial Liquidity	50 billion PNJC + equivalent in stablecoins
Fee Tier	0.05% or 0.30%
Lock	6–12 months via Unicrypt/PinkSale
Status	⏳ Planned — to be executed at DEX launch
8.2. Liquidity Maintenance Strategy
Stage	Action
Launch	Add 50 billion PNJC + USDT to Uniswap V3
Lock	LP tokens locked for 6–12 months
Support	Treasury adds liquidity if needed
Expansion	Add new price ranges as market cap grows
9. 🏦 Treasury Management
9.1. Project Treasury Structure (120 billion PNJC)
Use	Share	Purpose
Marketing	40%	Influencers, ads, contests, meme campaigns
Development	30%	Audits, developer contracts, hosting
Legal Expenses	10%	Registration, compliance, consultation
Additional Liquidity	10%	Support for Uniswap pools
Reserve	10%	Contingency expenses
9.2. Spending Principles
Principle	Description
Transparency	All Treasury transactions are public (via Multisig)
Minimization	Expenses only for critical priorities
Decentralization priority	Maximum use of DAO for major expenditures
Long-term focus	Treasury balances converted to stablecoins when necessary
10. 🎭 Charity Mission: SmileDonate & ClownCare
10.1. Why This Hospital and These Wards?
The M. Iashvili Central Children's Hospital is the largest children's hospital in Georgia. Children with the most severe diagnoses from across the country are treated here.

Oncology-Hematology Ward (3rd floor) — children with blood cancer. Long months of chemotherapy, pain, fear.

Neurosurgery Ward (3rd floor) — children with brain tumors, traumatic brain injuries, complex surgeries.

It was from the third floor that Panjo heard that very cry. It is in these wards that his smile is needed most.

10.2. ClownCare Program
Parameter	Value
What clowns do	Games, dances, magic tricks, improvisations in wards and procedure rooms
Visit frequency	Weekly (currently), planned 2-3 times per week
Duration	2-4 hours per ward
Goal	Reduce anxiety and pain through laughter, increase motivation for treatment
10.3. Financial Model
Expense Item	Frequency	Amount
Professional clown salaries	Monthly	From Charity Reserve
Materials (props, costumes)	As needed	From Charity Reserve
Transport and logistics	Monthly	From Charity Reserve
Expansion to new wards	Quarterly	By DAO decision
10.4. Transparency
✅ SmileDonate wallet is public: 0xa22E471BF4e405c92bDD074792d8d36923e31055

✅ Every transaction to the foundation is tagged on PolygonScan

✅ SmileDonate publishes monthly reports on clown visits

✅ Video and photo reports are in the project's social media

⚠️ Important: No automated smart contract donation logic currently exists. Charity allocation is managed off-chain with on-chain transparency. See Charity Model document for full details.

🔥 Every PNJC token you hold is a piece of a child's smile at the Iashvili Hospital.

11. 🧠 Agile Development Note & Roadmap
Development Note: As a project led by a solo-founder with AI-assisted infrastructure, our roadmap prioritizes rapid, secure, and iterative deployment. All development milestones are tracked via transparent on-chain deployments and public project documentation.

Phase	Focus Area	Key Milestones	Status
Phase 1	Foundational	Contract deployment, fixed supply, on-chain distribution verified	✅ Completed
Phase 2	Security	Deployment of PNJC_LiquidityLocker.sol and PNJC_Timelock.sol for treasury security	🏗 In Progress
Phase 3	Utility	Launch of PNJC_Staking.sol & CryptoTengo Hub (Web3 dApp dashboard)	📋 Planned
Phase 4	Governance	Activation of PNJC_Governance.sol & migration to DAO-based multisig treasury	📋 Planned
Phase 5	Social Impact	Automated SmileDonate integration, on-chain Impact Trails, scaling ClownCare	🔮 Vision
⚠️ Note: No dates are guaranteed. Phases may be delayed, changed, or cancelled. See Roadmap document for current status.

12. 🚀 How to Buy PNJC (with Slippage Settings)
⚠️ Before buying: Make sure you are using the official contract address (below). Scammers may create fake tokens. Never enter your seed phrase on third-party websites.

Step-by-Step Guide
Step	Action	Details
1	Install a wallet	Download MetaMask or Trust Wallet (Polygon support)
2	Add Polygon network	In MetaMask: Settings → Networks → Add Polygon (PoS)
3	Buy POL and USDT	POL for gas fees, USDT to swap for PNJC
4	Go to Uniswap V3	app.uniswap.org → connect wallet → select Polygon
5	Paste contract address	0x781C0d15347Cb0B94C42C65c7a67E70371205De5
6	Set Slippage	Click the gear icon (⚙️) in Uniswap → set 1-3% (2% recommended)
7	Swap USDT → PNJC	Enter amount → confirm in wallet
8	Add token to wallet	In MetaMask: Import tokens → paste contract address
⚠️ Important Reminders
Gas fees are paid in POL (formerly MATIC). Make sure you have at least 1 POL in your wallet.

Slippage: Recommended 1-3% (2% is optimal). If the transaction fails, increase to 5% (but not higher).

Verify the address: Always check the contract address against this document. Scammers may create fake tokens with similar symbols.

No one will ask for your seed phrase: The official PanjoCoin team never requests private keys.

13. ⚠️ Investor's Risk Checklist
Before buying PNJC, ask yourself these questions:

Question	Your Answer	Status
I understand that cryptocurrencies are extremely volatile?	✅ / ❌	Personal responsibility
I am prepared to lose 100% of my investment?	✅ / ❌	Personal responsibility
I have verified the contract address on PolygonScan?	✅ / ❌	Verify here
I have confirmed that the token has no owner() and no mint()?	✅ / ❌	Yes, by code
I understand that protection mechanisms are planned, not yet implemented?	✅ / ❌	Yes, per section 6
I do not expect guaranteed profit?	✅ / ❌	Yes, risks are high
I set Slippage to 1-3% before buying?	✅ / ❌	Yes, per instructions
⚠️ If you cannot answer "YES" to all questions — do not buy PNJC. Study the documentation first.

14. ❓ FAQ (Frequently Asked Questions)
Q1: Is this a scam? Is there a rug-pull risk?

Answer: The smart contract contains no owner() or mint() functions. This means no one can create new tokens, freeze wallets, or change contract rules. The full 1 trillion supply has been distributed to 7 public wallets (verified on-chain), and the deployer address holds 0 tokens. Liquidity lock via Unicrypt/PinkSale is planned before DEX launch. As with any crypto project, users should conduct their own research (DYOR).

Q2: Why is 90% of supply locked? Isn't that manipulation?

Answer: This is dump protection. The staged release (10% initially → +10% of remaining every 6 months) prevents the team from selling all tokens at once. Team and Founder follow the same schedule as Liquidity.

Q3: Where can I buy PNJC?

Answer: Only on Uniswap V3 (Polygon) after the liquidity pool is created. The link will be published on Twitter and Discord.

Q4: Is there a tax on buying/selling?

Answer: No, 0% tax. The contract has no fee mechanisms. You receive exactly as many tokens as you swap (minus Uniswap fees and gas in POL).

Q5: Where does the 5% charity go?

Answer: To the wallet 0xa22E471BF4e405c92bDD074792d8d36923e31055, then to the SmileDonate foundation for the ClownCare program (medical clowning) in the oncology-hematology and neurosurgery wards of the M. Iashvili Hospital (Tbilisi, 3rd floor). All transactions are public. No automated on-chain donation logic currently exists.

Q6: When will the audit be done?

Answer: A formal third-party audit (Certik or Hacken) is planned for Q4 2026. The code is already verified on PolygonScan. The full paid audit will be conducted after sufficient liquidity is established.

Q7: Will there be staking?

Answer: Staking is planned for Phase 3 of the roadmap. No staking contracts exist yet. See Roadmap document for current status.

15. 📖 Glossary for Beginners
Term	Explanation
ERC-20	Token standard on Ethereum and compatible networks (Polygon)
Polygon (PoS)	Blockchain with low fees and fast transactions
Uniswap V3	Decentralized exchange (DEX) for swapping tokens
Liquidity Pool (LP)	Pool of tokens that enables swapping
Liquidity Lock	Locking LP tokens for a period — protection against rug-pulls
Vesting	Gradual unlocking of tokens according to a schedule
Multisig (3/5)	Multi-signature wallet: 3 out of 5 signatures required for a transaction
Rug-pull	Fraud where creators withdraw all liquidity
DYOR	Do Your Own Research
Gas	Transaction fee on a blockchain (on Polygon — in POL)
Slippage	Price difference between order placement and execution
POL	Native gas token of Polygon (formerly MATIC)
16. 📢 Social Channels & Community
Platform	Link	Content Type
Twitter (X)	@CryptoTengo	News, memes, announcements
Discord	Invite Link	Community, voting
GitHub	CryptoTengo/PanjoCoin	Code, documentation
Medium	@cryptotengo	Articles, analysis
YouTube	@CryptoTengo	Videos, guides
Reddit	u/cryptotengo	Discussions, AMA
Instagram	@crypto.tengo	Visual content, memes
TikTok	@cryptotengo	Viral short videos
Facebook	cryptotengo	News mirror
✅ 9 public channels — proof of team's real presence and transparency.

17. ⚠️ Risks & Disclaimers
17.1. Primary Risks
Risk	Probability	Mitigation
Market volatility	High	0% Tax enables fast entry/exit
Loss of interest	Medium	Social mission retains audience
Technical vulnerabilities	Low	OpenZeppelin + verification
Regulatory risks	Low	Full decentralization (no owner)
17.2. Important Disclaimers
⚠️ PanjoCoin (PNJC) is NOT:

A security or investment contract

An instrument with guaranteed returns

A financial pyramid scheme

⚠️ Participating in this project means:

Full responsibility for your own decisions (DYOR)

Understanding all risks of the cryptocurrency market

No claims against the team in case of financial loss

📄 See also: Legal Disclaimer, Security Policy, and Technical Specification for complete risk and security information.

18. 🏁 Conclusion
18.1. Summary
PanjoCoin (PNJC) is a next-generation meme token that combines:

✅ Verified code (no owner, no mint, immutable contract)

✅ Full transparency (7 public wallets, on-chain distribution confirmed)

✅ Predictable supply (staged release: 10% → +10% of remaining)

✅ Real social mission (5% to SmileDonate → ClownCare at Iashvili Hospital, 3rd floor)

✅ Active community (9 social channels)

✅ Heart and soul (Panjo the Shar Pei — a wrinkled dog who made a sick child smile)

✅ Clear documentation (multiple documents covering technical, legal, and roadmap aspects)

18.2. Documentation Ecosystem
This Whitepaper is part of a complete documentation suite:

Document	Purpose
Technical Specification	Engineering details, architecture, failure modes
Tokenomics	Supply mechanics, distribution, vesting schedules
Legal Disclaimer	Risk acceptance, liability limitation
Charity Model	Social initiative structure and limitations
Security Policy	Responsible disclosure, security principles
Smart Contract Verification	On-chain verification status
Ecosystem Overview	Current vs planned module status
Use Cases	Current LIVE vs planned functionality
Roadmap	Phase-based development timeline
Buying Guide	Step-by-step purchase instructions
18.3. Document Hierarchy
In case of inconsistencies:

Smart Contract > Technical Specification > Whitepaper > Tokenomics > Roadmap > Supporting Documents

19. 🔗 Official Links
Smart Contract & Wallets
Purpose	Address
Smart Contract (PNJC)	0x781C0d15347Cb0B94C42C65c7a67E70371205De5
Liquidity (DEX)	0xf55B994FDD7019d8E99c632c76A6e0AdE765988A
Project Treasury	0xD539a54f54e9B174F831D9Da6b48ac15441fC581
DAO Treasury	0xD5e2DD65BA4984565b53EFdcec6A9D2F494b5FE2
Core Team	0xdEBACbF7f51C3865dc2034ED676D3d344954f9FE
Community & Growth	0x54D3beB9e0F473803cC7a972Db2C17f005a2D089
Founder (Tengo)	0xF48840486697AE3c15D38E30e45cECB9897CfA74
Charity Reserve (SmileDonate)	0xa22E471BF4e405c92bDD074792d8d36923e31055
Resources
Resource	Link
GitHub	github.com/CryptoTengo/PanjoCoin
Twitter (X)	@CryptoTengo
Discord	Invite Link
Medium	@cryptotengo
Charity Foundation	SmileDonate (ClownCare program at Iashvili Hospital)
PolygonScan	polygonscan.com/address/0x781C0d15347Cb0B94C42C65c7a67E70371205De5
20. 📖 Epilogue
The story of Panjo the Shar Pei does not end on the sidewalk outside the Iashvili Hospital. It continues every time someone buys, sells, or simply holds a PNJC token.

Because now this coin has not only a price. It has a face. A wrinkled, kind, funny face. And the name of a child on the third floor who smiled back.

*This Whitepaper v.1.0 fully complies with the PanjoCoin smart contract and on-chain distribution.*

All protection mechanisms described as "planned" are aspirational and will be confirmed via on-chain transactions when executed.

🐕 Panjo the Shar Pei | 🏥 Iashvili Hospital, 3rd floor | 🎭 ClownCare by SmileDonate
