# Incident Response Plan

## PanjoCoin (PNJC)

**Version:** 1.1 (Updated)  
**Effective Date:** July 25, 2026  
**Project:** PanjoCoin (PNJC)  
**Blockchain:** Polygon PoS  
**Token Standard:** ERC-20 (ERC20Burnable + ERC20Permit)  
**Smart Contract Address:** `0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF`

---

## 1. Introduction

This **Incident Response Plan** defines the procedures used by PanjoCoin (PNJC) to detect, assess, respond to, recover from, and learn from security, operational, technical, and reputational incidents.

Blockchain ecosystems operate in a constantly changing environment where incidents may affect:

- Smart contracts;
- Digital infrastructure;
- Community channels (X, Telegram);
- Reputation;
- Operational continuity;
- User confidence.

PanjoCoin is committed to a transparent, responsible, and structured incident response approach.

---

## 2. Purpose

The objectives of this Incident Response Plan are:

- Establish clear response procedures;
- Minimise incident impact;
- Protect ecosystem participants;
- Ensure timely communication;
- Restore normal operations;
- Improve future resilience.

---

## 3. Scope

This plan applies to incidents involving:

- Smart contracts (PanjoCoin token, liquidity locker, vesting, treasury, DAO);
- Blockchain infrastructure (Polygon PoS);
- Websites and digital presence;
- GitHub repositories and source code;
- Social media channels (X, Telegram);
- Community platforms;
- Treasury systems (multisig wallets);
- Third-party services;
- Operational processes.

---

## 4. Incident Categories

### 4.1. Smart Contract Incidents

**Examples:**
- Discovered vulnerability;
- Unexpected contract behaviour;
- Abnormal transactions;
- Malicious exploitation attempts.

### 4.2. Cybersecurity Incidents

**Examples:**
- Account compromise;
- Phishing campaigns;
- Unauthorised access;
- Malware activity.

### 4.3. Infrastructure Incidents

**Examples:**
- Website downtime;
- Hosting failures;
- Domain issues;
- Service interruptions.

### 4.4. Community and Reputation Incidents

**Examples:**
- Fake announcements;
- Impersonation;
- Misinformation;
- Fraudulent campaigns.

### 4.5. Operational Incidents

**Examples:**
- Process failures;
- Loss of access;
- Communication failures;
- Dependency issues.

### 4.6. Regulatory Incidents

**Examples:**
- Regulatory inquiries;
- Compliance concerns;
- Policy violations.

---

## 5. Incident Severity Classification

### Critical

**Definition:** An incident causing or potentially causing:
- Major ecosystem disruption;
- Smart contract compromise;
- Significant user impact;
- Severe reputational damage.

**Response Priority:** Immediate (within 1 hour)

### High

**Definition:** Serious incident requiring urgent action.

**Examples:**
- Compromised account;
- Major phishing campaign;
- Important infrastructure failure.

**Response Priority:** Within 4 hours

### Medium

**Definition:** Limited impact requiring corrective action.

**Examples:**
- Documentation errors;
- Minor security issues;
- Service interruption.

**Response Priority:** Within 24 hours

### Low

**Definition:** Minor issue with limited impact.

**Examples:**
- Small technical problems;
- Non-critical improvements.

**Response Priority:** Within 48 hours

---

## 6. Incident Response Team

### Project Leadership

**Responsibilities:**
- Coordinate major responses;
- Approve strategic decisions;
- Manage external communication.

### Technical Team

**Responsibilities:**
- Investigate technical issues;
- Analyse smart contracts;
- Implement fixes and patches.

### Security Function

**Responsibilities:**
- Assess vulnerabilities;
- Coordinate security response;
- Manage vulnerability reports.

### Communication Team

**Responsibilities:**
- Prepare announcements;
- Prevent misinformation;
- Maintain transparency.

---

## 7. Incident Response Lifecycle

The PNJC response process consists of:

1. Preparation;
2. Detection;
3. Assessment;
4. Containment;
5. Resolution;
6. Recovery;
7. Post-Incident Review.

---

## 8. Phase 1 — Preparation

Preparation activities include:

| Activity | Description |
| :--- | :--- |
| **Maintaining Documentation** | Incident response procedures and contact lists. |
| **Securing Access** | MFA, hardware wallets, restricted permissions. |
| **Defining Responsibilities** | Clear roles and accountabilities. |
| **Maintaining Backups** | GitHub, database, website backups. |
| **Monitoring Security Developments** | Threat intelligence and alerts. |

---

## 9. Phase 2 — Detection

Potential detection sources:

| Source | Description |
| :--- | :--- |
| **Security Researchers** | Responsible disclosure reports. |
| **Community Reports** | User feedback and alerts. |
| **Monitoring Systems** | Automated detection (planned). |
| **Internal Reviews** | Regular security assessments. |
| **Blockchain Analytics** | On-chain transaction monitoring. |

**All suspected incidents should be documented.**

---

## 10. Phase 3 — Assessment

The team evaluates:

| Factor | Description |
| :--- | :--- |
| **Incident Type** | Category of incident. |
| **Severity** | Critical / High / Medium / Low. |
| **Affected Systems** | Which components are impacted. |
| **Potential Impact** | Effect on users and ecosystem. |
| **Required Response** | Immediate actions needed. |

**Assessment Questions:**
- What happened?
- When did it happen?
- Which systems are affected?
- Are users at risk?
- What immediate actions are required?

---

## 11. Phase 4 — Containment

Containment actions may include:

| Action | Description |
| :--- | :--- |
| **Restricting Compromised Access** | Revoke compromised keys. |
| **Securing Accounts** | Reset passwords, enable MFA. |
| **Stopping Unsafe Processes** | Halt vulnerable functions. |
| **Publishing Warnings** | Alert community through official channels. |
| **Coordinating with Relevant Parties** | Auditors, security researchers, legal advisors. |

---

## 12. Phase 5 — Resolution

Resolution activities may include:

| Activity | Description |
| :--- | :--- |
| **Applying Fixes** | Code patches or updates. |
| **Restoring Systems** | Recover from backups. |
| **Updating Security Controls** | Implement additional protections. |
| **Improving Procedures** | Update incident response processes. |

---

## 13. Phase 6 — Recovery

Recovery includes:

| Activity | Description |
| :--- | :--- |
| **Confirming System Security** | Verify fixes are effective. |
| **Monitoring for Recurrence** | Increased vigilance. |
| **Restoring Normal Operations** | Resume full functionality. |
| **Communicating Updates** | Inform community of resolution. |

---

## 14. Phase 7 — Post-Incident Review

After each significant incident, PNJC should evaluate:

| Element | Description |
| :--- | :--- |
| **Root Cause** | What caused the incident? |
| **Response Effectiveness** | Was the response timely and effective? |
| **Lessons Learned** | What can be improved? |
| **Required Improvements** | Updates to procedures and controls. |

---

## 15. Smart Contract Incident Procedure

In case of smart contract concerns:

### Immediate Actions

| Action | Description |
| :--- | :--- |
| **Verify Incident Details** | Confirm the issue exists. |
| **Analyse Blockchain Activity** | Review on-chain transactions. |
| **Assess Severity** | Critical / High / Medium / Low. |

### Technical Response

Possible actions:
- Investigate code behaviour (audit logs, testing);
- Coordinate with security specialists (CertiK / Hacken);
- Publish verified information.

### Communication

Provide:
- Factual updates;
- Risk information;
- Recommended user actions.

**Status:** Ownerless, non-upgradeable contracts reduce risk.

---

## 16. Cybersecurity Incident Procedure

For cybersecurity incidents:

Actions may include:
- Securing compromised accounts;
- Removing unauthorised access;
- Investigating activity;
- Strengthening controls (MFA, key rotation).

---

## 17. Social Media Incident Procedure

If official channels (X, Telegram) are compromised:

| Step | Action |
| :--- | :--- |
| **1** | Confirm compromise. |
| **2** | Notify community through alternative channels. |
| **3** | Secure accounts (reset passwords, revoke sessions). |
| **4** | Publish verification notice. |
| **5** | Restore control. |
| **6** | Post-incident review. |

---

## 18. Phishing and Scam Response

If fraudulent activity is detected:

PNJC may:
- Publish warnings through official channels;
- Identify unofficial sources;
- Educate users on recognition and avoidance;
- Report malicious activity where appropriate (platform reporting).

---

## 19. Communication Principles

During incidents, communication should be:

| Principle | Description |
| :--- | :--- |
| **Accurate** | Only verified information should be published. |
| **Transparent** | Avoid hiding significant issues. |
| **Timely** | Provide updates when meaningful information becomes available. |
| **Responsible** | Avoid speculation, panic, and misleading statements. |

### Communication Channels

| Channel | Purpose |
| :--- | :--- |
| **Website** | [www.cryptotengo.com](https://www.cryptotengo.com) |
| **X (Twitter)** | Official announcements. |
| **Telegram** | Real-time community updates. |
| **GitHub** | Technical status updates. |

---

## 20. Incident Documentation

Each major incident should include:

| Element | Description |
| :--- | :--- |
| **Date and Time** | When the incident occurred. |
| **Description** | What happened. |
| **Affected Systems** | Which components were impacted. |
| **Severity** | Critical / High / Medium / Low. |
| **Response Actions** | What was done. |
| **Resolution** | How it was resolved. |
| **Lessons Learned** | What was learned. |

---

## 21. Incident Severity Matrix

| Level | Description | Response Time | Communication |
| :--- | :--- | :--- | :--- |
| **Critical** | Major ecosystem disruption, smart contract compromise | Immediate (within 1 hour) | Full community notification |
| **High** | Serious incident requiring urgent action | Within 4 hours | Targeted communication |
| **Medium** | Limited impact requiring corrective action | Within 24 hours | Internal review |
| **Low** | Minor issue with limited impact | Within 48 hours | Internal documentation |

---

## 22. Business Continuity Integration

Incident response works together with:

| Document | Purpose |
| :--- | :--- |
| **Business Continuity Management Plan** | Maintain critical operations during disruptions. |
| **Cybersecurity Risk Management Policy** | Security risk identification and mitigation. |
| **Enterprise Risk Management Framework** | Overall risk governance. |
| **Smart Contract Risk Management Policy** | Contract-specific risks. |
| **Disaster Recovery Plan** | System restoration after major disruptions. |

---

## 23. External Coordination

Depending on incident type, PNJC may coordinate with:

| Party | Purpose |
| :--- | :--- |
| **Security Researchers** | Vulnerability investigation and disclosure. |
| **Blockchain Analytics Providers** | Transaction analysis. |
| **Infrastructure Providers** | System restoration and investigation. |
| **Legal Advisors** | Regulatory and compliance issues. |
| **Relevant Authorities** | As required by applicable law. |

---

## 24. Incident Response Contact Information

| Purpose | Contact |
| :--- | :--- |
| **Vulnerability Reporting** | `security@cryptotengo.com` |
| **General Inquiries** | `info@cryptotengo.com` |
| **Emergency** | Use encrypted communication (PGP key available upon request). |

**PGP Key:** Available at [www.cryptotengo.com/security/pgp-key.asc](https://www.cryptotengo.com/security/pgp-key.asc)

---

## 25. Future Improvements

As PNJC grows, additional capabilities may include:

| Improvement | Description | Timeline |
| :--- | :--- | :--- |
| **Formal Security Operations** | Dedicated security team. | Q1 2027 |
| **Bug Bounty Program** | Rewards for vulnerability discovery. | Q4 2026 |
| **External Monitoring** | Third-party security monitoring. | Q4 2026 |
| **Dedicated Incident Response Roles** | Specific team members for incident handling. | Q3 2026 |
| **Automated Alerting Systems** | Real-time incident detection. | Q4 2026 |
| **Incident Management Platform** | Centralised incident tracking. | Q4 2026 |

---

## 26. Incident Response Checklist

| Step | Action | Completed |
| :--- | :--- | :--- |
| **1** | Detect and document the incident. | ☐ |
| **2** | Assess severity and impact. | ☐ |
| **3** | Activate incident response team. | ☐ |
| **4** | Contain the incident. | ☐ |
| **5** | Communicate with stakeholders. | ☐ |
| **6** | Resolve the incident. | ☐ |
| **7** | Recover systems and operations. | ☐ |
| **8** | Conduct post-incident review. | ☐ |
| **9** | Document lessons learned. | ☐ |
| **10** | Update procedures. | ☐ |

---

## 27. Conclusion

Effective incident response is essential for maintaining trust, security, and operational resilience.

PanjoCoin is committed to responding to incidents through:

- Structured procedures;
- Transparent communication;
- Responsible investigation;
- Continuous improvement.

---

## Disclaimer

This Incident Response Plan provides general procedures and does not guarantee prevention of all incidents or losses.

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
| **Document** | Incident Response Plan |
| **Version** | 1.1 (Updated) |
| **Effective Date** | July 25, 2026 |
| **Status** | Official |
| **Next Review** | After each major incident or quarterly |

---

© 2026 PanjoCoin (PNJC) / CryptoTengo. All rights reserved.  
**Document Version:** 1.1 (Updated)  
**Last Updated:** July 25, 2026
