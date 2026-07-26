# Supply Model

## PanjoCoin (PNJC)

**Version:** 1.1 (Updated)
**Date:** July 25, 2026
**Network:** Polygon PoS
**Token Standard:** ERC-20 + ERC20Burnable + ERC20Permit (EIP-2612)
**Smart Contract Address:** `0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF`

---

## 1. Purpose

The PanjoCoin Supply Model defines how PNJC enters circulation throughout the lifetime of the ecosystem.

The model is designed to achieve five primary objectives:

- Preserve long-term scarcity;
- Provide predictable token availability;
- Minimise inflationary pressure;
- Reduce market volatility;
- Align ecosystem growth with token circulation.

Unlike traditional cryptocurrencies with continuous emissions, PNJC uses a **Controlled Progressive Supply Model**, where almost the entire supply remains locked after launch and is released gradually according to predefined smart-contract rules.

---

## 2. Fixed Supply

The total supply of PNJC is permanently fixed.

| Parameter | Value |
| :--- | :--- |
| **Maximum Supply** | 1,000,000,000,000 PNJC |
| **Additional Minting** | Not Possible |
| **Inflation Rate** | 0% |
| **Token Standard** | ERC-20 + ERC20Burnable + ERC20Permit |
| **Blockchain** | Polygon PoS |
| **Contract Address** | `0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF` |

The token contract contains **no mint functionality** (`mint()` function absent).

Once deployed, the maximum supply can never increase.

---

## 3. Token Standard Extensions

PNJC implements the following ERC-20 extensions:

### 3.1. ERC20Burnable

- Enables **optional, user-driven burning** via `burn()` and `burnFrom()` functions.
- Burning is **voluntary** and **not taxed**.
- All burn events are **publicly verifiable** on PolygonScan.
- Burning permanently reduces total supply.

### 3.2. ERC20Permit (EIP-2612)

- Enables **gasless approvals** using signed messages.
- Eliminates the need for a separate `approve()` transaction before a token transfer.
- Reduces transaction costs and improves user experience.
- Supports meta-transactions and relayer infrastructure.

**How It Works:**

| Traditional ERC-20 | ERC20Permit (EIP-2612) |
| :--- | :--- |
| User submits `approve()` transaction (paying gas). | User signs a message off-chain (no gas). |
| Spender waits for approval to be mined. | Spender submits `permit()` with the signed message. |
| Spender calls `transferFrom()`. | The `permit()` function validates the signature and sets approval atomically. |

**Benefits:**
- **Reduced Transaction Costs** — Users save gas by combining approval and transfer operations.
- **Improved User Experience** — No need for two separate transactions (approve + transfer).
- **Meta-Transaction Support** — Enables relayers to submit transactions on behalf of users.
- **Better DEX Integration** — Allows seamless token swaps without requiring users to approve tokens first.

---

## 4. Initial Distribution

Immediately after deployment, the entire supply exists but almost all tokens remain locked.

| Allocation | Amount |
| :--- | :--- |
| **Total Minted** | 1,000,000,000,000 PNJC |
| **Initially Locked** | 990,000,000,000 PNJC |
| **Initial Circulation** | 10,000,000,000 PNJC |

### Initial Circulating Supply

Only **1%** of the maximum supply is intended to circulate at launch.

This conservative approach significantly reduces early market dilution.

---

## 5. Controlled Release Model

Instead of unlocking a fixed number of tokens each year, PNJC follows an exponentially decreasing release schedule.

Each year:

> **5% of the remaining locked balance is released.**

This means yearly emissions naturally decrease over time.

**Release Formula:**

```
Released(year n) = Locked(year n-1) × 5%
```

**Remaining Locked Supply:**

```
Locked(year n) = Locked(year n-1) × 95%
```

**Circulating Supply:**

```
Circulating = Total Supply − Locked Supply
```

This creates a smooth supply curve without abrupt inflation.

---

## 6. Supply Projection

| Year | Locked Supply | Released During Year | Circulating Supply | Circulating % |
| :--- | :--- | :--- | :--- | :--- |
| **Launch** | 990.000 B | — | 10.000 B | 1.00% |
| **1** | 940.500 B | 49.500 B | 59.500 B | 5.95% |
| **2** | 893.475 B | 47.025 B | 106.525 B | 10.65% |
| **3** | 848.801 B | 44.674 B | 151.199 B | 15.12% |
| **4** | 806.361 B | 42.440 B | 193.639 B | 19.36% |
| **5** | 766.043 B | 40.318 B | 233.957 B | 23.40% |
| **6** | 727.741 B | 38.302 B | 272.259 B | 27.23% |
| **7** | 691.354 B | 36.387 B | 308.646 B | 30.86% |
| **8** | 656.786 B | 34.568 B | 343.214 B | 34.32% |
| **9** | 623.947 B | 32.839 B | 376.053 B | 37.61% |
| **10** | 592.749 B | 31.197 B | 407.251 B | 40.73% |

*Values rounded for readability.*

---

## 7. Long-Term Emission Curve

The emission rate continuously decreases because every release is calculated from a smaller locked balance.

**Approximate annual emissions:**

| Year | Annual Unlock |
| :--- | :--- |
| **1** | 49.50 B |
| **2** | 47.03 B |
| **3** | 44.67 B |
| **4** | 42.44 B |
| **5** | 40.32 B |
| **10** | 31.20 B |
| **20** | 18.68 B |
| **30** | 11.19 B |

This produces a naturally declining inflation profile without requiring governance intervention.

---

## 8. Supply Lifecycle

The PNJC supply follows four distinct phases.

### Phase I — Launch (Q2–Q3 2026)

- 1% circulating;
- 99% locked;
- Liquidity established (Uniswap V2);
- Community onboarding begins;
- MerkleAirdrop distribution;
- Vesting contracts activated.

---

### Phase II — Ecosystem Expansion (Q4 2026 – Q2 2027)

Locked tokens are gradually released for:
- Ecosystem incentives;
- Community rewards;
- Treasury operations (Operational Treasury);
- DAO funding (DAO Treasury);
- Partnerships.

Market supply grows in parallel with ecosystem adoption.

---

### Phase III — Governance & Impact (Q4 2026 – Q2 2027)

- DAO Governor launched (Q4 2026);
- ClownCare Bridge charity platform (Q2 2027);
- Community-driven treasury allocation;
- Transparent charitable distribution.

---

### Phase IV — Mature Economy (Q3 2027+)

- ONE+ Gaming Platform launched (Q3 2027);
- Annual unlocks continue to decline;
- Ecosystem approaches equilibrium;
- Optional user-driven burning reduces effective supply.

---

## 9. Deflation Offset (Optional Burn)

The circulating supply increases according to the vesting schedule.

However, the total supply may decrease due to **optional user-driven burning** via the `burn()` function.

**Effective Supply:**

```
Effective Supply = Total Supply − Burned Tokens
```

**Therefore:**
- Maximum Supply = 1 Trillion PNJC
- Effective Supply ≤ Maximum Supply

Over time, the effective supply may become significantly lower than the original cap if users choose to burn their tokens.

**Important:** Burning is **entirely optional** and **user-initiated**. There is no automatic burn tax on transactions.

---

## 10. Supply Security

The supply model is enforced entirely by immutable smart contracts.

**Security mechanisms include:**

| Mechanism | Description |
| :--- | :--- |
| **No Mint Functionality** | `mint()` function is absent. |
| **Immutable Token Contract** | Cannot be upgraded or modified. |
| **Ownerless Base Token** | `owner = address(0)` — no administrative control. |
| **Audited Vesting Contracts** | Independent audits (CertiK / Hacken). |
| **Immutable Liquidity Lock** | 12-month lock, no emergency withdrawal. |
| **Multisig Treasury Protection** | 3-of-5 multisig for Operational Treasury. |
| **DAO Governance After Launch** | Community-controlled treasury (Q4 2026). |
| **Fully On-Chain Transparency** | All transactions verifiable on PolygonScan. |

No centralised entity can arbitrarily increase the supply.

---

## 11. Economic Advantages

The PNJC Supply Model provides several long-term advantages:

| Advantage | Description |
| :--- | :--- |
| **Fixed Maximum Supply** | 1 trillion PNJC, no inflation. |
| **Zero Inflation Through Minting** | `mint()` function absent. |
| **Predictable Emissions** | 5% of remaining locked supply annually. |
| **Decreasing Annual Unlocks** | Emissions naturally decline over time. |
| **Reduced Sell Pressure** | Gradual, predictable releases. |
| **Transparent Vesting** | On-chain verification of vesting schedules. |
| **Mathematically Verifiable Schedule** | Formula-based release model. |
| **Gradual Decentralisation** | DAO governance (Q4 2026). |
| **Sustainable Treasury Funding** | Controlled releases for operations. |
| **Optional Deflation** | User-driven burning reduces supply. |
| **Gasless Approvals** | ERC20Permit reduces transaction costs. |

---

## 12. Mathematical Summary

| Parameter | Value |
| :--- | :--- |
| **Maximum Supply** | 1,000,000,000,000 PNJC |
| **Launch Circulation** | 1% |
| **Locked Supply** | 99% |
| **Annual Unlock** | 5% of Remaining Locked Balance |
| **Inflation via Minting** | 0% |
| **Deflation** | Optional User-Driven Burning |
| **Governance** | Multisig → DAO (Q4 2026) |

---

## 13. Integration with Supply Distribution

| Category | Share | Amount (PNJC) | Control Mechanism |
| :--- | :--- | :--- | :--- |
| **Liquidity Pool (Uniswap V2)** | 50% | 500,000,000,000 | Locked 12 months (no withdrawal) |
| **Operational Treasury** | 12% | 120,000,000,000 | 3/5 Multisig |
| **DAO Treasury** | 10% | 100,000,000,000 | DAO (Q4 2026) |
| **Team** | 10% | 100,000,000,000 | 6-month cliff + 12-month vesting |
| **Community** | 8% | 80,000,000,000 | Airdrops, campaigns |
| **Founder** | 5% | 50,000,000,000 | 12-month cliff + 24-month vesting |
| **Charity Reserve** | 5% | 50,000,000,000 | Public wallet |

---

## 14. Comparison: Original vs. Updated

| Parameter | Original (v1.0) | Updated (v1.1) |
| :--- | :--- | :--- |
| **Token Standard** | ERC-20 | ERC-20 + ERC20Burnable + ERC20Permit |
| **Burn Mechanism** | Implied | Optional, user-driven |
| **Burn Tax** | Not specified | 0% (no automatic burn) |
| **Contract Address** | Not specified | `0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF` |
| **Owner** | Not specified | None (ownerless) |
| **Deflation Mechanism** | Implied deflation | Optional user-driven burning |
| **Vesting** | General | Team: 6-month cliff + 12-month vesting; Founder: 12-month cliff + 24-month vesting |

---

## 15. Conclusion

The PNJC Supply Model combines a permanently fixed maximum supply with a declining emission schedule and optional user-driven deflationary mechanisms.

By limiting initial circulation, releasing tokens progressively, and allowing users to optionally reduce effective supply through burning, the model is designed to support sustainable ecosystem growth while preserving long-term token scarcity.

**The result** is a transparent, mathematically predictable, and on-chain verifiable supply framework that aligns incentives among users, developers, liquidity providers, and future governance participants.

---

## Disclaimer

This Supply Model describes the token supply framework and is provided for informational purposes only.

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
| **Document** | Supply Model |
| **Version** | 1.1 (Updated) |
| **Date** | July 25, 2026 |
| **Status** | Official |
| **Next Review** | After DAO launch (Q4 2026) |

---

© 2026 PanjoCoin (PNJC) / CryptoTengo. All rights reserved.  
**Document Version:** 1.1 (Updated)  
**Last Updated:** July 25, 2026
