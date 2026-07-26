# Security Policy

## PanjoCoin (PNJC)

**Version:** 1.1 (Updated)  
**Effective Date:** July 25, 2026  
**Project:** PanjoCoin (PNJC)  
**Blockchain:** Polygon PoS  
**Token Standard:** ERC-20 (ERC20Burnable + ERC20Permit)  
**Smart Contract Address:** `0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF`

---

## 1. Introduction

This **Security Policy** defines the security principles, controls, and practices adopted by PanjoCoin (PNJC) to protect the ecosystem, users, digital assets, infrastructure, and operational processes.

Security is a fundamental component of blockchain ecosystems due to the unique risks associated with:

- Smart contracts;
- Decentralised finance;
- Digital assets;
- Online infrastructure;
- Community platforms;
- Cyber threats.

PanjoCoin is committed to implementing responsible security practices based on **prevention**, **transparency**, and **continuous improvement**.

---

## 2. Purpose

The objectives of this Security Policy are:

- Establish security standards;
- Protect ecosystem infrastructure;
- Reduce cybersecurity risks;
- Define security responsibilities;
- Support operational resilience;
- Increase user and partner confidence.

---

## 3. Scope

This policy applies to:

- PNJC smart contracts (token, liquidity locker, vesting, treasury, DAO);
- Blockchain infrastructure (Polygon PoS);
- Websites and documentation systems;
- GitHub repositories;
- Social media accounts (X, Telegram);
- Community platforms;
- Treasury systems (multisig wallets);
- Third-party services;
- Project contributors and developers.

---

## 4. Security Principles

### 4.1. Security by Design

Security considerations are integrated into:

- Architecture;
- Development;
- Deployment;
- Operations.

Security should not be treated as an additional feature but as a core ecosystem requirement.

### 4.2. Least Privilege

Access rights should be limited according to:

- Role;
- Responsibility;
- Operational necessity.

Users should only have access required to perform assigned tasks.

### 4.3. Defense in Depth

Security should rely on multiple protection layers:

- Technical controls;
- Operational procedures;
- User awareness;
- Monitoring.

### 4.4. Transparency

PNJC supports transparent security practices through:

- Public documentation;
- Verified contracts on PolygonScan;
- Responsible disclosure;
- Clear communication.

### 4.5. Continuous Improvement

Security processes should evolve according to:

- Emerging threats;
- Ecosystem expansion;
- Technological changes;
- Security findings.

---

## 5. Security Governance

### Project Leadership

**Responsibilities:**
- Define security priorities;
- Approve security improvements;
- Coordinate major security decisions.

### Development Team

**Responsibilities:**
- Secure coding (Solidity 0.8.36);
- Smart contract protection (OpenZeppelin);
- Vulnerability resolution;
- Technical reviews.

### Infrastructure Management

**Responsibilities:**
- Account security;
- Hosting protection;
- Access control.

### Community Management

**Responsibilities:**
- Security awareness;
- Scam prevention;
- Official communication.

---

## 6. Smart Contract Security

PNJC recognises smart contracts as critical infrastructure.

### Security Objectives

- Predictable behaviour;
- Minimised attack surface;
- Transparent functionality.

### Security Practices

| Practice | Description |
| :--- | :--- |
| **Solidity Secure Development** | Best practices with Solidity 0.8.36. |
| **OpenZeppelin Standards** | v5.5.0 audited libraries. |
| **Code Review** | Structured review process. |
| **Testing** | Hardhat, Chai, Slither, Mythril. |
| **Contract Verification** | PolygonScan (Exact Match). |
| **Documentation** | NatSpec comments and public docs. |

### Smart Contract Protection

| Protection | Status |
| :--- | :--- |
| **Fixed Supply** | ✅ |
| **Mint Disabled** | ✅ |
| **Upgradeability Disabled** | ✅ |
| **Ownerless (Token)** | ✅ |
| **No Blacklist** | ✅ |
| **No Freeze** | ✅ |
| **Zero Transfer Tax** | ✅ |
| **ReentrancyGuard** | ✅ |
| **No selfdestruct** | ✅ |
| **No delegatecall** | ✅ |
| **ERC20Burnable** | ✅ |
| **ERC20Permit (EIP-2612)** | ✅ |

---

## 7. Access Control Policy

### Authentication

Recommended controls:

- Strong passwords;
- Multi-factor authentication (MFA);
- Secure credentials;
- Hardware wallets for critical accounts.

### Authorization

Access should be:

- Role-based;
- Limited;
- Reviewed periodically.

### Account Protection

Critical accounts should use:

- Additional security layers;
- Restricted permissions;
- Secure recovery methods.

---

## 8. Digital Asset Security

Protection of blockchain assets is a priority.

### Security Measures

| Measure | Description |
| :--- | :--- |
| **Secure Wallet Management** | Hardware wallets for treasury. |
| **Controlled Access** | Limited personnel. |
| **Transaction Verification** | Multisig approval. |
| **Documented Procedures** | Clear operational guidelines. |

---

## 9. Treasury Security

Treasury-related controls should include:

| Control | Description |
| :--- | :--- |
| **Controlled Wallet Access** | 3/5 multisig approval. |
| **Transaction Review** | All transactions reviewed. |
| **Transparent Procedures** | Public on-chain reporting. |
| **Multisignature Solutions** | At least 3 of 5 signers required. |

---

## 10. Software Development Security

### Code Management

| Practice | Description |
| :--- | :--- |
| **Version Control** | GitHub with protected branches. |
| **Repository Protection** | Limited write access. |
| **Review Procedures** | Pull request reviews. |

### Testing

Security testing may include:

- Functional testing;
- Vulnerability review (Slither, Mythril);
- Integration testing;
- Unit testing (Hardhat, Chai).

### Dependencies

External libraries and tools should be evaluated for security risks.

**Dependencies:**
- OpenZeppelin v5.5.0 (audited);
- Regular dependency scanning (Dependabot).

---

## 11. Website and Infrastructure Security

### Security Objectives

- Protect availability;
- Prevent unauthorised changes;
- Maintain reliable access.

### Recommended Controls

| Control | Description |
| :--- | :--- |
| **HTTPS** | TLS encryption for all traffic. |
| **Secure Hosting** | Reputable cloud providers. |
| **Access Restrictions** | Limited administrative access. |
| **Updates** | Regular security patches. |
| **Monitoring** | Continuous security monitoring. |

---

## 12. GitHub Repository Security

Source code security practices include:

| Practice | Description |
| :--- | :--- |
| **Protected Branches** | Main branch protected from direct pushes. |
| **Controlled Access** | Limited write permissions. |
| **Review Before Changes** | Pull request review required. |
| **Protection of Sensitive Information** | No credentials in code. |

**Sensitive credentials should never be stored in public repositories.**

**Repository:** [github.com/CryptoTengo/PanjoCoin](https://github.com/CryptoTengo/PanjoCoin)

---

## 13. Social Media Security

Official channels require protection against:

- Impersonation;
- Account takeover;
- Fake announcements.

### Controls

| Control | Description |
| :--- | :--- |
| **Multi-Factor Authentication** | Required for all official accounts. |
| **Limited Administrator Access** | Restricted to essential personnel. |
| **Verification Procedures** | Official account verification. |

**Official Channels:**
- X (Twitter): @PanjoCoin
- Telegram: Official community channel
- Website: www.cryptotengo.com

---

## 14. Community Security

Community protection measures include:

| Measure | Description |
| :--- | :--- |
| **Official Channel Verification** | Clear identification of official channels. |
| **Scam Warnings** | Regular security alerts. |
| **Moderation** | Active community moderation. |
| **Security Education** | User awareness campaigns. |

**Users should be informed about:**
- Fake tokens and websites;
- Phishing attempts;
- Fraudulent offers;
- Impersonation scams.

---

## 15. Data Protection

PNJC aims to protect information through:

| Principle | Description |
| :--- | :--- |
| **Responsible Data Handling** | Only essential data collected. |
| **Access Limitations** | Restricted data access. |
| **Privacy-Aware Practices** | Data minimisation and encryption. |

**Only necessary information should be collected and processed.**

---

## 16. Third-Party Security

External services may introduce additional risks.

### Third-Party Evaluation

Should consider:

- Security reputation;
- Reliability;
- Access requirements;
- Dependency risks.

### Examples

- Hosting providers;
- Analytics services;
- APIs;
- Infrastructure providers.

---

## 17. Vulnerability Management

Security issues should follow a structured process:

### Identification

Sources may include:

- Internal reviews;
- Security researchers;
- Community reports.

### Assessment

Evaluate:

- Severity (Critical / High / Medium / Low);
- Impact;
- Affected components.

### Remediation

Actions may include:

- Fixes and patches;
- Updates;
- Security improvements;
- Communication.

---

## 18. Responsible Disclosure

PNJC encourages responsible reporting of security concerns.

### Reports Should Include

- Description;
- Affected component;
- Potential impact;
- Supporting information.

**Contact:** `security@cryptotengo.com`

The project aims to handle legitimate security reports professionally.

---

## 19. Security Incident Response

Security incidents should follow:

1. Detection.
2. Assessment.
3. Containment.
4. Resolution.
5. Recovery.
6. Review.

**Detailed procedures are described in:** Incident Response Plan (see SECURITY.md).

### Incident Severity Levels

| Level | Description | Response Time |
| :--- | :--- | :--- |
| **Critical** | Active exploit, loss of funds. | Immediate (within 1 hour) |
| **High** | High-risk vulnerability. | Within 24 hours |
| **Medium** | Moderate-risk issue. | Within 72 hours |
| **Low** | Low-risk or informational. | Within 1 week |

---

## 20. Security Monitoring

Potential monitoring areas:

| Area | Description |
| :--- | :--- |
| **Smart Contract Activity** | Transactions, events, burns. |
| **Infrastructure Availability** | Uptime and performance. |
| **Account Activity** | Unauthorised access attempts. |
| **Suspicious Behaviour** | Anomaly detection. |
| **Security Alerts** | Automated alert systems. |

---

## 21. Security Awareness

Contributors and community members should understand:

- Wallet safety (hardware wallets recommended);
- Phishing risks;
- Official communication channels;
- Verification procedures.

---

## 22. Security Risk Management

Security risks are managed through:

| Document | Description |
| :--- | :--- |
| **Cybersecurity Risk Management Policy** | Risk identification and mitigation. |
| **Smart Contract Risk Policy** | Contract-specific risks. |
| **Incident Response Plan** | Incident handling procedures. |
| **Disaster Recovery Plan** | Recovery procedures. |

---

## 23. Smart Contract Security Checklist

All PNJC smart contracts undergo verification against this checklist:

| Check | Status |
| :--- | :--- |
| **OpenZeppelin libraries used** | ✅ |
| **ReentrancyGuard applied** | ✅ |
| **No selfdestruct** | ✅ |
| **No delegatecall** | ✅ |
| **No upgradeability** | ✅ |
| **No owner (token)** | ✅ |
| **No mint function** | ✅ |
| **No blacklist** | ✅ |
| **No freeze** | ✅ |
| **Zero transfer tax** | ✅ |
| **ERC20Burnable implemented** | ✅ |
| **ERC20Permit (EIP-2612) implemented** | ✅ |
| **Code verified on PolygonScan** | ✅ |
| **Independent audit scheduled** | ✅ |

---

## 24. Future Security Improvements

As PNJC grows, additional measures may include:

| Improvement | Description | Timeline |
| :--- | :--- | :--- |
| **Independent Security Audits** | CertiK / Hacken audits. | Q2–Q4 2026 |
| **Penetration Testing** | Active security testing. | Q3 2026 |
| **Bug Bounty Programs** | Rewards for vulnerability discovery. | Q4 2026 |
| **Automated Monitoring** | AI-driven threat detection (future). | Q4 2026 |
| **Formal Security Management** | ISO 27001 alignment. | Q1 2027 |

---

## 25. Alignment With Security Standards

PNJC security practices may consider principles from:

| Standard | Description |
| :--- | :--- |
| **Secure Software Development Lifecycle (SSDLC)** | Security integrated into development. |
| **ISO 27001 Information Security Principles** | International security standard. |
| **Blockchain Security Best Practices** | Industry-specific guidance. |

---

## 26. Conclusion

Security is a fundamental requirement for sustainable blockchain ecosystem development.

PanjoCoin aims to maintain a secure and resilient ecosystem through:

- Responsible development;
- Transparent practices;
- Access protection;
- Continuous monitoring;
- Ongoing improvement.

---

## Disclaimer

This Security Policy describes security principles and practices.

It does not guarantee complete protection against all possible cybersecurity threats.

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
| **Document** | Security Policy |
| **Version** | 1.1 (Updated) |
| **Effective Date** | July 25, 2026 |
| **Status** | Official |
| **Next Review** | Quarterly |

---

© 2026 PanjoCoin (PNJC) / CryptoTengo. All rights reserved.  
**Document Version:** 1.1 (Updated)  
**Last Updated:** July 25, 2026
