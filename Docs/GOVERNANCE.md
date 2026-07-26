# Governance Framework

## PanjoCoin (PNJC)

**Version:** 1.1 (Updated)
**Date:** July 25, 2026
**Network:** Polygon PoS
**Token Standard:** ERC-20 (ERC20Burnable + ERC20Permit)
**Smart Contract Address:** `0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF`

---

## 1. Executive Summary

This document defines the **governance framework** of the PanjoCoin ecosystem. Governance is the process by which the PanjoCoin community makes decisions about the project's development, resource allocation, and strategic direction.

### Governance Evolution

| Phase | Status | Description |
| :--- | :--- | :--- |
| **Phase 1 — Founder-Led** | ✅ Active | Initial development and launch, with oversight from 3/5 multisig. |
| **Phase 2 — Multisig Oversight** | ✅ Active | Key decisions require multisig approval from diverse stakeholders. |
| **Phase 3 — DAO Governance** | 🧩 Planned (Q4 2026) | Decentralised governance with community voting on key parameters. |

---

## 2. Governance Philosophy

PanjoCoin governance is built on the following principles:

| Principle | Description |
| :--- | :--- |
| **Decentralisation** | Ultimately, the community controls the ecosystem through DAO governance. |
| **Transparency** | All governance decisions, proposals, and votes are publicly verifiable. |
| **Inclusivity** | Any PNJC holder can participate in governance. |
| **Accountability** | Decision-makers are accountable to the community. |
| **Sustainability** | Governance decisions prioritise long-term ecosystem health. |

---

## 3. Governance Structure

### 3.1. Current Structure (Phase 1 & 2)

| Component | Description |
| :--- | :--- |
| **Founder** | Provides strategic direction and technical leadership. |
| **Multisig Wallet (3/5)** | Approves key decisions (treasury spending, partnerships, parameter changes). |
| **Community** | Provides feedback, suggestions, and participates in discussions. |

### Multisig Signers

| Signer | Role | Status |
| :--- | :--- | :--- |
| **1** | Founder (Tengo Kalandia) | ✅ Active |
| **2** | Technical Advisor | 🔄 To be appointed |
| **3** | Strategic Advisor | 🔄 To be appointed |
| **4** | Auditor Representative | 🔄 To be appointed |
| **5** | Community Representative | 🔄 To be appointed |

### 3.2. Future Structure (Phase 3 — DAO)

| Component | Description |
| :--- | :--- |
| **PNJC Holders** | All token holders can participate in governance. |
| **DAO Governor** | Smart contract that executes approved proposals. |
| **Timelock** | Delays execution by 48 hours for transparency. |
| **Community** | Proposes, discusses, and votes on initiatives. |

---

## 4. DAO Governance Framework

### 4.1. Governance Parameters

| Parameter | Value | Description |
| :--- | :--- | :--- |
| **Voting Power** | 1 PNJC = 1 vote | Based on token balance at proposal creation. |
| **Quorum** | 4% of total supply | Minimum votes required for a proposal to pass. |
| **Voting Period** | 7 days | Duration for community voting. |
| **Timelock** | 48 hours | Delay between proposal approval and execution. |
| **Proposal Threshold** | 0.1% of total supply | Minimum tokens required to create a proposal. |

### 4.2. Proposal Types

| Type | Description | Examples |
| :--- | :--- | :--- |
| **Treasury Allocation** | Approve spending from DAO Treasury. | Grants, partnerships, community initiatives. |
| **Charity Programs** | Select and fund charitable initiatives. | Partner with specific foundations. |
| **Ecosystem Improvements** | Non-contract changes. | Marketing campaigns, community programs. |
| **Governance Changes** | Modify governance rules. | Quorum adjustments, voting period changes. |

### 4.3. Proposal Lifecycle

| Step | Description | Timeline |
| :--- | :--- | :--- |
| **1. Discussion** | Community discussion on forum or GitHub. | 7+ days |
| **2. Formal Proposal** | Submit proposal on-chain. | At any time |
| **3. Voting** | Community votes on the proposal. | 7 days |
| **4. Timelock** | Waiting period before execution. | 48 hours |
| **5. Execution** | Proposal is executed on-chain. | After timelock |

---

## 5. Proposal Process

### 5.1. Creating a Proposal

1. Discuss the idea in the community (GitHub Discussions, Telegram, or forums).
2. Refine the proposal based on feedback.
3. Create a formal proposal on-chain (requires minimum token threshold).
4. Wait for the voting period (7 days).
5. If quorum and majority achieved, the proposal enters timelock.
6. Execute the proposal after timelock expires.

### 5.2. Proposal Requirements

| Requirement | Value |
| :--- | :--- |
| **Minimum Tokens** | 0.1% of total supply (1,000,000,000 PNJC) |
| **Description** | Clear explanation of the proposal and its impact. |
| **Target** | The contract or parameter being changed. |
| **Calldata** | The encoded function call (if applicable). |

### 5.3. Voting Options

| Option | Description |
| :--- | :--- |
| **For** | Approve the proposal. |
| **Against** | Reject the proposal. |
| **Abstain** | Neither approve nor reject (counts toward quorum). |

### 5.4. Quorum and Majority Requirements

| Requirement | Value | Description |
| :--- | :--- | :--- |
| **Quorum** | 4% of total supply | Minimum votes cast (For + Against + Abstain). |
| **Majority** | >50% For | Simple majority of votes cast (excluding Abstain). |

---

## 6. Treasury Management

### 6.1. DAO Treasury

| Parameter | Value |
| :--- | :--- |
| **Allocation** | 100,000,000,000 PNJC (10% of total supply) |
| **Purpose** | Ecosystem grants, community initiatives, charity programs, development funding. |
| **Control** | DAO Governance (after Q4 2026) |

### 6.2. Treasury Spending Process

| Step | Description |
| :--- | :--- |
| **1. Proposal** | Community member proposes treasury spending. |
| **2. Discussion** | Community provides input and feedback. |
| **3. Voting** | PNJC holders vote on the proposal. |
| **4. Timelock** | 48-hour delay before execution. |
| **5. Execution** | Treasury funds are transferred if proposal passes. |

### 6.3. Treasury Transparency

| Feature | Description |
| :--- | :--- |
| **Public Wallet** | DAO Treasury address is publicly known. |
| **On-Chain Tracking** | All transactions are visible on PolygonScan. |
| **Regular Reports** | Quarterly reports on treasury usage. |
| **DAO Oversight** | All spending requires community approval. |

---

## 7. Multisig Governance (Until DAO Launch)

### 7.1. Multisig Purpose

Until the DAO is operational, the 3/5 multisig will:

- Manage the Operational Treasury (120B PNJC, 12%);
- Make strategic decisions (partnerships, listings);
- Oversee the development roadmap;
- Prepare for DAO transition.

### 7.2. Multisig Decision Process

| Step | Description |
| :--- | :--- |
| **1. Discussion** | Founder or advisors propose a decision. |
| **2. Consultation** | Community feedback is solicited. |
| **3. Multisig Vote** | At least 3 of 5 signers must approve. |
| **4. Execution** | Transaction is executed on-chain. |
| **5. Transparency** | Decision is publicly communicated. |

### 7.3. Multisig Restrictions

| Restriction | Description |
| :--- | :--- |
| **No Single Control** | No single individual can make a decision. |
| **No Emergency Withdrawal** | Liquidity lock has no emergency withdrawal. |
| **No Minting** | Token supply is fixed and cannot be increased. |
| **No Parameter Changes** | Core token parameters are immutable. |

---

## 8. Community Participation

### 8.1. Ways to Participate

| Method | Description |
| :--- | :--- |
| **Hold PNJC** | Your voting power is based on your token balance. |
| **Discuss Proposals** | Share your views on GitHub, forums, or Telegram. |
| **Create Proposals** | Submit formal governance proposals. |
| **Vote** | Participate in on-chain voting. |
| **Become a Delegate** | Represent other token holders. |

### 8.2. Delegation

| Feature | Description |
| :--- | :--- |
| **What is Delegation?** | Token holders can delegate their voting power to a trusted community member. |
| **Why Delegate?** | Allows token holders to participate without actively monitoring proposals. |
| **How to Delegate?** | Through the DAO Governor smart contract. |
| **Revocation** | Delegation can be revoked at any time. |

### 8.3. Governance Communication Channels

| Channel | Purpose |
| :--- | :--- |
| **GitHub Discussions** | Formal proposal discussions and feedback. |
| **Telegram** | Informal community discussions. |
| **Forum** | Dedicated governance forum (planned). |
| **Snapshots** | Off-chain voting for signaling (planned). |

---

## 9. Governance Smart Contracts

### 9.1. DAO Governor Contract

| Property | Value |
| :--- | :--- |
| **Contract Name** | PNJC_DAO_Governor |
| **Status** | 🧩 Code Ready |
| **Timeline** | Q4 2026 |
| **Features** | Proposal creation, voting, timelock, execution. |

### 9.2. Timelock Contract

| Property | Value |
| :--- | :--- |
| **Contract Name** | PNJC_Timelock |
| **Purpose** | Delays proposal execution by 48 hours. |
| **Status** | 🧩 Code Ready |
| **Timeline** | Q4 2026 |

### 9.3. Treasury Vault

| Property | Value |
| :--- | :--- |
| **Contract Name** | PNJCTreasuryVault |
| **Purpose** | Manages DAO Treasury funds. |
| **Status** | 🧩 Code Ready |
| **Timeline** | Q3 2026 |

---

## 10. DAO Governance Parameters (Initial Settings)

| Parameter | Initial Value | Adjustable By |
| :--- | :--- | :--- |
| **Quorum** | 4% of total supply | DAO |
| **Voting Period** | 7 days | DAO |
| **Timelock** | 48 hours | DAO |
| **Proposal Threshold** | 0.1% of total supply | DAO |

---

## 11. Governance Risks

### 11.1. Identified Risks

| Risk | Description | Mitigation |
| :--- | :--- | :--- |
| **Low Participation** | Insufficient voter turnout. | Quorum ensures minimum participation. |
| **Concentrated Voting** | Large holders dominate governance. | Delegation, community engagement. |
| **Malicious Proposals** | Proposals that harm the ecosystem. | Timelock, community oversight. |
| **Regulatory Risk** | Governance activities may face regulatory scrutiny. | Legal review, compliance awareness. |
| **Technical Risk** | Smart contract vulnerabilities. | Audits (CertiK / Hacken), testing, immutable contracts. |

### 11.2. Risk Mitigation

| Mitigation | Description |
| :--- | :--- |
| **Quorum** | Requires minimum participation for any decision. |
| **Timelock** | Allows community to react to malicious proposals. |
| **Transparency** | All proposals and votes are publicly visible. |
| **Multisig Oversight** | Until DAO launch, multisig provides checks and balances. |

---

## 12. Transition to Full DAO Governance

### 12.1. Transition Timeline

| Phase | Timeline | Activity |
| :--- | :--- | :--- |
| **Phase 1** | Q3 2026 | Audit DAO Governor and Timelock contracts (CertiK / Hacken). |
| **Phase 2** | Q4 2026 | Deploy DAO Governor and Timelock to mainnet. |
| **Phase 3** | Q4 2026 | Transfer governance powers to DAO. |
| **Phase 4** | Q1 2027 | Elect community members to multisig positions. |
| **Phase 5** | 2027+ | Full DAO governance with community-led decision-making. |

### 12.2. Transfer of Powers

| Power | From | To |
| :--- | :--- | :--- |
| **Treasury Control** | 3/5 Multisig | DAO |
| **Parameter Adjustments** | Founder/Multisig | DAO |
| **Charity Selections** | Founder/Multisig | DAO |
| **Partnership Approvals** | Founder/Multisig | DAO |

---

## 13. Governance KPIs

### 13.1. Key Performance Indicators

| Metric | Target | Purpose |
| :--- | :--- | :--- |
| **Voter Participation** | >10% of eligible voters | Healthy governance engagement. |
| **Proposal Throughput** | 1-2 proposals per month | Active governance participation. |
| **Proposal Quality** | High | Well-reasoned, beneficial proposals. |
| **Community Satisfaction** | High | Positive community sentiment. |

### 13.2. Monitoring

| Tool | Purpose |
| :--- | :--- |
| **Governance Dashboard** | Track proposals, votes, and participation. |
| **Community Surveys** | Measure community satisfaction. |
| **On-Chain Analytics** | Monitor treasury and governance activity. |

---

## 14. Governance Areas

### 14.1. DAO Governance Areas

| Area | Description | Status |
| :--- | :--- | :--- |
| **Treasury Allocation** | Approve grants, partnerships, and community initiatives. | 🧩 Q4 2026 |
| **Charity Programs** | Select and approve charitable initiatives (ClownCare Bridge). | 🧩 Q4 2026 |
| **Ecosystem Initiatives** | Marketing campaigns, community programs. | 🧩 Q4 2026 |

### 14.2. Areas Not Subject to DAO Control

| Area | Reason |
| :--- | :--- |
| **Token Supply** | Fixed supply, no minting function. |
| **Smart Contract Logic** | Immutable, non-upgradeable contracts. |
| **Liquidity Lock** | 12-month lock, no emergency withdrawal. |
| **Token Parameters** | Fixed supply, 0% tax, ownerless contract. |

---

## 15. Frequently Asked Questions

**Q1: Who can participate in governance?**

**A:** Any PNJC holder can participate in governance. Your voting power is proportional to your token balance (1 PNJC = 1 vote).

**Q2: How do I create a proposal?**

**A:** You need to hold at least 0.1% of total supply (1,000,000,000 PNJC). Submit the proposal on-chain through the DAO Governor contract.

**Q3: What happens if a malicious proposal passes?**

**A:** The timelock provides a 48-hour delay before execution. The community can use this time to raise concerns or take countermeasures.

**Q4: Can the founder control the DAO?**

**A:** No. After the DAO is launched, the founder has the same voting power as any other token holder. All decisions are made by the community.

**Q5: What can the DAO change?**

**A:** The DAO can approve treasury spending, select charity partners, approve ecosystem initiatives, and modify governance rules (quorum, voting period).

**Q6: What can the DAO NOT change?**

**A:** The DAO cannot change the token supply, mint new tokens, modify the token contract (immutable), or unlock liquidity early.

---

## 16. Governance Roadmap

| Date | Milestone | Status |
| :--- | :--- | :--- |
| **July 2026** | Governance document published | ✅ Complete |
| **Q3 2026** | DAO Governor code audit (CertiK / Hacken) | 🧩 Planned |
| **Q4 2026** | DAO Governor deployment to mainnet | 🧩 Planned |
| **Q4 2026** | First community governance proposals | 🧩 Planned |
| **Q1 2027** | Elect community multisig signers | 🔄 Planned |
| **2027+** | Full DAO governance | 🔄 Planned |

---

## 17. Summary of Governance Features

| Feature | Description |
| :--- | :--- |
| **Voting Power** | 1 PNJC = 1 vote |
| **Quorum** | 4% of total supply |
| **Voting Period** | 7 days |
| **Timelock** | 48 hours |
| **Proposal Threshold** | 0.1% of total supply |
| **Treasury** | DAO-controlled treasury (100B PNJC, 10%) |
| **Transparency** | All proposals, votes, and transactions on-chain |

---

## 18. Integration with PNJC Ecosystem Components

| Component | Governance Integration | Status |
| :--- | :--- | :--- |
| **PNJC Token** | Voting power based on token holdings. | ✅ Active |
| **DAO Governor** | Proposal creation, voting, execution. | 🧩 Q4 2026 |
| **Timelock** | 48-hour delay for proposal execution. | 🧩 Q4 2026 |
| **Treasury Vault** | DAO-controlled treasury management. | 🧩 Q3 2026 |
| **ClownCare Bridge** | Charity program approvals via DAO. | 🧩 Q2 2027 |
| **ONE+ Gaming Platform** | Ecosystem initiatives via DAO. | 🧩 Q3 2027 |

---

## 19. References

| Document | Purpose |
| :--- | :--- |
| **Whitepaper** | Core project documentation. |
| **Tokenomics** | Token distribution and economic model. |
| **Security** | Security policies and practices. |
| **Investor Overview** | Key metrics and participation guide. |
| **Treasury Policy** | Treasury management principles. |
| **Risk Disclosure** | Comprehensive risk factors. |

---

## 20. Document Information

| Property | Value |
| :--- | :--- |
| **Document** | Governance Framework |
| **Version** | 1.1 (Updated) |
| **Date** | July 25, 2026 |
| **Status** | ✅ Active |
| **Next Review** | After DAO launch (Q4 2026) |

---

© 2026 PanjoCoin (PNJC) / CryptoTengo. All rights reserved.  
**Document Version:** 1.1 (Updated)  
**Last Updated:** July 25, 2026
