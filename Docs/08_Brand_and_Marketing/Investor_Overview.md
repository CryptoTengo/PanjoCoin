# Investor Overview

## PanjoCoin (PNJC)

**Version:** 1.1 (Updated)
**Date:** July 25, 2026
**Network:** Polygon PoS
**Token Standard:** ERC-20 + ERC20Burnable + ERC20Permit (EIP-2612)
**Smart Contract Address:** `0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF`

---

## 1. Executive Summary

PanjoCoin (PNJC) is a utility token built on the **Polygon PoS** network, designed to power a transparent, community-driven ecosystem combining blockchain technology, gaming, charitable initiatives, and decentralised governance.

### Key Highlights

| Feature | Detail |
| :--- | :--- |
| **Total Supply** | 1,000,000,000,000 PNJC (fixed) |
| **Token Type** | Utility Token |
| **Network** | Polygon PoS (low fees, fast transactions) |
| **Transfer Tax** | 0% on all transactions |
| **Security** | Ownerless contract, no mint function, immutable |
| **Liquidity Lock** | 50% locked for 12 months (no emergency withdrawal) |
| **Team Status** | Fully doxxed founder (Tengo Kalandia, 11+ years charity sector) |
| **Audits** | Planned with CertiK / Hacken |
| **Burn Mechanism** | Optional, user-driven (`burn()` function) |
| **Governance** | DAO planned (Q4 2026) |
| **Utility** | Gaming (ONE+), charity (ClownCare Bridge), governance (DAO) |

---

## 2. Token Metrics

### 2.1. Core Parameters

| Parameter | Value |
| :--- | :--- |
| **Token Name** | PanjoCoin |
| **Ticker** | PNJC |
| **Total Supply** | 1,000,000,000,000 PNJC |
| **Decimals** | 18 |
| **Network** | Polygon PoS |
| **Standard** | ERC-20 + ERC20Burnable + ERC20Permit (EIP-2612) |
| **Contract Address** | `0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF` |
| **Mint Function** | ❌ Absent (no new tokens can be created) |
| **Owner** | ❌ `owner = address(0)` (no administrative control) |
| **Upgradeability** | ❌ None (contract is immutable) |
| **Transfer Tax** | ✅ 0% (buy, sell, and transfers are tax-free) |
| **Burn Mechanism** | ✅ Optional, user-driven (`burn()` and `burnFrom()`) |

### 2.2. Supply Distribution

| Category | Share | Amount (PNJC) | Control Mechanism |
| :--- | :--- | :--- | :--- |
| **Liquidity Pool (Uniswap V2)** | 50% | 500,000,000,000 | Locked for 12 months (no emergency withdrawal) |
| **Operational Treasury** | 12% | 120,000,000,000 | 3/5 Multisig |
| **DAO Treasury** | 10% | 100,000,000,000 | DAO Governance (Q4 2026) |
| **Team** | 10% | 100,000,000,000 | 6-month cliff + 12-month vesting |
| **Community** | 8% | 80,000,000,000 | Airdrops, rewards, campaigns |
| **Founder** | 5% | 50,000,000,000 | 12-month cliff + 24-month vesting |
| **Charity Reserve** | 5% | 50,000,000,000 | Public wallet, on-chain verifiable |

**Total:** 100% (1,000,000,000,000 PNJC)

### 2.3. Circulating Supply Schedule

| Year | In Circulation (Billion) | % in Circulation |
| :--- | :--- | :--- |
| **0 (Launch)** | 10.00 | 1.00% |
| **1** | 59.50 | 5.95% |
| **2** | 106.52 | 10.65% |
| **3** | 151.20 | 15.12% |
| **5** | 233.96 | 23.40% |
| **10** | 407.25 | 40.72% |

**Release Formula:** 5% of remaining locked supply enters circulation annually.

### 2.4. Vesting Schedule

| Allocation | Cliff | Vesting Period |
| :--- | :--- | :--- |
| **Team** | 6 months | 12 months linear |
| **Founder** | 12 months | 24 months linear |

---

## 3. Security and Transparency

### 3.1. Smart Contract Security

| Feature | Status |
| :--- | :--- |
| **OpenZeppelin 5.5.0** | ✅ Industry-standard audited libraries |
| **ReentrancyGuard** | ✅ Protection against reentrancy attacks |
| **No selfdestruct** | ✅ Function absent from all contracts |
| **No delegatecall** | ✅ Function absent from all contracts |
| **No upgradeability** | ✅ Contracts cannot be modified after deployment |
| **No owner (token)** | ✅ Token contract does not inherit Ownable |
| **Zero transfer tax** | ✅ 0% on all transactions |
| **Code verified** | ✅ PolygonScan verification complete |

### 3.2. Code Verification

All smart contracts are publicly available and verified:

| Location | Status |
| :--- | :--- |
| **PolygonScan** | ✅ Source code verified (Exact Match) |
| **GitHub** | ✅ Open-source repository |
| **Local Verification** | ✅ Compile with Solidity 0.8.36 for bytecode matching |

### 3.3. Planned Independent Audits

| Contract | Auditor | Timeline |
| :--- | :--- | :--- |
| **PanjoCoin (token)** | CertiK | Q2 2026 |
| **PNJCLiquidityLockerV2** | CertiK | Q2 2026 |
| **PNJCVestingVault** | CertiK / Hacken | Q3 2026 |
| **PNJCAirdrop** | CertiK / Hacken | Q2 2026 |
| **PNJCTreasuryVault** | CertiK / Hacken | Q3 2026 |
| **DAO Governor** | CertiK / Hacken | Q4 2026 |

All audit results will be published on the website and GitHub.

---

## 4. Use of Funds (Treasury Allocation)

### 4.1. Operational Treasury (120B PNJC — 12%)

| Use Case | Description |
| :--- | :--- |
| **Development** | Smart contract development, platform building, technical infrastructure |
| **Marketing** | Community growth, partnerships, educational campaigns |
| **Listings** | Centralized exchange listing fees (when applicable) |
| **Partnerships** | Ecosystem partnerships, strategic collaborations |
| **Operations** | Legal, compliance, administrative expenses |

**Management:** 3/5 Multisig

### 4.2. DAO Treasury (100B PNJC — 10%)

| Use Case | Description |
| :--- | :--- |
| **Grants** | Developer grants, community project funding |
| **Community Initiatives** | Ambassador programs, local events |
| **Ecosystem Growth** | Partner incentives, cross-chain expansion |
| **Charity Programs** | Verified charitable initiatives (subject to DAO vote) |

**Management:** DAO Governance (after Q4 2026)

### 4.3. Charity Reserve (50B PNJC — 5%)

| Use Case | Description |
| :--- | :--- |
| **Healthcare** | Children's healthcare programs |
| **Education** | Educational initiatives |
| **Community Support** | Community assistance programs |
| **Humanitarian** | Emergency relief and humanitarian aid |

**Management:** Public wallet, on-chain transparent

### 4.4. Treasury Transparency

| Feature | Status |
| :--- | :--- |
| **Public Wallet Addresses** | ✅ Listed in Tokenomics document |
| **On-Chain Monitoring** | ✅ All transactions visible on PolygonScan |
| **Regular Reporting** | ✅ Quarterly transparency reports |
| **DAO Oversight** | 🧩 Planned (Q4 2026) |

---

## 5. Burn Mechanism

### 5.1. Overview

PNJC implements an **optional, user-driven burn mechanism** through the `burn()` function inherited from **ERC20Burnable**.

**Key Point:** PNJC does **not** impose any automatic burn tax on transactions. Burning is entirely voluntary and user-initiated.

### 5.2. Burn Functionality

| Feature | Description |
| :--- | :--- |
| **Type** | Optional, user-initiated |
| **Burn Tax** | None (0%) |
| **Control** | Token holders only |
| **Permanence** | Irreversible |
| **Transparency** | All burns on-chain |

**Functions:**
- `burn(uint256 amount)` — Burn your own tokens.
- `burnFrom(address account, uint256 amount)` — Burn tokens from another address (with allowance).

### 5.3. Benefits for Holders

| Benefit | Description |
| :--- | :--- |
| **User Control** | Holders decide whether to burn their tokens. |
| **Supply Reduction** | Burning permanently reduces total supply. |
| **Transparency** | All burn events are publicly verifiable on PolygonScan. |
| **Optional Deflation** | Users can contribute to deflation at their discretion. |

---

## 6. Liquidity and Market Strategy

### 6.1. Initial Liquidity

| Parameter | Value |
| :--- | :--- |
| **Liquidity Allocation** | 500,000,000,000 PNJC (50% of total supply) |
| **DEX** | Uniswap V2 |
| **Lock Period** | 12 months |
| **Emergency Withdrawal** | ❌ None |
| **Contract Type** | Immutable, ownerless |

### 6.2. Liquidity Lock Details

The **PNJCLiquidityLockerV2** contract provides:

- **No emergency withdrawal** — Early removal is impossible.
- **No owner** — No administrative control.
- **Reentrancy protection** — Secure against attacks.
- **Public verification** — Lock status, amount, and unlock date are on-chain.

### 6.3. Market Support

| Mechanism | Description |
| :--- | :--- |
| **Gradual Unlocks** | 5% of locked supply per year |
| **Treasury Management** | Strategic liquidity support when needed |
| **Transparency** | All wallet addresses and transactions public |

---

## 7. Team and Governance

### 7.1. Founder

| Parameter | Detail |
| :--- | :--- |
| **Name** | Tengo Kalandia |
| **Experience** | 11+ years in charitable sector (Director of SmileDonate Foundation) |
| **Role** | Smart contract developer, Whitepaper author, strategic development |
| **Status** | Fully doxxed (public reputation) |

### 7.2. Current Governance

Until DAO launch, the project is managed by:

| Structure | Details |
| :--- | :--- |
| **Management** | Founder-led with advisory support |
| **Treasury** | 3/5 Multisig |
| **Transparency** | All major decisions communicated publicly |

### 7.3. Future Governance (DAO)

| Parameter | Value |
| :--- | :--- |
| **Implementation** | Q4 2026 |
| **Voting Power** | 1 PNJC = 1 vote |
| **Quorum** | 4% of total supply |
| **Voting Period** | 7 days |
| **Timelock** | 48 hours for proposal execution |

**Governance Areas:**
- Treasury allocation;
- Charity programs;
- Ecosystem initiatives.

---

## 8. Roadmap

### 8.1. Key Milestones

| Quarter | Milestone | Status |
| :--- | :--- | :--- |
| **Q2 2026** | Token deployment, MerkleAirdrop, Audits | 🧩 In Progress |
| **Q3 2026** | VestingVault, TreasuryVault, Liquidity Lock | 🧩 Code Ready |
| **Q4 2026** | DAO Governor deployment, Governance launch | 🧩 Code Ready |
| **Q1–Q2 2027** | ClownCare Bridge development and launch | 🧩 Design Phase |
| **Q3–Q4 2027** | ONE+ Platform development and launch | 🧩 Design Phase |
| **2028** | Scaling, cross-chain research, ecosystem expansion | 🔄 Conceptual |

### 8.2. Key Differentiators

| Feature | PanjoCoin (PNJC) | Typical Memecoins |
| :--- | :--- | :--- |
| **Transfer Tax** | 0% | 5–50% (buy + sell tax) |
| **Liquidity Lock** | 12 months, ownerless | Often unlocked or short-term |
| **Emergency Withdrawal** | ❌ No | Often yes (rug risk) |
| **Burn Mechanism** | Optional, user-driven | Transaction tax-based |
| **Doxxed Team** | ✅ Full transparency | Often anonymous |
| **Utility** | Gaming, charity, governance | None or minimal |
| **Audits** | Planned with CertiK | Rarely |
| **Owner** | None (ownerless) | Often admin-owned |

---

## 9. Risk Factors

### 9.1. Key Risks

| Risk | Description |
| :--- | :--- |
| **Market Risk** | Token price is volatile and may fall to zero. |
| **Liquidity Risk** | Pool depth may be insufficient for large orders. |
| **Technical Risk** | Smart contracts may contain unknown vulnerabilities. |
| **Regulatory Risk** | Cryptocurrency laws may change, affecting token usability. |
| **Development Risk** | Planned features may be delayed or not implemented. |
| **Adoption Risk** | The ecosystem may not achieve sufficient adoption. |

### 9.2. Risk Mitigation

| Risk | Mitigation |
| :--- | :--- |
| **Market Risk** | Liquidity locking, treasury support, long-term utility focus |
| **Technical Risk** | OpenZeppelin libraries, independent audits, immutable contracts |
| **Regulatory Risk** | Utility-focused design, legal review, compliance awareness |
| **Development Risk** | Code already ready, audited before deployment, transparent roadmap |
| **Liquidity Risk** | 50% allocation, 12-month lock, no emergency withdrawal |

---

## 10. How to Participate

### 10.1. Acquisition

| Method | Description |
| :--- | :--- |
| **DEX Trading** | Purchase PNJC on Uniswap V2 (Polygon network) |
| **Airdrops** | Participate in community campaigns (via MerkleAirdrop) |
| **Ecosystem Participation** | Earn PNJC through community contributions |

### 10.2. Contract Address

```
0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF
```

Always verify the contract address on official sources before making any transaction.

### 10.3. Official Resources

| Resource | Link |
| :--- | :--- |
| **Website** | [www.cryptotengo.com](https://www.cryptotengo.com) |
| **GitHub** | [github.com/CryptoTengo/PanjoCoin](https://github.com/CryptoTengo/PanjoCoin) |
| **Smart Contract** | `0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF` |
| **PolygonScan** | [View Contract](https://polygonscan.com/address/0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF) |
| **Socials** | X (Twitter), Telegram |

---

## 11. Frequently Asked Questions

**Q1: Is PanjoCoin a security?**

**A:** No. PNJC is a utility token designed to provide access to ecosystem services. It does not represent equity, ownership, or rights to income, dividends, or profits.

**Q2: What is the transfer tax?**

**A:** PNJC has a **0% transfer tax** on all transactions — buying, selling, and transferring are tax-free.

**Q3: How does burning work?**

**A:** PNJC implements **optional, user-driven burning**. Holders can burn their tokens using the `burn()` function. There is no automatic burn tax.

**Q4: Is the liquidity locked?**

**A:** Yes. 50% of total supply is locked in an immutable, ownerless contract for 12 months with no emergency withdrawal.

**Q5: Who controls the project?**

**A:** Currently, a 3/5 multisig controls the treasury. After Q4 2026, the DAO will control key parameters, and multisig keys will be transferred to community-elected members.

**Q6: Has the project been audited?**

**A:** Internal testing is complete. Independent audits by CertiK / Hacken are scheduled before each module's deployment.

**Q7: Is the team doxxed?**

**A:** Yes. The founder, Tengo Kalandia, is fully doxxed with 11+ years of public charitable work.

**Q8: What is the utility of PNJC?**

**A:** PNJC provides access to the ONE+ gaming platform (Q3 2027), ClownCare Bridge charity (Q2 2027), DAO governance (Q4 2026), and future ecosystem services.

**Q9: How can I verify the contract?**

**A:** Visit PolygonScan, view the verified source code, or compile from GitHub and compare bytecode.

**Q10: What happens if I send tokens to the wrong address?**

**A:** Transactions on the blockchain are irreversible. Always verify addresses before sending.

**Q11: Is there a burn tax?**

**A:** No. PNJC has **0% burn tax**. Burning is entirely optional and user-driven.

**Q12: Can more tokens be minted?**

**A:** No. The `mint()` function is absent. The supply is fixed at 1 trillion PNJC.

---

## 12. Important Disclaimer

This document is for informational purposes only and does not constitute financial, investment, or legal advice.

- PNJC is a utility token, not a security.
- No guarantees are made regarding token value, price appreciation, or returns.
- Participate only with funds you can afford to lose entirely.
- You are solely responsible for complying with your jurisdiction's laws.
- The project may delay or modify roadmap items based on technical, regulatory, or market conditions.

By acquiring PNJC, you acknowledge that you have read and understood the risks described in this document and the full Risk Disclosure Document.

---

## 13. Contact Information

| Purpose | Contact |
| :--- | :--- |
| **General Inquiries** | `info@cryptotengo.com` |
| **Legal/Regulatory** | `legal@cryptotengo.com` |
| **Security** | `security@cryptotengo.com` (for vulnerability reports) |

---

## 14. Document Information

| Property | Value |
| :--- | :--- |
| **Document** | Investor Overview |
| **Version** | 1.1 (Updated) |
| **Date** | July 25, 2026 |
| **Status** | Official |
| **Next Review** | After DAO launch (Q4 2026) |

---

© 2026 PanjoCoin (PNJC) / CryptoTengo. All rights reserved.  
**Document Version:** 1.1 (Updated)  
**Last Updated:** July 25, 2026
