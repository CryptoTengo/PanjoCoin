# Terms of Use

## PanjoCoin (PNJC)

**Version:** 1.1 (Updated)
**Effective Date:** July 25, 2026
**Project:** PanjoCoin (PNJC)
**Blockchain:** Polygon PoS
**Token Standard:** ERC-20 (ERC20Burnable + ERC20Permit)
**Smart Contract Address:** `0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF`

---

## 1. Introduction

These **Terms of Use** (hereinafter referred to as the "Terms") govern the access and use of the website [www.cryptotengo.com](https://www.cryptotengo.com) (hereinafter referred to as the "Website"), related services, as well as interaction with the PNJC token (hereinafter referred to as the "Token") and the PanjoCoin ecosystem (hereinafter referred to as the "Project").

Please read these Terms carefully before using the Website, Services, or acquiring the Token. By using the Website, Services, or acquiring the Token, you confirm that you fully understand and unconditionally accept all provisions of these Terms, and that you agree to the Legal Disclaimer, Whitepaper, and Tokenomics, which are integral parts of this document.

**If you do not agree with any provision, you must immediately cease using the Website and refrain from acquiring the Token.**

---

## 2. Definitions

In these Terms, the following terms shall have the meanings set forth below:

| Term | Definition |
| :--- | :--- |
| **"Project"** | PanjoCoin (PNJC), a decentralised ecosystem built on the Polygon PoS blockchain, including the PNJC token, the Website, smart contracts, and planned services (ONE+ gaming platform, ClownCare Bridge, DAO, etc.). |
| **"Token"** | The PNJC digital asset, conforming to the ERC-20 standard with ERC20Burnable and ERC20Permit (EIP-2612) extensions, issued on the Polygon PoS blockchain, as described in the Whitepaper and Tokenomics. |
| **"Website"** | The website located at [www.cryptotengo.com](https://www.cryptotengo.com), as well as all its subdomains and related pages. |
| **"Services"** | All functions, tools, interfaces, and content provided by the Project through the Website or otherwise, including but not limited to: Token information, documentation, DAO votes (after launch), gaming services (after launch), and charitable tools. |
| **"User"** | Any natural or legal person who uses the Website, Services, or acquires, holds, transfers, or otherwise interacts with the Token. |
| **"Smart Contract"** | Programmable code deployed on the Polygon PoS blockchain that implements the logic of the Token, liquidity lock, vesting, treasury, and other modules. |
| **"DEX"** | A decentralised exchange (e.g., Uniswap V2) where Token trading occurs. |
| **"DAO"** | A decentralised autonomous organisation that will be created in the future to govern the Project (code ready; deployment scheduled for Q4 2026). |
| **"Disclaimer"** | The PNJC Legal Disclaimer, which is an appendix to these Terms. |
| **"Whitepaper"** | The document "PanjoCoin (PNJC) — Whitepaper v2.2," describing the technical and economic aspects of the Project. |
| **"Tokenomics"** | The document "PanjoCoin (PNJC) — Tokenomics v2.1," describing the distribution and circulation model of the Token. |
| **"ERC20Permit"** | An extension of the ERC-20 standard (EIP-2612) that enables gasless approvals using signed messages. |

---

## 3. Acceptance of Terms

### 3.1.

These Terms constitute a legally binding agreement between you and the Project (PanjoCoin). By using the Website, Services, or acquiring the Token, you confirm that:

- You have reached the age of majority in your jurisdiction (generally 18 years);
- You have full legal capacity to enter into this agreement;
- You are acting on your own behalf and are not violating the laws of your country;
- You have reviewed the Whitepaper, Tokenomics, and the Disclaimer and agree with their content.

### 3.2.

If you do not meet the above requirements or do not agree with the Terms, you are not entitled to use the Website, Services, or acquire the Token.

---

## 4. Subject of the Agreement

### 4.1.

These Terms govern:

- Access to and use of the Website and all its sections;
- Use of the Services, including viewing Project information, interacting with wallets, participating in future DAO votes, and other activities;
- Acquisition, holding, transfer, burning, and other operations with the PNJC Token on and off DEX.

### 4.2.

The Project provides solely an informational and technological platform. The Project is **not** a financial intermediary, exchange, broker, or investment advisor.

### 4.3.

All relationships related to Token trading on DEX are conducted directly between users and smart contracts. The Project does not control and bears no responsibility for such transactions.

---

## 5. User Rights and Obligations

### 5.1. User Rights

The User has the right to:

- Freely use the Website and Services in accordance with their functional purpose;
- Acquire, hold, transfer, and burn the Token in accordance with its technical specifications;
- Use the `permit()` function for gasless approvals (EIP-2612);
- Participate in DAO votes after their launch (provided they hold Tokens);
- Receive information about the Project from official sources.

### 5.2. User Obligations

The User undertakes to:

- Independently comply with all applicable laws and regulations of their country, including tax and currency regulations;
- Not use the Website, Services, or Token for unlawful purposes, including money laundering, terrorist financing, fraud, theft, or other criminal acts;
- Not attempt to hack, disrupt, or impair the Website, smart contracts, or other Project components;
- Not make false or misleading statements about the Project, its team, or the Token;
- Not use automated tools (bots, scripts) for mass actions without the express permission of the Project;
- Not infringe upon the intellectual property rights of the Project and third parties;
- Ensure the security of their private keys, passwords, and other access credentials to cryptocurrency wallets. The Project is not responsible for loss of access to funds due to User error.

---

## 6. The PNJC Token

### 6.1.

The PNJC Token is a **utility digital asset** that provides access to current and future ecosystem services. The Token is **not a security** and does not confer rights to income, dividends, a share in the Project's assets, or management (except for future DAO votes, which do not confer property rights). A detailed analysis of the Token's status is provided in the Legal Disclaimer (Howey Test analysis).

### 6.2.

All information regarding the distribution, circulation, and technical characteristics of the Token is contained in the Whitepaper and Tokenomics. These Terms do not modify or supplement the aforementioned documents.

### 6.3.

The User acknowledges that:

- Acquisition of the Token is **voluntary** and at their own risk;
- The value of the Token is determined exclusively by market supply and demand;
- The Project does not guarantee the liquidity, price, or utility of the Token;
- The Token may be lost as a result of technical errors, loss of keys, actions of third parties, or other circumstances.

### 6.4.

All Token operations on DEX are conducted through smart contracts. The User independently verifies contract addresses and bears full responsibility for the correctness of transactions. Blockchain transactions are **irreversible**.

**Official Contract Address:** `0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF`

### 6.5.

Liquidity lock (50% of total supply) is executed through the immutable **PNJCLiquidityLockerV2** contract for **12 months**.

### 6.6.

The Token contract is **ownerless** (`owner = address(0)`) and **non-upgradeable**. No administrative functions exist to freeze, block, or modify balances.

---

## 7. Token Features

### 7.1. Fixed Supply

- Total Supply: **1,000,000,000,000 PNJC**
- No minting (`mint()` function absent)
- No inflation

### 7.2. Zero Tax

- **0%** transfer tax on all transactions (buy, sell, transfer)

### 7.3. Optional Burning

- User-driven burning via `burn()` and `burnFrom()` functions
- **No burn tax** — burning is entirely optional

### 7.4. Gasless Approvals (ERC20Permit / EIP-2612)

- Enables gasless approvals using signed messages
- Eliminates the need for a separate `approve()` transaction
- Reduces transaction costs and improves user experience
- Supports meta-transactions and relayer infrastructure

---

## 8. Prohibited Activities

The User is strictly prohibited from:

### 8.1.

Using the Website, Services, or Token in any jurisdiction where this is expressly prohibited by law. The list of countries with absolute prohibition is contained in the **Restricted Countries List** document.

**Absolute Prohibition Countries (🔴):**

| # | Country |
| :--- | :--- |
| 1 | Afghanistan |
| 2 | Algeria |
| 3 | Bangladesh |
| 4 | Bolivia |
| 5 | China |
| 6 | Egypt |
| 7 | Iraq |
| 8 | Morocco |
| 9 | Nepal |
| 10 | Qatar |
| 11 | Tunisia |

**Restricted Countries (🟡):**

| # | Country | Restriction |
| :--- | :--- | :--- |
| 1 | India | 30% tax + 1% TDS |
| 2 | Indonesia | Payments prohibited |
| 3 | Nigeria | Banking channels restricted |
| 4 | Russia | Settlements prohibited |
| 5 | Thailand | Licensing required |
| 6 | Turkey | Payments prohibited |
| 7 | Vietnam | Legal payments prohibited |

Citizens and residents of **Absolute Prohibition Countries** are **prohibited** from holding, trading, or using PNJC.

### 8.2.

Engaging in actions aimed at manipulating the Token price, creating artificial demand, or disseminating false information about the Project.

### 8.3.

Conducting attacks on smart contracts, including attempts to hack, exploit vulnerabilities, carry out MEV attacks (front-running, sandwich), or other malicious actions.

### 8.4.

Using the Website to distribute viruses, malicious code, spam, or other materials that infringe upon the rights of third parties.

### 8.5.

Infringing upon copyright and related rights to Website content, including texts, graphics, logos, videos, and other materials.

---

## 9. Intellectual Property

### 9.1.

All materials posted on the Website, including but not limited to: texts, images, logos, trademarks, videos, software code (except for open-source smart contract code), are the property of the Project or its licensors and are protected by intellectual property laws.

### 9.2.

The User may use Website materials for personal non-commercial informational purposes. Any commercial use, copying, distribution, modification, or public reproduction of materials without the written permission of the Project is prohibited.

### 9.3.

Open-source smart contract code is distributed under the **MIT License** (unless otherwise stated) and may be used in accordance with the terms of such license.

**Refer to:** Intellectual Property Policy, Brand Guidelines.

---

## 10. Disclaimer and Limitation of Liability

### 10.1. Disclaimer of Warranties

The Project provides the Website, Services, and Token **"as is"** and **"as available"** without any express or implied warranties, including but not limited to:

- Warranties of fitness for any purpose, commercial value, or error-free operation;
- Warranties of uninterrupted operation of the Website and Services;
- Warranties of Token price appreciation, liquidity, or utility;
- Warranties of protection against all possible smart contract vulnerabilities (despite verification and future audits).

### 10.2. Limitation of Liability

To the maximum extent permitted by applicable law, the Project, its founders, team, partners, and affiliates shall **not be liable** for:

- Any direct, indirect, incidental, special, punitive, or consequential damages arising out of or in connection with the use or inability to use the Website, Services, or Token;
- Loss of revenue, profit, data, reputation, or other intangible losses;
- Errors, omissions, failures, delays, or interruptions in the operation of the Polygon blockchain, Uniswap V2 DEX, or other external systems;
- Actions of third parties, including hacker attacks, phishing, fraud;
- Tax, regulatory, or other legal consequences related to the holding and trading of the Token.

### 10.3.

Some jurisdictions do not allow limitations of liability or exclusions of implied warranties, so the above limitations may not apply to you. In such cases, the Project's liability shall be limited to the minimum extent permitted by law.

---

## 11. Indemnification

The User agrees to defend, indemnify, and hold harmless the Project, its founders, team, partners, and affiliates from and against any claims, lawsuits, demands, damages, expenses, and legal costs (including reasonable attorneys' fees) arising out of or resulting from:

- Your violation of these Terms, the Disclaimer, or other Project documents;
- Your violation of laws or rights of third parties;
- Your use of the Website, Services, or Token;
- Your acts or omissions that resulted in damages.

---

## 12. Governing Law and Dispute Resolution

### 12.1. Governing Law

These Terms shall be governed by and construed in accordance with the laws of **Switzerland**, without regard to conflict of law principles, as a neutral jurisdiction with developed cryptocurrency regulation.

### 12.2. Pre-Trial Settlement

Before initiating court or arbitration proceedings, the parties undertake to make efforts to settle the dispute through negotiations within **30 (thirty) calendar days** from the date of sending a written claim.

### 12.3. Arbitration

Any disputes that are not resolved through pre-trial settlement shall be finally resolved by international arbitration in accordance with the rules of the **Swiss Chamber of Commerce and Industry**. The arbitration shall be conducted in English in Zurich, Switzerland. The arbitral award shall be final and binding on both parties.

### 12.4. Waiver of Class Actions

The User agrees that they shall not have the right to participate in class actions or group proceedings against the Project. Any disputes shall be resolved only individually.

---

## 13. Amendments to the Terms

### 13.1.

The Project reserves the right to amend, supplement, or update these Terms at any time. Amendments take effect upon publication on the Website.

### 13.2.

The User is obligated to regularly check the current version of the Terms on the Website. Continued use of the Website, Services, or Token after amendments are made constitutes your acceptance of the new Terms.

### 13.3.

Material changes may be additionally communicated to users through official channels (Telegram, X (Twitter), Website).

---

## 14. Final Provisions

### 14.1.

If any provision of these Terms is held to be invalid or unenforceable, such invalidity shall not affect the validity of the remaining provisions, which shall remain in full force and effect.

### 14.2.

These Terms constitute the entire agreement between you and the Project regarding the subject matter hereof and supersede all prior oral or written agreements.

### 14.3.

The Project shall not be liable for any failure to perform its obligations caused by force majeure events, including but not limited to: natural disasters, military actions, strikes, epidemics, internet or blockchain failures, changes in legislation.

### 14.4.

No delay or inaction on the part of the Project shall be deemed a waiver of any right or claim.

### 14.5.

All notices and communications under these Terms shall be sent to the Project's official email address: `support@cryptotengo.com` (or through the feedback form on the Website).

---

## 15. Contact Information

For any matters relating to these Terms, you may contact us at:

| Channel | Contact |
| :--- | :--- |
| **E-mail** | `support@cryptotengo.com` |
| **Telegram** | Official community channel |
| **X (Twitter)** | @PanjoCoin |
| **Website** | [www.cryptotengo.com](https://www.cryptotengo.com) |

---

## 16. Relationship with Other Documents

These Terms are inextricably linked to the following documents, which form an integral part hereof:

| Document | Link |
| :--- | :--- |
| **Legal Disclaimer** | [github.com/CryptoTengo/PanjoCoin/docs/Disclaimer.md](https://github.com/CryptoTengo/PanjoCoin) |
| **Whitepaper** | [github.com/CryptoTengo/PanjoCoin/docs/WhitePaper.md](https://github.com/CryptoTengo/PanjoCoin) |
| **Tokenomics** | [github.com/CryptoTengo/PanjoCoin/docs/Tokenomics.md](https://github.com/CryptoTengo/PanjoCoin) |
| **AML Policy** | [github.com/CryptoTengo/PanjoCoin/docs/AML_Policy.md](https://github.com/CryptoTengo/PanjoCoin) |
| **Privacy Policy** | [github.com/CryptoTengo/PanjoCoin/docs/PrivacyPolicy.md](https://github.com/CryptoTengo/PanjoCoin) |
| **Risk Disclosure** | [github.com/CryptoTengo/PanjoCoin/docs/RiskDisclosure.md](https://github.com/CryptoTengo/PanjoCoin) |
| **Restricted Countries List** | [github.com/CryptoTengo/PanjoCoin/docs/RestrictedCountries.md](https://github.com/CryptoTengo/PanjoCoin) |
| **Smart Contract (PolygonScan)** | `0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF` |
| **GitHub Repository** | [github.com/CryptoTengo/PanjoCoin](https://github.com/CryptoTengo/PanjoCoin) |

---

## 17. Disclaimer

These Terms of Use are provided for informational purposes and do not constitute legal advice.

Specific obligations may depend on:

- User location;
- Services used;
- Future ecosystem development;
- Applicable regulations.

**It does not constitute:**
- Investment advice;
- Financial advice;
- Legal advice;
- Tax advice;
- An offer to sell securities;
- A solicitation to purchase financial instruments.

Participation in blockchain ecosystems involves significant risks. Individuals should conduct independent research and seek professional advice where appropriate before making financial or legal decisions.

---

### Document Information

| Property | Value |
| :--- | :--- |
| **Document** | Terms of Use |
| **Version** | 1.1 (Updated) |
| **Effective Date** | July 25, 2026 |
| **Status** | Official |
| **Next Review** | Annually or after major changes |

---

© 2026 PanjoCoin (PNJC) / CryptoTengo. All rights reserved.  
**Document Version:** 1.1 (Updated)  
**Last Updated:** July 25, 2026
