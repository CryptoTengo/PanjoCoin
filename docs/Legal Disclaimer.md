📜 Legal Disclaimer 

Version 1.1 — 2026
(Updated to reflect PanjoCoin (PNJC) specific mechanics)

⚠️ 1. Important Notice

This Legal Disclaimer applies to all interactions with blockchain-based digital assets, including tokens, smart contracts, decentralized applications (dApps), and related ecosystem components, with particular reference to the PanjoCoin (PNJC) project.

By accessing, using, holding, transferring, or otherwise interacting with PNJC or any associated platform, you acknowledge that you have read, understood, and agreed to this Disclaimer in full, including the specific risks and mechanisms described in Sections 5 and 16–20.

If you do not agree with these terms, you must immediately cease all interaction with the relevant digital asset or ecosystem.

🪙 2. Nature of Digital Assets

Cryptocurrencies and blockchain-based tokens are decentralized digital assets operating on distributed ledger technology.

They may include, but are not limited to:

Utility tokens

Governance tokens

Community tokens

Meme or cultural tokens

Experimental blockchain assets

Digital assets do not represent ownership in any company, equity, or legal claim unless explicitly defined by applicable law or contractual documentation.

❌ 3. No Financial Advice

Nothing contained in any documentation, communication, website, or interface related to digital assets constitutes:

Financial advice

Investment advice

Legal advice

Tax advice

Trading recommendations

Users should conduct their own independent research and consult qualified professionals where necessary.

📉 4. No Guarantees

No guarantees are made regarding:

Market value or price performance

Liquidity or trading availability

Exchange listings (centralized or decentralized)

Future utility or adoption

Project continuity or development outcomes

All digital asset markets are speculative and highly volatile.

⚠️ 5. Risk Disclosure

Interaction with blockchain-based assets involves significant risks, including but not limited to:

5.1 Market Risk
Extreme price volatility

Partial or total loss of funds

Lack of liquidity in secondary markets

5.2 Technical Risk
Smart contract vulnerabilities or bugs

Blockchain network congestion or failures

Wallet malfunctions or user errors

Irreversible transaction execution

5.3 Regulatory Risk
The legal status of digital assets varies by jurisdiction

Future regulations may restrict or prohibit access, trading, or custody

Compliance requirements may change without prior notice

5.4 Custodial Risk
Loss of private keys results in permanent loss of access to assets

Users are solely responsible for securing their wallets and credentials

⛓️ 6. Blockchain Characteristics
Blockchain transactions are:

Irreversible once confirmed

Publicly recorded on distributed ledgers

Independent of any central authority

No intermediary has the ability to reverse, cancel, or modify completed transactions.

🤝 7. Third-Party Services Disclaimer

Digital assets may interact with third-party services, including:

Wallet providers

Cryptocurrency exchanges

Decentralized applications

Analytics platforms

Blockchain explorers

These services operate independently.

The issuer or developers of any digital asset are not responsible for:

Service interruptions or downtime

Security breaches or data loss

Listing decisions or delistings

Changes in terms of service or policies

🌍 8. Regulatory & Jurisdictional Responsibility

Cryptocurrency regulations vary across jurisdictions and may change over time.

Users are solely responsible for ensuring compliance with applicable local laws, including but not limited to:

Restrictions on ownership or trading

Tax reporting obligations

Licensing or registration requirements

Sanctions and embargo compliance

Access to digital assets may be restricted or prohibited in certain jurisdictions.

📵 9. Responsibility for Legal Compliance

Users must ensure that their interaction with digital assets does not violate the laws of their jurisdiction.

Digital assets must not be used where prohibited by law or regulatory authority.

🧠 10. User Responsibility

Each user is solely responsible for:

Understanding blockchain technology and associated risks

Securing private keys, wallets, and access credentials

Assessing the suitability of digital assets for their circumstances

Ensuring compliance with applicable laws and regulations

🧾 11. Limitation of Liability

To the maximum extent permitted by applicable law:

Developers, creators, contributors, and affiliated parties shall not be liable for any direct, indirect, incidental, consequential, or special damages arising from:

Use or inability to use digital assets

Loss of funds, data, or access

Market volatility or fluctuations

Technical failures or smart contract behavior

🔐 12. No Ongoing Obligations

Unless explicitly stated in legally binding agreements:

There is no obligation to maintain or develop any protocol

There is no obligation to provide updates or support

There is no obligation to maintain liquidity or market presence

📑 13. Documentation Hierarchy (If Applicable) 

Where multiple documents exist, the order of precedence may be:

On-chain smart contract logic

Executed blockchain transactions

Formal technical specifications (if any)

Public documentation (if any)

On-chain data is generally considered the most authoritative source of system behavior.

🔄 14. Amendments

This Disclaimer may be modified or updated at any time without prior notice.

Continued interaction with digital assets after updates constitutes acceptance of the revised version.

✅ 15. Acceptance

By interacting with any blockchain-based digital asset, you confirm that:

You understand the associated risks

You act voluntarily and at your own risk

You are legally permitted to do so in your jurisdiction

You waive claims against developers and affiliates to the maximum extent permitted by law

🔥 16. Specific Risks and Features of PanjoCoin (PNJC)

The following sections describe the unique characteristics, mechanisms, and associated risks of the PanjoCoin (PNJC) project, which operates on the Polygon PoS blockchain.
Official contract address: 0x781C0d15347Cb0B94C42C65c7a67E70371205De5
Always verify this address before any transaction.

16.1. Deflationary Mechanism – Golden Phoenix Protocol

PNJC incorporates an automated deflationary protocol called Golden Phoenix, which performs the following actions periodically:

Receives USDT from external sources (partner fees, NFT marketplace revenues, voluntary contributions).

Reserves a portion (insurancePercent, default 5%) into an Insurance Fund to protect against sharp price drops.

Allocates a share (buybackPercent, default 25%) to buy back PNJC from the market.

Converts the buyback amount to PNJC via DEX (QuickSwap V2) and burns a portion (burnPercent, default 50%) of the purchased tokens permanently.

Distributes the remaining 50% to community rewards (Proof of Kindness, Social Mining, Challenges).

Risks associated with this mechanism:

Unpredictability of burn volume: Depends on external USDT inflows; if inflows cease, deflationary pressure may diminish.

Technical failures: The protocol relies on external routers and oracles; failures may stop the process until DAO intervention.

Parameter manipulation: Parameters (burnPercent, insurancePercent, buybackPercent, priceFloor, etc.) are adjustable by DAO vote. A malicious vote could alter them to the detriment of holders.

buybackPercent specific risks:

If set too low, the deflationary effect is weakened.

If set too high, may cause significant slippage and reduce buyback efficiency.

Accumulation of undistributed funds on the contract balance may delay burning and create centralisation risks.

Insurance Fund limitations: The fund is not a guarantee against total loss; it only mitigates short-term volatility and its use requires multisig approval (4 of 5 signatures), potentially causing delays.

16.2. DAO (Decentralized Autonomous Organization) Governance

PNJC is governed by a DAO where holders vote on key parameters and treasury allocations. Voting power is proportional to token holdings (1 PNJC = 1 vote).

Risks:

Vote concentration: Large holders (whales) may collude to pass self-serving proposals.

Low quorum: Decisions require minimum turnout (5% for standard proposals, 10% for charter amendments, 3% for emergency). Low participation may stall important updates.

Malicious proposals: Any holder can submit proposals; there is a risk of proposals aiming to drain the treasury or manipulate parameters. A multisig veto (3 of 5) exists but is used only in emergencies.

Conflict of interest: Multisig key holders (5 individuals, 3 required for execution) may act against community interests if compromised or acting in bad faith.

16.3. Charity Component
PNJC allocates 5% of total supply (50B PNJC) to a charity reserve, managed by the DAO. Donations are made to verified organisations (e.g., ClownCare) with full on-chain transparency.

Risks:

Misuse of funds: Although transactions are public, the project cannot guarantee that recipient organisations use funds strictly for their intended charitable purposes.

No guarantee of outcomes: Donations do not ensure social change; the project is not responsible for the effectiveness of charitable programmes.

Voluntariness: Contributions are voluntary and do not provide financial returns (only Impact Score points, which have no monetary value).

16.4. Proof of Kindness, Social Mining, Impact Score
These utility mechanics reward users for good deeds, content creation, and participation.

Risks:

Subjective verification: Proof of Kindness relies on community/DAO verification, which may be biased or subject to abuse (fake evidence).

Content platform dependence: Social Mining rewards depend on third‑party social media platforms, which may block accounts or delete content, resulting in loss of rewards.

Impact Score non‑monetary value: Impact Score is for intra‑ecosystem ranking only; it has no cash value and may be recalculated or revoked in case of fraud.

16.5. Absence of External Audit
As of the date of this Disclaimer (July 2026), PanjoCoin has not undergone an external independent smart contract audit. While the code has been internally reviewed and tested, the lack of a professional audit increases the risk of undiscovered vulnerabilities or critical bugs. An external audit (by CertiK, Hacken, or similar) is planned and will be funded from the Project Treasury (12% allocation), but until completed, users assume heightened technical risk.

16.6. Additional Project‑Specific Warnings
Polygon network dependency: PNJC operates exclusively on Polygon PoS. Risks include network congestion, forks, or validator attacks.

LP tokens locked: The project's liquidity provider (LP) tokens are locked for 12 months via PNJCLiquidityLocker to reduce rug‑pull risk, but external LPs may withdraw at any time.

Vesting schedules: Team and founder tokens are subject to a 6‑month cliff and 12‑month linear vesting; unlocked tokens may be sold gradually, potentially affecting price.

Fraud and clones: Only the official contract address is valid. Scammers may create fake tokens or phishing sites. Always verify the address and URL.

📌 17. Final Acknowledgement for PanjoCoin Users
By using PNJC or any associated platform, you additionally confirm that:

You have read and understood the specific risks described in Section 16, including the deflationary mechanism (Golden Phoenix), DAO governance, charity component, and the absence of external audit.

You accept that the parameters buybackPercent, burnPercent, insurancePercent, and others are subject to DAO votes and may change without your individual consent.

You understand that the Insurance Fund does not guarantee price stability and may be depleted.

You acknowledge that charitable donations are voluntary and carry risks of misuse, and you release the project from any liability related to such use.

You accept that the project is under development, has not been externally audited, and you assume all associated technical risks.

© 2026 PanjoCoin (PNJC) Legal Framework
All rights reserved.


