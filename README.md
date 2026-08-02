PanjoCoin (PNJC) is a utility token with a fixed supply, an ownerless, non‑upgradeable smart contract, and a 0% transfer tax, deployed on the Polygon PoS network. The project is inspired by the true story of a Shar Pei named Panjo, who brought comfort to children at the Iashvili Central Children's Clinical Hospital in Tbilisi. The ecosystem combines a utility token, a planned gaming platform (ONE+), and a transparent, on‑chain charitable initiative (ClownCare Bridge).

PNJC is not a deflationary token. There is no burn tax, no transaction fee, and no staking module live today. If you see PNJC described elsewhere as a "deflationary meme token with burn/tax/staking features," that description is outdated and incorrect — see Key Parameters below for the actual, contract-verified specification.

🔗 Token Contract: 0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF 🌐 Website: cryptotengo.com 🐦 X (Twitter): @CryptoTengo 💬 Telegram: t.me/CryptoTengo

📌 Table of Contents
Key Parameters
Current Project Status
Tokenomics
Circulation Model
Security & Transparency
Documentation
Installation & Usage
Audits
Governance
Roadmap
License
Contacts
🚀 Key Parameters
Parameter	Value
Name	PanjoCoin
Ticker	PNJC
Network	Polygon PoS
Standard	ERC‑20 + ERC20Burnable + ERC20Permit (EIP‑2612)
Total Supply	1,000,000,000,000 PNJC (fixed)
Decimals	18
Supply Model	Fixed — mint() function does not exist in the contract
Admin Keys	None — token contract is ownerless (owner = address(0))
Upgradeability	None — immutable contract
Transfer Tax	0% on all transactions
Blacklists / Freezing	None
Burn / Deflation Mechanism	None (holders may voluntarily burn via burn(); there is no automatic or tax‑based burn)
Staking	Not implemented (conceptual / future consideration only, no timeline)
Target DEX	Uniswap V2 (listing pending — see status below)
Compiler	Solidity 0.8.36
Contract Address	0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF
Deployment Date	July 25, 2026
🧭 Current Project Status

This section exists so that no one has to infer contract state from marketing language. It is updated whenever a module changes status.

Item	Status
Token contract deployed & verified on PolygonScan	✅ Done (July 25, 2026)
Automated security audit (Slither, all 5 contracts)	✅ Done — 95/100, no critical/high findings, bilingual (GE/RU) reports
Independent professional audit (CertiK / Hacken)	⏳ Not yet started — original Q2 2026 target has passed and is being rescheduled; see Audits
Uniswap V2 liquidity pool created	⏳ Not yet — seed liquidity not yet deployed
PNJCLiquidityLockerV2 deployed / LP tokens locked	⏳ Not yet — contract code is written and ready but not deployed. The 50% liquidity allocation is not currently locked
PNJCVestingVault deployed	⏳ Not yet — code ready, not deployed
PNJCTreasuryVault deployed	⏳ Not yet — code ready, not deployed
PNJCMerkleAirdrop deployed	⏳ Not yet — code ready, not deployed
DAO Governor deployed	⏳ Not yet — code ready, not deployed
3/5 Operational Multisig	⏳ In progress — 1 of 5 signers currently appointed (founder); 4 signer seats are open. Until the full multisig is configured, treasury access does not yet meet the 3‑signature threshold

Why this matters: several earlier project materials described locking, vesting, and multisig protection as if already active. They are not yet active — the contracts are written and (for the token) verified, but the locking, vesting, treasury, airdrop, and governance modules have not been deployed to mainnet. Treat any allocation not covered by a deployed contract as currently unlocked and held by the deployer address, and verify wallet addresses directly on PolygonScan before relying on any percentage in this document.

📊 Tokenomics

Total fixed supply: 1,000,000,000,000 PNJC. No further tokens can ever be minted.

Category	Share	Amount (PNJC)	Control Mechanism	Deployment Status
Liquidity Pool (Uniswap V2)	50%	500,000,000,000	To be locked via PNJCLiquidityLockerV2 for 12 months after DEX listing, with no early withdrawal	🧩 Code ready, not deployed
Operational Treasury	12%	120,000,000,000	3/5 Multisig for operating expenses, listings, partnerships	⏳ Multisig setup in progress (1/5 signers appointed)
DAO Treasury	10%	100,000,000,000	To be governed by DAO after launch (targeted Q4 2026)	🧩 Code ready, not deployed
Team	10%	100,000,000,000	VestingVault: 6‑month cliff + 12‑month linear vesting	🧩 Code ready, not deployed
Community	8%	80,000,000,000	Airdrops, referral bonuses, marketing campaigns	🧩 Code ready, not deployed
Founder	5%	50,000,000,000	VestingVault: 12‑month cliff + 24‑month linear vesting	🧩 Code ready, not deployed
Charity Reserve	5%	50,000,000,000	Public wallet for transparent, on‑chain charitable donations	✅ Wallet public

Verification: 500 + 120 + 100 + 100 + 80 + 50 + 50 = 1,000 billion PNJC (100%).

All distribution wallet addresses are published in this repository and independently verifiable on PolygonScan.

📈 Circulation Model
At launch, 1% of total supply (10,000,000,000 PNJC) enters circulation.
Each year, 5% of the remaining locked balance is scheduled to enter circulation once the vesting/release contracts are deployed.
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

Full detail in Tokenomics.md. This is a target release schedule; actual release depends on deployment of the VestingVault and related contracts (see Current Project Status).

🔒 Security & Transparency
Ownerless token contract — does not inherit Ownable; no admin address can modify parameters.
No hidden functions — no mint(), no blacklist, no pause(), no freeze().
Zero tax — 0% on buy, sell, and transfer.
Code verified on PolygonScan and published on GitHub.
All wallets public — distribution can be independently verified.
No technical AML enforcement mechanism. Because the contract has no blacklist, freeze, or pause function, on‑chain AML enforcement is not technically possible at the token‑contract level. The project's AML Policy applies to project‑controlled off‑chain processes (e.g., treasury operations, exchange listing partners) — it does not and cannot restrict peer‑to‑peer token transfers.
Additional modules (Locker, VestingVault, TreasuryVault, MerkleAirdrop, DAO Governor) are code‑complete but not yet deployed to mainnet; each will be deployed only after its own independent audit (see Audits).
Deployed Contract	Status
PanjoCoin (token)	✅ Active — 0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF
PNJCLiquidityLockerV2	🧩 Code ready
PNJCMerkleAirdrop	🧩 Code ready
PNJCVestingVault	🧩 Code ready
PNJCTreasuryVault	🧩 Code ready
DAO Governor	🧩 Code ready
📚 Documentation

All project documentation is located in the /Docs folder:

Document	Description
Whitepaper	Full project description, architecture, utility, and roadmap
Tokenomics	Detailed distribution, circulation model, and control mechanisms
One‑Pager	Condensed project summary
Legal Disclaimer	Token status, disclaimers, jurisdictional notes
AML Policy	Anti‑money laundering / counter‑terrorism financing policy (off‑chain scope)
Privacy Policy	Privacy policy for website usage
Risk Disclosure	Full list of risks — market, technical, regulatory, and other
Restricted Countries	Countries with bans or restrictions on cryptocurrency (see note below)
Terms of Use	Terms of use for the website and services

Note on legal documents: the Legal Disclaimer, AML Policy, and Restricted Countries list have not yet been reviewed by qualified legal counsel and PanjoCoin does not currently operate through a registered legal entity. They are provided for transparency and informational purposes only and should not be relied upon as a legal opinion on regulatory status in any jurisdiction.

🛠 Installation & Usage
For Developers (Hardhat)
bash
# Clone the repository
git clone https://github.com/CryptoTengo/PanjoCoin.git
cd PanjoCoin

# Install dependencies
npm install

# Compile contracts
npx hardhat compile

# Run tests
npx hardhat test
For Users (once DEX liquidity is live)
Connect your wallet (e.g., MetaMask) to the Polygon PoS network.
Go to Uniswap V2 and select the Polygon network.
Paste the contract address: 0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF.
Ensure you have a small amount of POL for gas.
Swap for PNJC.

⚠️ A Uniswap V2 liquidity pool for PNJC is not live yet. Do not trust any third‑party link or "presale" claiming to sell PNJC before an official listing announcement on the channels listed under Contacts. Always verify the contract address from official sources.

🔬 Audits
Contract	Audit Type	Status
All 5 contracts (token, Locker, VestingVault, TreasuryVault, MerkleAirdrop)	Automated static analysis (Slither)	✅ Completed — 95/100, no critical or high‑severity findings. Bilingual (Georgian/Russian) reports available.
PanjoCoin (token)	Independent audit (CertiK / Hacken)	⏳ Not started — originally targeted for Q2 2026; timeline is being revised
PNJCLiquidityLockerV2	Independent audit (CertiK / Hacken)	⏳ Not started — required before deployment
PNJCVestingVault	Independent audit (CertiK / Hacken)	⏳ Not started — required before deployment
PNJCMerkleAirdrop	Independent audit (CertiK / Hacken)	⏳ Not started — required before deployment
PNJCTreasuryVault	Independent audit (CertiK / Hacken)	⏳ Not started — required before deployment
DAO Governor	Independent audit (CertiK / Hacken)	⏳ Not started — required before deployment

An automated audit is a useful first-pass sanity check, not a substitute for an independent professional audit. Treat the 95/100 Slither score as preliminary. Results of any future professional audit will be published on the website and in this repository, unedited, regardless of outcome.

🏛 Governance

Until the DAO Governor is deployed (targeted Q4 2026), key decisions are intended to be managed by a 3‑of‑5 multisig:

Seat	Holder
1	Tengo Kalandia (Founder)
2	Technical advisor — to be appointed
3	Strategic advisor — to be appointed
4	Backup key (auditor) — to be appointed
5	Backup key (community representative) — to be appointed

Currently only 1 of 5 seats is filled. The multisig cannot reach its 3‑signature threshold until at least two more signers are appointed. Until then, project decisions requiring treasury access are effectively bottlenecked on the founder. This will be updated here as soon as additional signers are appointed and the multisig is operational.

After DAO Governor launch: quorum 4% of total supply, 7‑day voting period, 48‑hour execution timelock, 1 PNJC = 1 vote.

🗺 Roadmap
Period	Milestone	Status
Month 1 — July 2026	Deploy & verify token contract; automated (Slither) audit; prepare Locker and Airdrop deployment	✅ Token deployed & verified · ✅ Slither audit done · ⏳ Locker/Airdrop not yet deployed
Month 2 — August 2026	Deploy VestingVault and TreasuryVault; activate multisig	⏳ Pending
Months 3–5 — Sep–Nov 2026	DAO Governor: audit, testnet, mainnet deployment, governance handover	⏳ Pending
Months 6–9 — Dec 2026–Mar 2027	Marketing, DEX aggregator integration, metrics collection	⏳ Pending
Months 10–13 — Apr–Jul 2027	ClownCare Bridge: design, development, testing, launch	⏳ Pending
Months 14–18 — Aug–Dec 2027	ONE+ Gaming Platform: development, MVP, beta, launch	⏳ Pending
Months 19–24 — Jan–Jun 2028	Scaling, new games, DAO improvements, cross‑chain research	⏳ Pending

Full 24‑month roadmap in the Whitepaper.

📄 License

This repository uses a dual‑licensing model:

Smart contracts (all .sol files) are distributed under the MIT License.
Documentation, media, branding, and website content are protected under a proprietary license — copying, distribution, or commercial use without written permission is prohibited.

See LICENSE.md for details.

🤝 Contributing

Suggestions for improving documentation, smart contracts, and the ecosystem are welcome. Before submitting a Pull Request:

Review the Whitepaper and Tokenomics.
Ensure your proposal aligns with the project's stated architecture (fixed supply, ownerless, zero tax).
For significant changes, open an Issue first for discussion.
📬 Contacts
Official Website: cryptotengo.com
Support Email: support@cryptotengo.com
Telegram: t.me/CryptoTengo
X (Twitter): @CryptoTengo
GitHub: github.com/CryptoTengo/PanjoCoin
PolygonScan: 0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF
⚠️ Important Notice

PNJC is a utility token, not a security, and is not registered or reviewed as such by any regulator. Acquiring PNJC is not an investment and does not guarantee income, profit, or capital appreciation. The price may fall to zero. Several protective mechanisms described in this repository (liquidity lock, vesting, multisig, DAO) are not yet active on mainnet — see Current Project Status before making any decision. Participate only with funds you are fully prepared to lose. Read the full Risk Disclosure before engaging with the project.

© 2026 PanjoCoin. All rights reserved. README Version: 2.0 (Corrected for full consistency with Whitepaper v2.2, Tokenomics v2.1, One‑Pager v1.1, and Legal Disclaimer v1.1 — August 2, 2026)
