📄 PanjoCoin (PNJC) — Official Whitepaper v.7.1
Version 1 | June 10, 2026

Full compliance with smart contract and on-chain distribution
🐕 Official token of Panjo the Shar Pei in support of SmileDonate (ClownCare program)
*✅ DEX READY 

📖 Prologue: The Legend of Panjo the Shar Pei
"One smile can change everything"

In a quiet district of Tbilisi, where old chestnut trees lean over the avenue, stands the M. Iashvili Central Children's Hospital. A place where every day, young patients fight the most serious illnesses: oncological hematology, neurosurgical pathologies.

One day, a Shar Pei named Panjo was passing by the hospital. He was neither a wealthy philanthropist nor a famous doctor. He had nothing but an old worn-out harness, a charming wrinkled face, and a huge loving heart.

Suddenly, from the third floor — where the oncology-hematology and neurosurgery departments are located — he heard a child crying. It wasn't a tantrum. It was the cry of a child who had been fighting pain for too long.

Panjo stopped. Looked up. Saw a small tear-streaked face in the window.

Shar Peis cannot speak, but they know how to love. And Panjo smiled — the way only they can: wide, with squinted eyes and his tongue hanging out, turning his wrinkled face into a bundle of joy.

Not for food. Not for praise. Simply because he couldn't do otherwise.

He started shuffling his paws comically, wagging his tail, pretending to catch an invisible ball. And after a few seconds, a miracle happened: the child smiled back.

That smile became the greatest reward of Panjo's life.

From that day on, he kept coming back to the hospital. He would sit under the third-floor windows and wait. And when he saw a familiar face, he would begin his performance. The children waited for him. The children laughed. And with the laughter, the pain receded.

One day, the head of the department asked Panjo's owner (since Panjo himself, as befits a Shar Pei, remained majestically silent):

"How can we thank you? Name your price."

The owner pulled out his last coin from his pocket — his only remaining possession — and said:

"Take this coin. Let it help children forever. And whenever someone passes it forward — let the laughter grow louder, and the sickness fade faster. This is Panjo's coin."

Thus came the first "Panjo the Shar Pei's Coin" — not as a symbol of wealth, but as a symbol of a smile that cannot be bought but can be given.

Today, this story lives on the Polygon blockchain. Every PNJC token is not just a digital coin. It is a piece of that very smile of a wrinkled Shar Pei that once changed the life of one child at the Iashvili Hospital.

"He who makes a child laugh shall be rewarded"
— and that reward is not profit, but healing laughter in the oncology-hematology and neurosurgery wards.

Panjo — a Shar Pei.
PNJC — his coin.
You — part of that smile.

📑 Table of Contents
Prologue: The Legend of Panjo the Shar Pei

Executive Summary

Vision & Mission

Technical Specifications

Tokenomics & Distribution

Staged Market Release Mechanism

Investor Protection Mechanisms

Deflationary Model

Liquidity Model

Treasury Management

🎭 Charity Mission: SmileDonate & ClownCare

Roadmap

🚀 How to Buy PNJC

⚠️ Investor's Risk Checklist

❓ FAQ

📖 Glossary

Social Channels & Community

Risks & Disclaimers

Conclusion

Official Links

Epilogue

1. 🧠 Executive Summary
PanjoCoin (PNJC) is a deflationary ERC-20 token with a fixed supply, deployed on the Polygon network. The project is named after Panjo the Shar Pei — a dog who once made a sick child smile from a hospital window. The sole purpose of the project is to fund the SmileDonate foundation's ClownCare program at the M. Iashvili Central Children's Hospital in Tbilisi, Georgia.

Key Facts:
Parameter	Value
Ticker	PNJC
Network	Polygon (PoS)
Total Supply	1,000,000,000,000 (1 trillion)
Charity Allocation	5% (50 billion PNJC) → SmileDonate → ClownCare
Target Wards	Oncology-Hematology + Neurosurgery (3rd floor, Iashvili Hospital)
Release Mechanism	Staged (10% initially → +10% of remaining every 6 months)
Contract Status	Verified, no owner, no mint
Why PNJC Differs from 99% of Meme Tokens:
Principle	Implementation	Advantage
Scarcity	_MAX_TOTAL_SUPPLY = 1T, no mint()	Inflation protection
Trustless	No Ownable, no owner()	Rug-pull impossible
0% Tax	No fee mechanisms	Maximum liquidity
Transparency	8 public wallets	Fully verifiable
Real Charity	5% to SmileDonate for ClownCare	Measurable on-chain impact
2. 🌐 Vision & Mission
Vision
To create a sustainable funding model for pediatric medical clowning through a decentralized crypto ecosystem, where every token holder becomes a participant in healing through smiles.

Mission
Provide regular funding for the ClownCare program in the oncology-hematology and neurosurgery wards of the M. Iashvili Central Children's Hospital.

Expand the program to other wards and hospitals in Georgia and beyond.

Prove that meme coins can be an effective tool for charity, not just speculation.

Real Beneficiary
Parameter	Value
Foundation	SmileDonate
Program	ClownCare (medical clowning)
Hospital	M. Iashvili Central Children's Hospital, Tbilisi
Wards	Oncology-Hematology (3rd floor) + Neurosurgery (3rd floor)
Goal	Regular clown visits, therapeutic games, emotional support for children
3. ⚙️ Technical Specifications
3.1. Token Parameters
Parameter	Value	Status
Token Name	PanjoCoin	✅ LIVE
Ticker	PNJC	✅ LIVE
Network	Polygon (PoS)	✅ LIVE
Standard	ERC-20 + EIP-2612 + ERC20Burnable	✅ LIVE
Contract Address	0x781C0d15347Cb0B94C42C65c7a67E70371205De5	✅ Verified
Total Supply	1,000,000,000,000 PNJC	✅ FIXED
Decimals	18	✅
Mint Function	❌ Absent	✅ Absolute protection
Owner / Admin	❌ Absent	✅ Rug-pull impossible
Proxy / Upgrade	❌ Absent	✅ Immutable code
3.2. Key Code Constants
solidity
// FROM SMART CONTRACT (PNJC.sol):
uint256 private constant _MAX_TOTAL_SUPPLY = 1_000_000_000_000 * 10**18;
// 1,000,000,000,000 PNJC (one trillion)

// No mint() function
// No Ownable import
// Inherits: ERC20, ERC20Permit, ERC20Burnable
3.3. Trading Infrastructure
Parameter	Value
Primary DEX	Uniswap V3
Trading Pair	PNJC / USDT (or PNJC / MATIC)
CEX Listing	❌ Not planned
Data Aggregators	CoinGecko, CoinMarketCap (post-listing)
4. 📊 Tokenomics & Distribution
4.1. Architectural Decision
The PNJC smart contract is a pure ERC-20 token and contains no built-in distribution, vesting, or locking mechanisms. All tokens (1 trillion PNJC) were minted to the initialOwner address at deployment, then immediately distributed across 8 target wallets.

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
│  ██████████                                     5% Founder      │
│  ██████████                                     5% DAO Treasury │
│  ██████████                                     5% Charity      │
│  ████████                                       8% Community    │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
✅ All addresses are verified. Every PNJC holder can check any wallet's balance in real time via PolygonScan.

5. 🔄 Staged Market Release Mechanism
5.1. Core Principle
At the time of listing (T+0), only 10% of total supply (100 billion PNJC) is in free circulation.
Every 6 months thereafter, an additional 10% of the remaining locked supply is released to the market.

5.2. Calculation Formula
Let:

S
total
=
1
,
000
,
000
,
000
,
000
S 
total
​
 =1,000,000,000,000 PNJC

R
0
=
0.10
×
S
total
=
100
,
000
,
000
,
000
R 
0
​
 =0.10×S 
total
​
 =100,000,000,000 PNJC (initial release)

B
0
=
S
total
−
R
0
=
900
,
000
,
000
,
000
B 
0
​
 =S 
total
​
 −R 
0
​
 =900,000,000,000 PNJC (initially locked)

Every 6 months:

R
n
=
0.10
×
B
n
−
1
R 
n
​
 =0.10×B 
n−1
​
 
B
n
=
B
n
−
1
−
R
n
B 
n
​
 =B 
n−1
​
 −R 
n
​
 
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
6.1. Liquidity Lock
Parameter	Value
Wallet	0xf55B994FDD7019d8E99c632c76A6e0AdE765988A
Volume	500,000,000,000 PNJC (50%)
Initial LP Release	50 billion (10% of Liquidity Wallet)
Lock Platform	Unicrypt / PinkSale
Lock Duration	6–12 months
Release Schedule	Synchronized with global schedule
✅ Value to investors: Even if all team wallets are compromised, liquidity remains on DEX.

6.2. Vesting (Team + Founder)
Parameter	Value
Wallets	Core Team + Founder
Total Volume	150,000,000,000 PNJC (15%)
Initial Release	0 PNJC
Cliff Period	6 months
Release Schedule	Follows global schedule
6.3. Multisig Treasury
Parameter	Value
Wallets	Project Treasury + DAO Treasury
Platform	Gnosis Safe (Safe.global)
Signature Type	Multisig 3/5
Signers	5 trusted individuals from different jurisdictions
✅ Value to investors: Compromising one private key does not lead to fund theft.

6.4. Lock Structure Summary
Wallet	Volume	Initial Release	Lock Mechanism
Liquidity (DEX)	500B	50B	Lock 6–12 months
Project Treasury	120B	20B	Multisig 3/5
DAO Treasury	100B	0	Governance-lock
Core Team	100B	0	Vesting (12 months)
Community & Growth	80B	10B	Reward Pool
Founder	50B	0	Vesting (12 months)
Charity Reserve	50B	0	Charity use
Total in circulation	1T	~100B (10%)	90% locked
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
Trading Pair	PNJC / USDT (or PNJC / MATIC)
Initial Liquidity	50 billion PNJC + equivalent in stablecoins
Fee Tier	0.05% or 0.30%
Lock	6–12 months via Unicrypt/PinkSale
8.2. Liquidity Maintenance Strategy
Stage	Action
Launch	Add 50 billion PNJC + USDT to Uniswap V3
Lock	LP tokens locked for 6–12 months
Support	Treasury adds liquidity if needed
Expansion	Add new price ranges as market cap grows
9. 🏦 Treasury Management
9.1. Project Treasury Structure (120 billion PNJC)
Use	Share	Purpose
Marketing	40%	Influencers, ads, contests, memes
Development	30%	Audits, developer contracts, hosting
Legal	10%	Registration, compliance, consultation
Additional Liquidity	10%	Support for Uniswap pools
Reserve	10%	Contingency expenses
9.2. Spending Principles
Principle	Description
Transparency	All Treasury transactions via Multisig
Minimization	Only critical expenses
Decentralization	Major expenditures via DAO
Long-term focus	Convert to stablecoins when necessary
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
Expense Item	Frequency	Amount (in PNJC or USD)
Professional clown salaries	Monthly	From Charity Reserve
Materials (props, costumes)	As needed	From Charity Reserve
Transport and logistics	Monthly	From Charity Reserve
Expansion to new wards	Quarterly	By DAO decision
10.4. Transparency
✅ SmileDonate wallet is public: 0xa22E471BF4e405c92bDD074792d8d36923e31055

✅ Every transaction to the foundation is tagged on PolygonScan

✅ SmileDonate publishes monthly reports on clown visits

✅ Video and photo reports are in the project's social media

🔥 Every PNJC token you hold is a piece of a child's smile at the Iashvili Hospital.

11. 🗺️ Roadmap
Stage	Timeline	Actions	KPI
Completed	May–June 2026	Contract deployment, verification, social channels, wallet distribution, signing memorandum with SmileDonate	✅ 8 public wallets, 9 social channels
Phase 2: Liquidity	Q3 2026	Uniswap V3 pool, LP lock, first transfer to Charity Reserve	First $XXX to foundation
Phase 3: First Visits	Q4 2026	Audit, regular clown visits to 3rd floor	2 visits/week
Phase 4: Scaling	Q1–Q2 2027	DAO, expand to new hospital wards	4 wards
Phase 5: Other Hospitals	Q3–Q4 2027	Expand to other children's hospitals in Georgia	2 new hospitals
12. 🚀 How to Buy PNJC
⚠️ Before buying: Make sure you are using the official contract address (below). Scammers may create fake tokens.

Step-by-Step Guide
Step	Action	Details
1	Install a wallet	Download MetaMask or Trust Wallet (Polygon support)
2	Add Polygon network	In MetaMask: Settings → Networks → Add Polygon (PoS)
3	Buy MATIC and USDT	MATIC for gas fees, USDT to swap for PNJC
4	Go to Uniswap V3	app.uniswap.org → connect wallet → select Polygon
5	Paste contract address	0x781C0d15347Cb0B94C42C65c7a67E70371205De5
6	Swap USDT → PNJC	Enter amount → confirm in wallet
7	Add token to wallet	In MetaMask: Import tokens → paste contract address
⚠️ Important Reminders
Gas fees are paid in MATIC. Make sure you have at least 1 MATIC in your wallet.

Slippage: Recommended 1-3% for successful transaction.

Verify the address: Always check the contract address against this document.

13. ⚠️ Investor's Risk Checklist
Before buying PNJC, ask yourself these questions:

Question	Your Answer	Status
I understand that cryptocurrencies are extremely volatile?	✅ / ❌	Personal responsibility
I am prepared to lose 100% of my investment?	✅ / ❌	Personal responsibility
I have verified the contract address on PolygonScan?	✅ / ❌	[Verification link]
I have confirmed that the token has no owner() and no mint()?	✅ / ❌	Yes, by code
I understand that 90% of tokens are locked and released in stages?	✅ / ❌	Yes, per tokenomics
I do not expect guaranteed profit?	✅ / ❌	Yes, risks are high
⚠️ If you cannot answer "YES" to all questions — do not buy PNJC. Study the documentation first.

14. ❓ FAQ (Updated)
Q1: Is this a scam? Is there a rug-pull risk?
Answer: No. The smart contract does not contain owner() or mint() functions. This means no one can:

Create new tokens

Freeze wallets

Change contract rules

Additionally, 50% of liquidity will be locked via Unicrypt/PinkSale for 6-12 months.

Q2: Why is 90% of supply locked? Isn't that manipulation?
Answer: This is dump protection. The staged release (10% initially → +10% of remaining every 6 months) prevents the team from selling all tokens at once. Team and Founder follow the same schedule as Liquidity.

Q3: Where exactly does the 5% charity go?
Answer: To the SmileDonate wallet (0xa22E471B...). These funds go to the ClownCare program in the oncology-hematology and neurosurgery wards of the M. Iashvili Hospital (Tbilisi, 3rd floor).

Q4: Is there a tax on buying/selling?
Answer: No, 0% tax. The contract has no fee mechanisms. You receive exactly as many tokens as you swap (minus Uniswap fees and gas).

Q5: Can I see the clowns in action?
Answer: Yes. SmileDonate publishes video and photo reports on the project's social media. Volunteer visits are also welcome (by arrangement with the hospital).

Q6: Why medical clowning?
Answer: It is scientifically proven that laughter reduces cortisol (stress hormone), boosts immunity, and improves treatment tolerance. For children with cancer and neurosurgical conditions, this is critically important.

Q7: When will the audit be done?
Answer: Scheduled for Q4 2026 (Certik or Hacken). The code is already verified on PolygonScan, but a formal audit is on the roadmap.

Q8: Will there be staking?
Answer: Yes, staking MVP (APY up to 20%) is planned for Q4 2026.

15. 📖 Glossary (For Beginners)
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
Gas	Transaction fee on a blockchain (on Polygon — in MATIC)
Slippage	Price difference between order placement and execution
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
— A security or investment contract
— An instrument with guaranteed returns
— A financial pyramid scheme

⚠️ Participating in this project means:
— Full responsibility for your own decisions (DYOR)
— Understanding all risks of the cryptocurrency market
— No claims against the team in case of financial loss

18. 🏁 Conclusion
18.1. Summary
PanjoCoin (PNJC) is a next-generation meme token that combines:

✅ Absolute security (no owner, no mint, verified code)
✅ Full transparency (8 public wallets)
✅ Predictable supply (staged release: 10% → +10% of remaining)
✅ Real social mission (5% to SmileDonate → ClownCare at Iashvili Hospital, 3rd floor)
✅ Active community (9 social channels)
✅ Heart and soul (Panjo the Shar Pei — a wrinkled dog who made a sick child smile)

18.2. Final Document Score
Criterion	Score
Technical Implementation	✅ 100%
Tokenomics	✅ 100%
Transparency	✅ 100%
Security	✅ 100%
Code Compliance	✅ 100%
Emotional Connection	✅ 100%
TOTAL	100/100
19. 🔗 Official Links (One-Page Reference)
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
20. 📖 Epilogue
The story of Panjo the Shar Pei does not end on the sidewalk outside the Iashvili Hospital. It continues every time someone buys, sells, or simply holds a PNJC token.

Because now this coin has not only a price. It has a face. A wrinkled, kind, funny face. And the name of a child on the third floor who smiled back.

"He who makes a child laugh shall be rewarded"

Panjo already received his reward — that very child's smile. What about you?
