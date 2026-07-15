PanjoCoin (PNJC) — Tokenomics Document
Version: 1.0
Date: July 9, 2026
Network: Polygon PoS
Total Supply: 1,000,000,000,000 PNJC (fixed)
________________________________________
1. Overview
PanjoCoin is a utility token built on Polygon PoS with a fixed supply model. This document details the token distribution, release schedule, deflationary mechanisms, and governance controls that ensure long term sustainability, transparency, and alignment of incentives among all stakeholders.
All smart contracts are non upgradeable, ownerless (for the base token), and will be audited by independent firms before activation. The tokenomics are designed to prevent inflation, reward long term holders, and fund both ecosystem development and charitable initiatives.
________________________________________
2. Fixed Supply and Distribution
2.1 Total Supply
The total supply is 1,000,000,000,000 PNJC (1 trillion). The mint() function is permanently disabled, and no additional tokens can ever be created.
2.2 Allocation Breakdown
Category	Share	Amount (PNJC)	Wallet Address	Lock / Control Mechanism
Liquidity Pool (Uniswap V2)	50%	500,000,000,000	0xf55B...988A	Locked via PNJCLiquidityLockerV2 for 12 months (exact dates TBA); no emergency withdrawal.
Treasury (Operational)	12%	120,000,000,000	0xD539...C581	Multisig 3/5, used for operational expenses, listings, and partnerships.
DAO Treasury	10%	100,000,000,000	0xD5e2...FE2	Controlled by DAO after launch (Q4 2026). Funds used for ecosystem grants, community initiatives, and governance proposals.
Team	10%	100,000,000,000	0xdEBA...9FE	Locked in VestingVault with 12 month linear vesting (cliff TBA).
Community	8%	80,000,000,000	0x54D3...D089	Airdrops, referral bonuses, marketing campaigns, and community rewards.
Founder	5%	50,000,000,000	0xF488...A74	Locked in VestingVault with 12 month linear vesting (cliff TBA).
Charity Reserve	5%	50,000,000,000	0xa22E...555	Public wallet for transparent charitable donations; all transactions on chain.
Verification: 500 + 120 + 100 + 100 + 80 + 50 + 50 = 1,000 billion PNJC (100%).
2.3 Control Mechanisms
•	Liquidity Lock: 50% of supply is locked in an immutable, ownerless contract (PNJCLiquidityLockerV2). No one can withdraw early; the lock duration is 12 months from deployment.
•	Vesting Contracts: Team and founder allocations are subject to linear vesting over 12 months to ensure long term commitment.
•	Multisig Wallets: Treasury wallets (Operational and DAO) are protected by multisig (3/5) until DAO takes over.
•	DAO Governance: After launch, key parameters (e.g., deflationary engine settings, treasury spending) will be subject to community votes.
________________________________________
3. Circulation Model
3.1 Initial Circulating Supply
At launch, only 1% of total supply (10,000,000,000 PNJC) will be in circulation. This includes the liquidity pool tokens and a small portion for initial community incentives.
3.2 Locked Supply and Release Schedule
The remaining 99% (990,000,000,000 PNJC) is locked and will be released gradually.
Release Formula:
Each year, 5% of the remaining locked balance enters circulation. This creates a smooth, predictable supply increase that minimizes price volatility and aligns with ecosystem growth.
3.3 Annual Circulation Table
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
Note: The release schedule is implemented via smart contract (VestingVault) and is fully transparent.
3.4 Benefits of the Model
•	Predictable supply: Investors and users can forecast token availability.
•	Reduced sell pressure: Gradual unlocks prevent sudden dumps.
•	Long term alignment: Team and ecosystem participants are incentivized to build value over years.
________________________________________
4. Deflationary Mechanism: GoldenPhoenix Protocol
To counteract inflation and provide price stability, the GoldenPhoenixProtocol will be deployed in Q3 2026. This contract automatically uses a portion of USDT revenue (from ecosystem services and fees) to perform buybacks and burns.
4.1 Key Parameters
•	insurancePercent: 3–10% of USDT revenue allocated to an insurance fund (protects against extreme volatility).
•	buybackPercent: 15–35% used for market buybacks.
•	burnPercent: 30–70% of buyback amount is burned permanently.
•	rewardPercent: Remaining portion can be distributed to stakers or liquidity providers.
Invariant: insurancePercent + buybackPercent = 30% of total revenue.
The exact ratios will be adjustable via DAO vote after launch.
4.2 Insurance Fund
The accumulated insurance can be deployed during market downturns to support the price, adding a safety net for holders.
4.3 Deflationary Impact
By regularly burning tokens, the total supply decreases over time, creating a deflationary pressure that benefits long term holders. All burn transactions are on chain and verifiable.
________________________________________
5. Governance and Treasury Management
5.1 DAO Governance
The DAO Governor contract (planned for Q4 2026) will allow PNJC holders to propose and vote on:
•	Adjustments to deflationary parameters.
•	Allocation of DAO Treasury funds.
•	Partnership and grant decisions.
•	Protocol upgrades (non contract modifications, as contracts are immutable).
Voting Rules:
•	Quorum: 4% of total supply.
•	Voting period: 7 days.
•	Proposal execution: Timelock (48 hours) to ensure transparency.
5.2 Multisig Wallets
Until the DAO is fully operational, key decisions are managed by a 3/5 multisig. The signers include:
1.	Founder (Tengo Kalandia)
2.	Technical advisor (to be appointed)
3.	Strategic advisor (to be appointed)
4.	Backup key (auditor)
5.	Backup key (community representative)
After DAO launch, multisig keys will be transferred to elected community members.
________________________________________
6. Transparency and On Chain Verification
•	Public Wallets: All distribution addresses are listed above and can be monitored on PolygonScan.
•	Verified Code: The token contract and all auxiliary contracts are source verified on PolygonScan and available on GitHub.
•	Audits: Independent audits by CertiK / Hacken are scheduled for each module before its deployment. Results will be published.
•	Real Time Monitoring: Community tools (Dune Analytics, etc.) will be provided to track token flows, locked amounts, and burn events.
________________________________________
7. Token Utility and Value Accrual
PNJC serves as the native utility token for the PanjoCoin ecosystem:
•	Access to ONE+ Gaming Platform: Use PNJC to purchase in game items, unlock premium features, and earn rewards.
•	Charitable Contributions: Holders can donate directly to the Charity Reserve, with full on chain transparency.
•	Governance: Influence ecosystem development via DAO proposals.
•	Deflationary Benefits: Holders benefit from buyback and burn mechanisms that reduce supply.
•	Staking (future): Plans for staking pools that reward holders with a share of ecosystem revenue.
________________________________________
8. Risk Factors
While the tokenomics are designed for sustainability, investors should consider:
•	Market Volatility: The price of PNJC is subject to crypto market fluctuations.
•	Execution Risk: Deployment of advanced modules (DAO, deflation, games) may be delayed.
•	Regulatory Uncertainty: Changes in global crypto regulations could affect token usage.
•	Liquidity Risks: The depth of the Uniswap pool may be insufficient for large orders.
For a comprehensive list, refer to the Risk Disclosure document.
________________________________________
9. Conclusion
PanjoCoin’s tokenomics combine a fixed supply, gradual release schedule, deflationary mechanisms, and community driven governance. The transparent allocation, immutable contracts, and planned audits build trust and align incentives among users, the team, and investors. By linking token value to real utility (gaming, charity, governance), PNJC aims to create a sustainable digital economy with a social impact.
________________________________________
Document Version: 1.0
Last Updated: July 9, 2026
Next Review: After DAO launch (Q4 2026)

