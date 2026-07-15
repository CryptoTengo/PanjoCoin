# PanjoCoin (PNJC) — Supply Model

**Version:** 1.0
**Date:** July 15, 2026
**Network:** Polygon PoS
**Token Standard:** ERC-20

---

# 1. Purpose

The PanjoCoin Supply Model defines how PNJC enters circulation throughout the lifetime of the ecosystem.

The model is designed to achieve five primary objectives:

* preserve long-term scarcity;
* provide predictable token availability;
* minimize inflationary pressure;
* reduce market volatility;
* align ecosystem growth with token circulation.

Unlike traditional cryptocurrencies with continuous emissions, PNJC uses a **Controlled Progressive Supply Model**, where almost the entire supply remains locked after launch and is released gradually according to predefined smart-contract rules.

---

# 2. Fixed Supply

The total supply of PNJC is permanently fixed.

| Parameter          |                  Value |
| ------------------ | ---------------------: |
| Maximum Supply     | 1,000,000,000,000 PNJC |
| Additional Minting |           Not Possible |
| Inflation Rate     |                     0% |
| Token Standard     |                 ERC-20 |
| Blockchain         |            Polygon PoS |

The token contract contains no mint functionality.

Once deployed, the maximum supply can never increase.

---

# 3. Initial Distribution

Immediately after deployment, the entire supply exists but almost all tokens remain locked.

| Allocation          |                 Amount |
| ------------------- | ---------------------: |
| Total Minted        | 1,000,000,000,000 PNJC |
| Initially Locked    |   990,000,000,000 PNJC |
| Initial Circulation |    10,000,000,000 PNJC |

**Initial Circulating Supply**

Only **1%** of the maximum supply is intended to circulate at launch.

This conservative approach significantly reduces early market dilution.

---

# 4. Controlled Release Model

Instead of unlocking a fixed number of tokens each year, PNJC follows an exponentially decreasing release schedule.

Each year:

> **5% of the remaining locked balance is released.**

This means yearly emissions naturally decrease over time.

Release Formula:

```
Released(year n)
=
Locked(year n−1) × 5%
```

Remaining Locked Supply:

```
Locked(year n)
=
Locked(year n−1) × 95%
```

Circulating Supply:

```
Circulating
=
Total Supply − Locked Supply
```

This creates a smooth supply curve without abrupt inflation.

---

# 5. Supply Projection

|   Year | Locked Supply | Released During Year | Circulating Supply | Circulating % |
| -----: | ------------: | -------------------: | -----------------: | ------------: |
| Launch |     990.000 B |                    — |           10.000 B |         1.00% |
|      1 |     940.500 B |             49.500 B |           59.500 B |         5.95% |
|      2 |     893.475 B |             47.025 B |          106.525 B |        10.65% |
|      3 |     848.801 B |             44.674 B |          151.199 B |        15.12% |
|      4 |     806.361 B |             42.440 B |          193.639 B |        19.36% |
|      5 |     766.043 B |             40.318 B |          233.957 B |        23.40% |
|      6 |     727.741 B |             38.302 B |          272.259 B |        27.23% |
|      7 |     691.354 B |             36.387 B |          308.646 B |        30.86% |
|      8 |     656.786 B |             34.568 B |          343.214 B |        34.32% |
|      9 |     623.947 B |             32.839 B |          376.053 B |        37.61% |
|     10 |     592.749 B |             31.197 B |          407.251 B |        40.73% |

*Values rounded for readability.*

---

# 6. Long-Term Emission Curve

The emission rate continuously decreases because every release is calculated from a smaller locked balance.

Approximate annual emissions:

| Year | Annual Unlock |
| ---: | ------------: |
|    1 |       49.50 B |
|    2 |       47.03 B |
|    3 |       44.67 B |
|    4 |       42.44 B |
|    5 |       40.32 B |
|   10 |       31.20 B |
|   20 |       18.68 B |
|   30 |       11.19 B |

This produces a naturally declining inflation profile without requiring governance intervention.

---

# 7. Supply Lifecycle

The PNJC supply follows four distinct phases.

## Phase I — Launch

* 1% circulating
* 99% locked
* liquidity established
* community onboarding begins

---

## Phase II — Ecosystem Expansion

Locked tokens are gradually released for:

* ecosystem incentives;
* community rewards;
* treasury operations;
* DAO funding;
* partnerships.

Market supply grows in parallel with ecosystem adoption.

---

## Phase III — Deflation

The GoldenPhoenix Protocol introduces:

* USDT-funded buybacks;
* permanent token burns;
* insurance reserve accumulation;
* optional staking rewards.

At this stage, token destruction begins to offset scheduled releases.

---

## Phase IV — Mature Economy

As annual unlocks decline, the ecosystem approaches equilibrium where:

Annual Burns ≈ Annual Unlocks

Eventually:

Annual Burns > Annual Unlocks

creating sustained net deflation.

---

# 8. Deflation Offset

The circulating supply increases according to the vesting schedule.

However, the total supply may decrease due to permanent burns.

Effective Supply:

```
Effective Supply
=
Total Supply
− Burned Tokens
```

Therefore:

* Maximum Supply = 1 Trillion PNJC
* Effective Supply ≤ Maximum Supply

Over time, the effective supply is expected to become significantly lower than the original cap.

---

# 9. Supply Security

The supply model is enforced entirely by immutable smart contracts.

Security mechanisms include:

* no mint functionality;
* immutable token contract;
* ownerless base token;
* audited vesting contracts;
* immutable liquidity lock;
* multisig treasury protection;
* DAO governance after launch;
* fully on-chain transparency.

No centralized entity can arbitrarily increase the supply.

---

# 10. Economic Advantages

The PNJC Supply Model provides several long-term advantages:

* fixed maximum supply;
* zero inflation through minting;
* predictable emissions;
* decreasing annual unlocks;
* reduced sell pressure;
* transparent vesting;
* mathematically verifiable release schedule;
* gradual decentralization;
* sustainable treasury funding;
* compatibility with future buyback-and-burn mechanisms.

---

# 11. Mathematical Summary

Maximum Supply:

```
1,000,000,000,000 PNJC
```

Launch Circulation:

```
1%
```

Locked Supply:

```
99%
```

Annual Unlock:

```
5% of Remaining Locked Balance
```

Inflation via Minting:

```
0%
```

Deflation:

```
Buyback + Permanent Burn
```

Governance:

```
DAO Controlled
```

---

# 12. Conclusion

The PNJC Supply Model combines a permanently fixed maximum supply with a declining emission schedule and future deflationary mechanisms. By limiting initial circulation, releasing tokens progressively, and reducing effective supply through buybacks and burns, the model is designed to support sustainable ecosystem growth while preserving long-term token scarcity.

The result is a transparent, mathematically predictable, and on-chain verifiable supply framework that aligns incentives among users, developers, liquidity providers, and future governance participants.
