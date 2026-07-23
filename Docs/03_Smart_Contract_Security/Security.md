### PanjoCoin (PNJC) — SECURITY.md
Version: 1.0
Date: July 23, 2026
Network: Polygon PoS
Token Standard: ERC-20 + ERC20Permit (EIP-2612) + ERC20Burnable

## 1. Introduction
This document outlines the security framework, practices, and policies for the PanjoCoin (PNJC) project. It serves as the central reference for security researchers, developers, auditors, and community members.

Security is a foundational principle of PanjoCoin. The project is built on the following core security tenets:

Tenet	Description
Transparency	All code is open-source and publicly verifiable.
Immutability	Deployed contracts cannot be upgraded or modified.
No Central Control	The token contract has no owner and no administrative privileges.
Defense in Depth	Multiple layers of security controls are applied.
Responsible Disclosure	Security vulnerabilities are reported and addressed through a coordinated process.
## 2. Security Philosophy
The PanjoCoin security model is based on the principle that security must be built into the code, not added as an afterthought.

2.1. Key Security Principles
Principle	Implementation
Minimize Attack Surface	Contracts are lean, focused, and contain only essential functionality.
Eliminate Single Points of Failure	No single individual or key can compromise the system.
Assume Compromise	Systems are designed with the assumption that some components may be breached.
Open Source Verification	All code is publicly available for independent review.
Immutable Deployment	Deployed contracts cannot be changed, preventing malicious upgrades.
2.2. Source of Truth Hierarchy
In case of conflicts between documents, the following hierarchy applies:

Smart contract state on the blockchain (Polygon)

Blockchain transaction history

Verified smart contract source code

This Security Policy

Whitepaper and other documentation

## 3. Smart Contract Security
3.1. Deployed Contracts
Contract	Status	Description
PanjoCoin (PNJC)	✅ Active	ERC-20 token with Permit and Burnable. Ownerless (owner = address(0)). No mint function.
PNJCLiquidityLockerV2	🧩 Code Ready	Immutable LP lock contract with no emergency withdrawal. Protected against reentrancy.
GoldenPhoenixProtocol	🧩 Code Ready	Deflationary engine with automatic buyback and burn. Uses Ownable2Step with multisig owner.
PNJCVestingVault	🧩 Code Ready	Linear token vesting for team and founder allocations.
PNJCAirdrop	🧩 Code Ready	Merkle tree-based gas-efficient token distribution.
PNJCTreasuryVault	🧩 Code Ready	Multisig treasury management with transparent reporting.
DAO Governor	🧩 Code Ready	Decentralized governance with quorum (4%) and 7-day voting period.
3.2. Security Features in Code
All PanjoCoin contracts incorporate the following security measures:

Feature	Status	Evidence
OpenZeppelin 5.0.2	✅	Industry-standard audited libraries
ReentrancyGuard	✅	Protects against reentrancy attacks
No selfdestruct	✅	Function is absent from all contracts
No delegatecall	✅	Function is absent from all contracts
No Upgradeability	✅	Contracts do not inherit UUPS or TransparentUpgradeableProxy
No Owner (Token)	✅	Token contract does not inherit Ownable
Owner — Multisig	✅	Ownable contracts transfer ownership to multisig
Code Verified	✅	Source code verified on PolygonScan
3.3. Token Contract Security
The PNJC token contract (0x45522cD96EA7eBAF28fc760952b1AD9d5fffc848) implements the following security guarantees:

Guarantee	Status	Description
No Mint Function	✅	mint() is physically absent. New tokens can never be created.
No Owner	✅	Does not inherit Ownable. owner = address(0).
No Blacklist	✅	No function exists to freeze or block addresses.
No Pause	✅	The contract cannot be paused or halted.
No Hidden Taxes	✅	Transfer tax is 0% on all transactions.
No Upgradeability	✅	The contract is immutable once deployed.
3.4. Liquidity Locker Security
The PNJCLiquidityLockerV2 contract provides secure LP token locking with the following properties:

Property	Status	Description
No Emergency Withdraw	✅	No function exists for early withdrawal.
No Owner	✅	The contract is ownerless.
ReentrancyGuard	✅	Protected against reentrancy attacks.
Immutable	✅	Cannot be upgraded or modified after deployment.
## 4. Code Verification and Audits
4.1. Completed Checks
Check	Status	Details
PolygonScan Verification	✅ Completed	Source code verified and published.
Internal Unit Testing	✅ Completed	Hardhat test suite with comprehensive coverage.
Community Code Review	🔄 Available	Open to all via GitHub repository.
4.2. Planned Independent Audits
All contracts (both deployed and code-ready) will be reviewed by independent audit firms. Audit results will be published on the website and GitHub repository.

Contract	Planned Auditor	Timeline
PanjoCoin (token)	CertiK	Q2 2026
PNJCLiquidityLockerV2	CertiK	Q2 2026
GoldenPhoenixProtocol	CertiK / Hacken	Q3 2026
PNJCVestingVault	CertiK / Hacken	Q3 2026
PNJCAirdrop	CertiK / Hacken	Q2 2026
PNJCTreasuryVault	CertiK / Hacken	Q3 2026
DAO Governor	CertiK / Hacken	Q4 2026
Note: Independent audits are scheduled before the activation of each module and before any centralized exchange listings.

4.3. How to Verify Code
All smart contract source code is available for independent verification:

Method	Instructions
PolygonScan	Visit the token contract address and click "Contract" → "Read Contract" to verify.
GitHub	Review the source code at github.com/CryptoTengo/PanjoCoin.
Local Verification	Compile the code locally using Solidity 0.8.34 and compare the bytecode with the deployed contract.
## 5. Key Management and Access Control
5.1. Multisig Wallets
Until the DAO is fully operational, key decisions are managed by a 3/5 multisig wallet. The signers include:

Signer	Role	Status
1	Founder (Tengo Kalandia)	✅ Fully doxxed
2	Technical advisor	🔄 To be appointed
3	Strategic advisor	🔄 To be appointed
4	Backup key (auditor)	🔄 To be appointed
5	Backup key (community representative)	🔄 To be appointed
Key Transfer Plan (after DAO launch):

Keys will be transferred to independent community members elected through DAO.

Geographic distribution of keys (Europe, North America, Asia).

5.2. Ownable2Step Contracts
Contracts that require administrative functions (GoldenPhoenixProtocol, MerkleAirdrop) use OpenZeppelin's Ownable2Step:

Feature	Description
Owner	Multisig wallet (Gnosis Safe) or, after DAO launch, the DAO contract itself.
Two-Step Transfer	Prevents accidental or malicious transfer to the wrong address.
No Single Control	No single individual has sole control over administrative functions.
5.3. No Admin Keys in Token Contract
The token contract itself has no administrative keys:

Feature	Status
No Owner	✅ owner = address(0)
No Minter Role	✅ mint() function absent
No Pauser Role	✅ pause() function absent
No Blacklist Admin	✅ blacklist() function absent
## 6. Threat Model and Risk Mitigation
6.1. Identified Threats and Mitigations
Threat	Impact	Mitigation
Smart Contract Vulnerabilities	Loss of funds, token compromise	OpenZeppelin libraries, code verification, independent audits, immutable deployment
Reentrancy Attacks	Double-spending, fund theft	ReentrancyGuard on all state-changing functions
Front-Running	Unfair trading advantage	0% tax reduces MEV incentives; liquidity locks prevent manipulation
Private Key Compromise	Unauthorized fund movement	Multisig wallets, hardware security modules, key rotation
Liquidity Removal	Market collapse, rug pull	Immutable LP locker with no emergency withdrawal, 12-month lock
Supply Manipulation	Inflation, dilution	No mint function, fixed supply, verified on-chain
Governance Attacks	Malicious proposals, fund theft	Quorum (4%), voting period (7 days), timelock (48 hours)
Insider Threats	Misuse of funds	Multisig controls, transparent treasury, public reporting
6.2. Technical Risk Factors
Risk	Description	Mitigation
Unknown Vulnerabilities	Despite audits, zero-day exploits are possible	Continuous monitoring, bug bounty program, community scrutiny
Network-Level Attacks	Polygon network compromise	Polygon's security measures (checkpointing to Ethereum)
Economic Attacks	Flash loan attacks, price manipulation	0% tax design, liquidity depth, deflationary mechanism
Regulatory Risks	Changes in crypto regulations	Legal review, compliance awareness, utility-focused design
## 7. Vulnerability Reporting and Disclosure
7.1. Responsible Disclosure Policy
PanjoCoin is committed to the responsible disclosure of security vulnerabilities. We ask security researchers to:

Requirement	Description
Report Privately	Do not disclose vulnerabilities publicly until we have had an opportunity to investigate and address them.
Provide Sufficient Details	Include a clear description, steps to reproduce, and potential impact.
Allow Reasonable Time	Give us time to investigate and deploy fixes before public disclosure.
7.2. How to Report a Vulnerability
Email: security@cryptotengo.com

Preferred Format:

text
Subject: [SECURITY] [PanjoCoin] Brief description of the issue

Description:
- Detailed explanation of the vulnerability
- Steps to reproduce
- Affected contracts and versions
- Potential impact
- Suggested fix (if any)

Attachments:
- Proof of concept (if applicable)
- Relevant code snippets
7.3. What to Expect
Stage	Timeline	Description
Acknowledgement	Within 48 hours	Confirmation that we have received your report
Investigation	5-10 business days	Technical analysis and impact assessment
Fix Development	Varies	Development of a fix (if applicable)
Disclosure	After fix deployment	Public disclosure with credit to the reporter
7.4. Bug Bounty Program
PanjoCoin is developing a bug bounty program to incentivize security research. Details will be announced in Q4 2026.

In the interim, we welcome responsible disclosures and will acknowledge all valid reports.

## 8. Incident Response Plan
8.1. Incident Severity Levels
Level	Description	Response Time
Critical	Active exploit, loss of funds, contract compromise	Immediate (within 1 hour)
High	High-risk vulnerability with potential for exploit	Within 24 hours
Medium	Moderate-risk vulnerability	Within 72 hours
Low	Low-risk or informational	Within 1 week
8.2. Incident Response Process
Step	Description
1. Detection	Monitoring systems, community reports, or external alerts.
2. Triage	Assess severity, impact, and affected systems.
3. Containment	If applicable, take immediate action to prevent further damage.
4. Investigation	Root cause analysis and impact assessment.
5. Remediation	Apply fixes or mitigations.
6. Communication	Inform the community through official channels.
7. Post-Mortem	Document the incident, lessons learned, and improvements.
8.3. Communication Channels
Official channels for security announcements:

Channel	Purpose
Website	www.cryptotengo.com
GitHub	github.com/CryptoTengo/PanjoCoin
Twitter/X	Official PanjoCoin account
Telegram	Official community channel
## 9. Operational Security
9.1. Development Security
Practice	Description
Code Reviews	All code changes are reviewed by at least two developers before merging.
Testing	Comprehensive unit tests using Hardhat.
CI/CD	Automated security scans and test runs on all pull requests.
Environment Separation	Development, testnet, and mainnet environments are strictly separated.
9.2. Wallet Security
Practice	Description
Hardware Wallets	Multisig keys are stored on hardware wallets where possible.
Key Rotation	Keys are rotated periodically or after any suspected compromise.
Access Control	Access to sensitive systems is limited to essential personnel.
9.3. Infrastructure Security
Practice	Description
DDoS Protection	Websites and APIs are protected against distributed denial-of-service attacks.
SSL/TLS	All web traffic is encrypted.
Monitoring	Continuous monitoring for suspicious activity.
## 10. Security Best Practices for Users
10.1. Wallet Security
Practice	Description
Hardware Wallets	Use hardware wallets (Ledger, Trezor) for large holdings.
Private Keys	Never share your private keys or seed phrases.
Strong Passwords	Use strong, unique passwords for all accounts.
2FA	Enable two-factor authentication where available.
10.2. Transaction Safety
Practice	Description
Verify Address	Always verify the contract address before interacting: 0x45522cD96EA7eBAF28fc760952b1AD9d5fffc848
Double-Check	Verify transaction details before signing.
Official Sources	Use official sources for contract addresses and information.
Phishing Awareness	Be cautious of phishing attempts — always verify URLs.
10.3. Recognizing Scams
Warning	Description
No Private Key Requests	PanjoCoin will never ask for your private keys.
No Unsolicited DMs	PanjoCoin will never send unsolicited DMs offering investment opportunities.
Verified Channels	Official announcements are made through verified channels only.
Too Good to Be True	Be skeptical of unrealistic promises.
## 11. Security Roadmap
Phase	Timeline	Activity
Phase 1	Q2-Q3 2026	Complete independent audits for all contracts.
Phase 2	Q3-Q4 2026	Launch bug bounty program.
Phase 3	Q4 2026	DAO governance security hardening.
Phase 4	2027	Continuous monitoring and improvement.
## 12. Security Contact Information
Purpose	Contact
Vulnerability Reporting	security@cryptotengo.com
General Inquiries	info@cryptotengo.com
Emergency	Use encrypted communication (PGP key available upon request)
PGP Key: Available at www.cryptotengo.com/security/pgp-key.asc

## 13. Summary of Security Features
Feature	Token Contract	Liquidity Locker	All Other Contracts
No Owner	✅	✅	❌ (Ownable2Step)
No Mint	✅	N/A	N/A
No Upgradeability	✅	✅	✅
No Selfdestruct	✅	✅	✅
No Delegatecall	✅	✅	✅
ReentrancyGuard	N/A	✅	✅
Ownable2Step	N/A	N/A	✅
Multisig Owner	N/A	N/A	✅
Verified Code	✅	✅	✅
Audit Planned	✅	✅	✅
## 14. Document Information
Property	Value
Document	Security Policy
Version	1.0
Date	July 23, 2026
Status	Official
Next Review	After each major contract deployment
© 2026 PanjoCoin. All rights reserved.
Document Version: 1.0
Last Updated: July 23, 2026

This response is AI-generated, for reference only.
