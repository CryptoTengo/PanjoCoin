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
🔒 GLOBAL CONSISTENCY RULE (HIGHEST PRIORITY)

This document follows strict hierarchy:

Smart Contract (absolute truth)
Tokenomics Model (mathematical emission logic)
Whitepaper (operational narrative)

In case of discrepancy:

Smart Contract > Tokenomics Model > Whitepaper Narrative

📖 1. Prologue: The Legend of Panjo

In Tbilisi, near the M. Iashvili Central Children's Hospital, a Shar Pei named Panjo became a symbol of joy for children undergoing treatment.

On the third floor of the hospital — where oncology and neurosurgery wards are located — laughter became a form of therapy.

This story became the emotional foundation of PanjoCoin (PNJC), a digital asset designed to support SmileDonate’s ClownCare program.

M. Iashvili Central Children's Hospital
SmileDonate

📑 2. Executive Summary

PanjoCoin (PNJC) is a fixed-supply ERC-20 token deployed on Polygon, combining:

Meme culture
Transparent tokenomics
Charity-driven utility
Fully decentralized architecture
Key Parameters
Parameter	Value
Ticker	PNJC
Network	Polygon (PoS)
Total Supply	1,000,000,000,000 PNJC
Circulating Supply at T+0	~10% target (~100B PNJC)
Operational Range	up to ~13% (~130B PNJC)
Release Model	10% of remaining supply every 6 months
Tax	0%
Ownership	None (fully decentralized)
⚙️ 3. Technical Specifications
3.1 Contract Properties
Feature	Status
ERC-20 Standard	✅
ERC-20 Burnable	✅
EIP-2612 Permit	✅
Mint Function	❌ Not present
Owner / Admin	❌ Not present
Proxy Upgradeability	❌ Not present
3.2 Supply Constraint
_MAX_TOTAL_SUPPLY = 1_000_000_000_000 * 10**18;
Supply is hard-capped
No inflation possible
No future minting mechanism exists
📊 4. Tokenomics & Distribution (On-Chain Reality)
4.1 Structural Model

All PNJC tokens were minted at deployment and distributed via on-chain transfers into 7 public wallets.

There is:

❌ No vesting inside contract
❌ No locking logic inside contract
❌ No minting capability
4.2 Final Distribution
#	Allocation	%	Amount	Wallet
1	Liquidity	50%	500B	0xf55B...988A
2	Project Treasury	12%	120B	0xD539...C581
3	DAO Treasury	10%	100B	0xD5e2...5FE2
4	Core Team	10%	100B	0xdEBA...f9FE
5	Community	8%	80B	0x54D3...D089
6	Founder	5%	50B	0xF488...fA74
7	Charity	5%	50B	0xa22E...1055
⚠️ Important Clarification
Distribution is off-contract
Executed via on-chain transfers
Deployer wallet holds 0 PNJC
🔄 5. Staged Market Release Mechanism
5.1 Core Principle

At listing (T+0):

Target circulating supply: ~10% (~100B PNJC)
Operational reality: up to ~13% (~130B PNJC)

This difference is not inflation or emission — it is due to pre-distribution operational transfers before listing.

The staged release applies only to the remaining non-circulating supply at T+0.

5.2 Mathematical Model

Let:

S_total = 1,000,000,000,000 PNJC
R_0 = circulating supply at T+0 (~100B–130B)
B_0 = S_total − R_0

Then:

R_n = 0.10 × B_(n−1)
B_n = B_(n−1) − R_n

Each release = 10% of remaining supply, not total supply.

5.3 Release Schedule (Model)
Period	Release	Total Circulation	Remaining
T+0	~100–130B	~10–13%	~900–870B
T+6m	~87–90B	~190–220B	~810–780B
T+12m	~78–81B	~270–300B	~730–700B
T+18m	~70–73B	~340–370B	~660–630B
T+24m	~63–66B	~400–430B	~600–570B
T+30m	~57–59B	~460–490B	~540–510B
T+36m	~51–53B	~520–550B	~480–450B
5.4 Key Clarifications
10% = target design value
~13% = operational execution range
No minting occurs
Total supply is fixed permanently
Only remaining supply is subject to release
🔒 6. Investor Protection Mechanisms
6.1 Liquidity Model (Planned)
500B allocation to liquidity wallet
Initial LP uses ~50B PNJC
Remaining supports market depth

Lock mechanism: external (Unicrypt / PinkSale)

6.2 Vesting (Planned)
Team + Founder: 150B total (15%)
0 initial unlock (planned structure)
External vesting contract required
6.3 Multisig Treasury (Planned)
Gnosis Safe 3/5
Applied to treasury wallets only
No single-key control
6.4 Important Note

These protections:

❌ are not inside smart contract
⏳ are external systems (planned)
✔ will be verified on-chain when deployed
🔥 7. Deflationary Model
ERC20Burnable enables voluntary burns
No mint function exists
No rebase mechanism
No tax system exists

Deflation sources:

user burns
lost private keys
💧 8. Liquidity Model
DEX: Uniswap V3
Pair: PNJC / USDT or PNJC / POL
Fee tier: 0.05%–0.30%
Initial liquidity: ~50B PNJC
Source: Liquidity wallet (500B allocation)
🏦 9. Treasury Model

Project Treasury (120B):

Marketing (40%)
Development (30%)
Legal (10%)
Liquidity support (10%)
Reserve (10%)
🎭 10. Charity Mission
ClownCare Program

Operates in:

M. Iashvili Central Children's Hospital

Focus areas:

oncology-hematology ward
neurosurgery ward

Funds flow:

SmileDonate

Important:

No smart contract donation automation
Transfers are manual but publicly verifiable
⚠️ 11. Risk Statement
Crypto assets are highly volatile
No guaranteed returns
100% loss possible
Token is not a security
🧠 12. Summary

PNJC is defined by:

✔ Fixed supply (1T)
✔ No minting
✔ No owner
✔ 0% tax
✔ Transparent distribution
✔ Staged emission model
✔ Operational 10–13% initial circulation range
✔ Charity-driven utility

🔗 13. Final Rule of Consistency

If inconsistency appears:

Smart Contract > Tokenomics Model > Whitepaper Narrative

🐕 End Note

PanjoCoin is not just a token — it is a structured emotional and economic system designed to convert attention into measurable social impact.
