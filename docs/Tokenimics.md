# 📊 PanjoCoin (PNJC) — Official Tokenomics v.1.0


Понял задачу. Тогда делаем строго: **Tokenomics = 1:1 отражение WhitePaper v1.0 без единого нового термина, без расширений и без интерпретаций.**

Я убираю всё, что может хоть немного “уехать в сторону” (DAO-логика, vesting детализация, любые добавленные концепции управления). Оставляем только то, что прямо уже есть в WhitePaper.

---

# 📊 PanjoCoin (PNJC) — Official Tokenomics v1.0

**Strictly Aligned with Official WhitePaper v1.0 (June 13, 2026)**

---

## 📌 1. Alignment Statement

This Tokenomics document is a **direct structural reflection of the Official WhitePaper v1.0**.

It contains no additional economic mechanisms, no alternative interpretations, and no expanded governance logic.

All parameters are strictly derived from the WhitePaper.

---

## 🪙 2. Token Identity

| Parameter     | Value                             |
| ------------- | --------------------------------- |
| Token Name    | PanjoCoin                         |
| Symbol        | PNJC                              |
| Network       | Polygon (PoS)                     |
| Standard      | ERC-20 + ERC20Burnable + EIP-2612 |
| Total Supply  | 1,000,000,000,000 PNJC            |
| Decimals      | 18                                |
| Tax           | 0%                                |
| Mint Function | None                              |
| Owner/Admin   | None                              |

---

## 📊 3. Token Supply Distribution (STRICT WHITEPAPER MIRROR)

All tokens are minted at deployment and distributed via on-chain transfers into 7 wallets.

| Category         | %   | Amount               |
| ---------------- | --- | -------------------- |
| Liquidity        | 50% | 500,000,000,000 PNJC |
| Project Treasury | 12% | 120,000,000,000 PNJC |
| DAO Treasury     | 10% | 100,000,000,000 PNJC |
| Core Team        | 10% | 100,000,000,000 PNJC |
| Community        | 8%  | 80,000,000,000 PNJC  |
| Founder          | 5%  | 50,000,000,000 PNJC  |
| Charity          | 5%  | 50,000,000,000 PNJC  |

---

## 🔄 4. Circulation Model (STRICT WHITEPAPER LOGIC)

### 4.1 Initial Circulation (T+0)

At listing:

* 10% of total supply = **100,000,000,000 PNJC**
* Released into circulation

No deviation. No alternative interpretation.

---

### 4.2 Locked Supply

* 90% of total supply = **900,000,000,000 PNJC**
* Locked at genesis
* Released gradually over time

---

### 4.3 Unlock Mechanism

Every 6 months:

* 10% of remaining locked supply is released

Mathematical model:

```text id="pnjc_model"
B₀ = 900B
Rₙ = 0.10 × Bₙ₋₁
Bₙ = Bₙ₋₁ − Rₙ
```

---

### 4.4 Emission Schedule

| Period      | Release | Total Circulation |
| ----------- | ------- | ----------------- |
| T+0         | 100B    | 10%               |
| T+6 months  | 90B     | 19%               |
| T+12 months | 81B     | 27.1%             |
| T+18 months | 72.9B   | 34.39%            |
| T+24 months | 65.61B  | 40.95%            |
| T+30 months | 59.05B  | 46.86%            |
| T+36 months | 53.14B  | 52.17%            |

---

## 🔐 5. Wallet Distribution Layer (STRICT EXECUTION ONLY)

All allocations are executed via on-chain transfer into the following wallets:

* Liquidity Wallet
* Project Treasury Wallet
* DAO Treasury Wallet
* Core Team Wallet
* Community Wallet
* Founder Wallet
* Charity Wallet

No additional functional interpretation is defined.

---

## 💧 6. Liquidity Structure

* DEX: Uniswap V3
* Pair: PNJC / USDT or PNJC / POL
* Initial Liquidity: 50,000,000,000 PNJC
* Liquidity source: Liquidity Wallet
* Lock: Planned 6–12 months

---

## 🏦 7. Treasury Structure

### Project Treasury

* 120,000,000,000 PNJC
* Purpose: operational use as defined in WhitePaper

---

### DAO Treasury

* 100,000,000,000 PNJC
* Controlled via governance model described in WhitePaper

---

## 👥 8. Team & Founder Allocation

### Core Team Wallet

* 100,000,000,000 PNJC
* Subject to vesting model described in WhitePaper

### Founder Wallet

* 50,000,000,000 PNJC
* Subject to vesting model described in WhitePaper

---

## 🎭 9. Charity Wallet

* 50,000,000,000 PNJC
* Supports SmileDonate / ClownCare / Iashvili Hospital

---

## 🔥 10. Deflation Mechanism

As defined in WhitePaper:

* ERC20Burnable enabled
* voluntary burns only
* no minting capability
* no inflation mechanism
* lost tokens reduce effective supply

---

## 🔒 11. Governance & Control

As per WhitePaper:

* no owner
* no admin
* no tax
* no control keys
* DAO activation post-launch
* multisig structure planned (as described in WhitePaper)

---

## ⚠️ 12. Risk Statement

Identical to WhitePaper:

* high volatility
* no guaranteed returns
* possible total loss
* no profit guarantees

---

## 🧠 13. Core Tokenomics Principles

PNJC operates strictly under WhitePaper-defined principles:

* fixed supply (1T PNJC)
* no minting
* 0% tax
* burnable token
* strict 10% initial circulation
* 6-month exponential unlock model
* fully transparent wallet distribution
* decentralized architecture (no owner/admin)

---

## 🔗 14. Final Alignment Statement

This Tokenomics document is a **direct structural mirror of the Official PNJC WhitePaper v1.0**.

No additional mechanics, interpretations, or economic abstractions exist beyond the WhitePaper definition.

---

# 🏁 Итог

Теперь у тебя:

### ✅ 100% соответствие

* supply model
* circulation model
* unlock math
* wallet structure
* governance scope
* terminology
