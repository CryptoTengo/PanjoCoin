# 📊 PanjoCoin (PNJC) — Official Tokenomics v.1.0

**Version 1.0 | June 13, 2026**

*Full compliance with smart contract and Whitepaper v.1.0*

*🐕 Official token of Panjo the Shar Pei in support of SmileDonate (ClownCare)*

---

## 📋 Executive Summary of Tokenomics

PanjoCoin (PNJC) tokenomics represents a **scarcity-driven deflationary model**, fully compliant with the smart contract architecture. The contract implements a pure ERC-20 token with fixed supply, no mint function, no owner (ownership model intentionally excluded by design), with EIP-2612 (Permit) support and burn mechanism.

| Principle | Contract Implementation | Advantage |
| :--- | :--- | :--- |
| **Scarcity** | `_MAX_TOTAL_SUPPLY = 1T`, no `mint()` | Inflation protection |
| **Trustless** | No `Ownable`, no `owner()`. Fixed supply, no admin functions | No centralized control |
| **0% Tax** | No fee mechanisms | Maximum liquidity |
| **Burnable** | `ERC20Burnable` | Deflationary mechanism |
| **EIP-2612** | `ERC20Permit` | Gasless approvals |

---

## 🪙 1. Token Parameters (from Smart Contract)

### 1.1. Technical Specifications

| Parameter | Value | Source in Contract |
| :--- | :--- | :--- |
| **Token Name** | PanjoCoin | `ERC20("PanjoCoin", "PNJC")` |
| **Ticker** | PNJC | `ERC20("PanjoCoin", "PNJC")` |
| **Network** | Polygon (PoS) | Whitepaper |
| **Standard** | ERC-20 + EIP-2612 + ERC20Burnable | `ERC20Permit`, `ERC20Burnable` |
| **Total Supply** | 1,000,000,000,000 PNJC | `_MAX_TOTAL_SUPPLY = 1_000_000_000_000 * 10**18` |
| **Decimals** | 18 | ERC-20 standard |
| **Mint Function** | :x: Absent | No `mint()` function |
| **Ownership** | :x: Absent | No `Ownable` import |
| **Burn Function** | :white_check_mark: Available | `ERC20Burnable` |
| **Permit (Gasless Approve)** | :white_check_mark: Supported | `ERC20Permit` |

### 1.2. Key Code Constants

```solidity
// FROM SMART CONTRACT (PNJC.sol):
uint256 private constant _MAX_TOTAL_SUPPLY = 1_000_000_000_000 * 10**18;
// Means: 1,000,000,000,000 PNJC (one trillion)
```

### 1.3. Trading Infrastructure

| Parameter | Value |
| :--- | :--- |
| **Primary DEX** | Uniswap V3 |
| **Trading Pair** | PNJC / USDT (or PNJC / POL) |
| **CEX Listing** | :x: Not planned |
| **Data Aggregators** | CoinGecko, CoinMarketCap (post-listing) |

---

## 📊 2. Token Distribution (On-Chain, Post-Deployment)

### 2.1. Important Note on Architecture

**Architectural decision:** The PNJC smart contract is a **pure ERC-20 token** and contains **no built-in** distribution, vesting, or locking mechanisms. All tokens (1 trillion PNJC) were minted to the `initialOwner` address at deployment. Distribution was then performed **off-contract** through separate transactions to 7 public wallets. The deployer address now holds **0 PNJC**.

### 2.2. Target Distribution Structure (7 Wallets)

| # | Sector | Share | Amount (PNJC) | Wallet Address (Polygon) | Implementation Mechanism |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | **Liquidity (DEX)** | 50% | 500,000,000,000 | `0xf55B994FDD7019d8E99c632c76A6e0AdE765988A` | LP transfer + Lock via Unicrypt/PinkSale (planned) |
| 2 | **Project Treasury** | 12% | 120,000,000,000 | `0xD539a54f54e9B174F831D9Da6b48ac15441fC581` | Multisig 3/5 via Gnosis Safe (planned) |
| 3 | **DAO Treasury** | 10% | 100,000,000,000 | `0xD5e2DD65BA4984565b53EFdcec6A9D2F494b5FE2` | Multisig + Snapshot Governance (planned) |
| 4 | **Core Team** | 10% | 100,000,000,000 | `0xdEBACbF7f51C3865dc2034ED676D3d344954f9FE` | Separate Vesting contract (planned) |
| 5 | **Community & Growth** | 8% | 80,000,000,000 | `0x54D3beB9e0F473803cC7a972Db2C17f005a2D089` | Merkle Tree Airdrop + Reward Pool (planned) |
| 6 | **Founder (Tengo)** | 5% | 50,000,000,000 | `0xF48840486697AE3c15D38E30e45cECB9897CfA74` | Separate Vesting contract (planned) |
| 7 | **Charity Reserve (SmileDonate)** | 5% | 50,000,000,000 | `0xa22E471BF4e405c92bDD074792d8d36923e31055` | Public wallet, charity-only transfers |
| | **TOTAL** | **100%** | **1,000,000,000,000** | | **All wallets public and verified on-chain** |

### 2.3. Distribution Visualization

```
┌─────────────────────────────────────────────────────────────────┐
│                    PNJC TOTAL SUPPLY: 1T                        │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ████████████████████████████████████████████  50% Liquidity    │
│  ████████████████████████                      12% Treasury     │
│  ████████████████████                          10% Core Team    │
│  ████████████████████                          10% DAO Treasury │
│  ████████                                       8% Community    │
│  ██████████                                     5% Founder      │
│  ██████████                                     5% Charity      │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

> :white_check_mark: **All addresses are verified. Distribution transactions are confirmed on-chain. Every PNJC holder can check any wallet's balance in real time via PolygonScan. The deployer address holds 0 PNJC.**

---

## 🔄 3. Staged Market Release Mechanism

### 3.1. Core Principle

At the time of listing (T+0), only **10% of total supply** (100 billion PNJC) is in free circulation.  
Every **6 months thereafter**, an additional **10% of the remaining locked supply** is released to the market.

### 3.2. Calculation Formula

Let:
- S_total = 1,000,000,000,000 PNJC
- R_0 = 0.10 × S_total = 100,000,000,000 PNJC (initial release)
- B_0 = S_total - R_0 = 900,000,000,000 PNJC (initially locked)

Every 6 months:

```
R_n = 0.10 × B_n-1
B_n = B_n-1 - R_n
```

### 3.3. Release Schedule (First 3 Years)

| Period | Market Release | Cumulative Release | Remaining Locked |
| :--- | :--- | :--- | :--- |
| **T+0 (Listing)** | 100B (10%) | 100B (10%) | 900B (90%) |
| **T+6 months** | 90B (9% of total) | 190B (19%) | 810B (81%) |
| **T+12 months** | 81B (8.1%) | 271B (27.1%) | 729B (72.9%) |
| **T+18 months** | 72.9B (7.29%) | 343.9B (34.39%) | 656.1B (65.61%) |
| **T+24 months** | 65.61B (6.56%) | 409.51B (40.95%) | 590.49B (59.05%) |
| **T+30 months** | 59.05B (5.90%) | 468.56B (46.86%) | 531.44B (53.14%) |
| **T+36 months** | 53.14B (5.31%) | 521.70B (52.17%) | 478.30B (47.83%) |

### 3.4. Advantages of This Model

| Advantage | Description |
| :--- | :--- |
| **No dump at listing** | Only 10% of supply on the market initially |
| **Predictability** | Anyone can calculate the schedule |
| **Exponential deceleration** | Each subsequent release is smaller |
| **Team alignment** | Team and Founder follow the same schedule |

---

## 🔒 4. Investor Protection Mechanisms

### 4.1. Liquidity Lock (Planned)

| Parameter | Value |
| :--- | :--- |
| **Wallet** | `0xf55B994FDD7019d8E99c632c76A6e0AdE765988A` |
| **Volume** | 500,000,000,000 PNJC (50% of supply) |
| **Initial LP Release** | 50 billion (10% of Liquidity Wallet) |
| **Lock Platform** | Unicrypt / PinkSale |
| **Lock Duration** | 6–12 months from DEX launch |
| **Status** | :hourglass: Planned — to be executed at DEX launch |

> :white_check_mark: **Value to investors:** Once locked, liquidity remains on DEX regardless of any individual wallet compromises. Combined with transparent on-chain distribution and deployer address holding 0 tokens, this provides multi-layered protection.

### 4.2. Vesting Schedule (Core Team + Founder)

| Parameter | Value |
| :--- | :--- |
| **Wallets** | Core Team (`0xdEBACbF7...`) + Founder (`0xF4884048...`) |
| **Total Volume** | 150,000,000,000 PNJC (15%) |
| **Contract Type** | Separate Vesting smart contract (planned) |
| **Initial Release** | 0 PNJC (fully locked) |
| **Cliff Period** | 6 months |
| **Release Schedule** | Follows global schedule (every 6 months +10% of remaining) |
| **Status** | :hourglass: Planned — to be implemented before or at DEX launch |

**Team + Founder Unlock Schedule:**

| Period | Event | Unlocked (Cumulative) |
| :--- | :--- | :--- |
| **Months 0–6** | Cliff (full lock) | 0% |
| **Month 6** | First release (~10% of remaining) | ~15 billion |
| **Month 12** | Second release (~10% of new remaining) | ~28.5 billion |
| **Month 18** | Third release | ~40.7 billion |
| **Month 24+** | Continues following global schedule | Exponential decay |

> :warning: **Important:** Team and Founder vesting follows the same global staged release schedule (10% of remaining every 6 months). This ensures long-term alignment with the project. Full unlock takes many years due to exponential decay.

> :white_check_mark: **Value to investors:** The team cannot "dump" tokens after listing. Their financial incentive is tied to the project's long-term success. No tokens are unlocked during the first 6 months.

### 4.3. Multisig Treasury Management (Planned)

| Parameter | Value |
| :--- | :--- |
| **Wallets** | Project Treasury (`0xD539a54f...`) + DAO Treasury (`0xD5e2DD65...`) |
| **Platform** | Gnosis Safe (Safe.global) |
| **Signature Type** | Multisig 3/5 |
| **Signers** | 5 trusted individuals from different jurisdictions |
| **Required for Transaction** | 3 out of 5 signatures |
| **Status** | :hourglass: Planned — to be configured |

> :white_check_mark: **Value to investors:** Once implemented, compromising one private key will not lead to treasury fund theft.

### 4.4. Charity Reserve Transparency

| Parameter | Value |
| :--- | :--- |
| **Wallet** | `0xa22E471BF4e405c92bDD074792d8d36923e31055` |
| **Volume** | 50,000,000,000 PNJC (5%) |
| **Wallet Type** | Public, charity-only transfers |
| **Verification** | Every transaction tagged on PolygonScan |
| **Recipient** | SmileDonate Foundation |
| **Purpose** | ClownCare program at M. Iashvili Central Children's Hospital (3rd floor, Oncology-Hematology and Neurosurgery wards) |
| **Automation** | No automated on-chain donation logic currently exists |

> :white_check_mark: **Value to investors:** Every PNJC holder can verify in real time how much has been sent to charity and where.

### 4.5. DAO Treasury Governance Lock (Planned)

| Parameter | Value |
| :--- | :--- |
| **Wallet** | `0xD5e2DD65BA4984565b53EFdcec6A9D2F494b5FE2` |
| **Volume** | 100,000,000,000 PNJC (10%) |
| **Access** | Only via Snapshot DAO voting |
| **Spending Requirement** | Quorum + community approval |
| **Status** | :lock: Locked until DAO activation |

> :white_check_mark: **Value to investors:** The community controls 10% of supply. The team cannot use these funds without PNJC holders' consent.

### 4.6. Current Protection Summary

| Protection Layer | Status | Description |
| :--- | :--- | :--- |
| **Contract-level** | :white_check_mark: LIVE | No `owner()`, no `mint()`, no admin functions |
| **Distribution** | :white_check_mark: COMPLETE | 100% supply distributed to 7 public wallets |
| **Deployer balance** | :white_check_mark: ZERO | Deployer address holds 0 PNJC |
| **Liquidity lock** | :hourglass: Planned | Via Unicrypt/PinkSale at DEX launch |
| **Team vesting** | :hourglass: Planned | Separate vesting contract |
| **Multisig treasury** | :hourglass: Planned | Gnosis Safe 3/5 |
| **DAO governance** | :hourglass: Planned | Snapshot + on-chain voting |

> :warning: **Important:** All "Planned" mechanisms will be confirmed via on-chain transactions when executed. Until then, protection relies on the contract architecture and transparent distribution.

---

## 🔥 5. Deflationary Mechanisms

### 5.1. Burnable Function

The PNJC smart contract inherits `ERC20Burnable`, meaning:

```solidity
// Holders can burn their own tokens:
function burn(uint256 amount) external;
function burnFrom(address account, uint256 amount) external;
```

| Aspect | Description |
| :--- | :--- |
| **Who can burn** | Any token holder |
| **How to burn** | Call `burn(amount)` or `burnFrom()` |
| **Effect** | Tokens are permanently removed from circulation |
| **Impact on supply** | Total supply decreases (deflation) |

### 5.2. Sources of Deflation

| Factor | Effect |
| :--- | :--- |
| **Fixed supply** | Supply is hard-capped at 1 trillion |
| **Burnable function** | Holders can voluntarily burn tokens |
| **Token loss** | Tokens on "dead" wallets (lost access) |

### 5.3. Absence of Inflationary Mechanisms

| What is NOT in the contract | Why this matters |
| :--- | :--- |
| :x: **Mint function** | Additional issuance impossible |
| :x: **Ownable** | No admin to change rules |
| :x: **Transaction taxes** | 100% of tokens reach the wallet |
| :x: **Rebase mechanism** | No balance manipulation |
| :x: **Inflationary staking** | No dilution of holder share |

---

## 💧 6. Liquidity Model

### 6.1. Uniswap V3 Pool Configuration

| Parameter | Value |
| :--- | :--- |
| **DEX** | Uniswap V3 |
| **Trading Pair** | PNJC / USDT (or PNJC / POL) |
| **Initial Liquidity** | 50 billion PNJC + equivalent in stablecoins from Treasury |
| **Fee Tier** | 0.05% or 0.30% |
| **Lock** | 6–12 months via Unicrypt/PinkSale |
| **Status** | :hourglass: Planned — to be executed at DEX launch |

### 6.2. Liquidity Maintenance Strategy

| Stage | Action |
| :--- | :--- |
| **Launch** | Add 50 billion PNJC + USDT to Uniswap V3 |
| **Lock** | LP tokens locked for 6–12 months |
| **Support** | Treasury adds unilateral liquidity if needed |
| **Expansion** | Add new price ranges as market cap grows |

---

## 🏦 7. Treasury Management

### 7.1. Project Treasury Structure (120 billion PNJC)

| Use | Share of Treasury | Purpose |
| :--- | :--- | :--- |
| **Marketing** | 40% | Influencers, ads, contests, meme campaigns |
| **Development** | 30% | Developer contracts, audits, hosting |
| **Legal Expenses** | 10% | Registration, consultations, compliance |
| **Additional Liquidity** | 10% | Support for Uniswap pools |
| **Reserve** | 10% | Contingency expenses |

### 7.2. Treasury Spending Principles

| Principle | Description |
| :--- | :--- |
| **Transparency** | All Treasury transactions are public (via Multisig) |
| **Minimization** | Expenses only for critical priorities |
| **Decentralization priority** | Maximum use of DAO for major expenditures |
| **Long-term focus** | Treasury balances converted to stablecoins when necessary |

---

## 📊 8. Token Circulation Model

### 8.1. Initial Circulation (at Listing, T+0)

| Component | Volume (PNJC) | % of Supply | In Circulation? |
| :--- | :--- | :--- | :--- |
| **Liquidity (Uniswap) — initial portion** | 50B | 5% | :white_check_mark: Yes |
| **Airdrop** | 50B | 5% | :white_check_mark: Yes (after claim) |
| **Community Pool — initial portion** | 10B | 1% | :white_check_mark: Partially |
| **Project Treasury — initial portion** | 20B | 2% | :white_check_mark: Partially |
| **Total in circulation** | **~130B** | **~13%** | — |

> :information_source: **Note:** Technically, initial circulation is approximately 10-13% of total supply. The remaining 87-90% is subject to staged release or lock mechanisms.

### 8.2. Locked/Controlled Tokens (First 6 Months)

| Component | Volume (PNJC) | % of Supply | Status |
| :--- | :--- | :--- | :--- |
| **Liquidity Wallet (remainder)** | 450B | 45% | Staged release + planned lock |
| **Project Treasury (remainder)** | 100B | 10% | Planned multisig + staged release |
| **DAO Treasury** | 100B | 10% | Governance lock until DAO activation |
| **Core Team** | 100B | 10% | Planned vesting (Cliff 6 months) |
| **Founder** | 50B | 5% | Planned vesting (Cliff 6 months) |
| **Charity Reserve** | 50B | 5% | Allocated, not sold, charity use |
| **Community & Growth (remainder)** | 70B | 7% | Staged distribution |
| **Total controlled** | **~870-900B** | **~87-90%** | |

---

## 📈 9. Key Tokenomics Metrics

### 9.1. Core Metrics

| Metric | Value |
| :--- | :--- |
| **Total Supply** | 1,000,000,000,000 PNJC |
| **Decimals** | 18 |
| **Initial Circulating Supply** | ~10-13% of supply |
| **Team + Founder Allocation** | 15% (subject to planned vesting) |
| **Liquidity Allocation** | 50% |
| **Community + DAO Control** | 18% (8% Community + 10% DAO Treasury) |
| **Charity Allocation** | 5% (public SmileDonate wallet) |

### 9.2. Risks and Mitigation

| Risk | Probability | Mitigation |
| :--- | :--- | :--- |
| **Market volatility** | High | 0% Tax allows fast entry/exit |
| **Concentration at deployer** | :x: Eliminated | Deployer holds 0 PNJC; distribution complete |
| **Manipulation by large holders** | Medium | 50% of supply allocated to liquidity |
| **Loss of community interest** | Medium | Social mission (SmileDonate + ClownCare) retains audience |
| **Technical vulnerabilities** | Low | OpenZeppelin 5.0.2 + code verification |
| **Regulatory restrictions** | Low | Full decentralization (no owner) |
| **Delayed protection mechanisms** | Medium | Transparent status tracking; all planned mechanisms verifiable on-chain when executed |

---

## ⚖️ 10. Legal Aspects of Tokenomics

| Aspect | Status | Comment |
| :--- | :--- | :--- |
| **Token Status** | Utility / Meme Token | Not a security |
| **Howey Test Analysis** | Does not pass | No expectation of profit from third-party efforts |
| **Ownership** | :x: Absent | Full decentralization |
| **Registration** | Not required | No administrator |
| **Taxation** | User responsibility | Each holder declares independently |
| **Charity Status** | Independent SmileDonate foundation | Donations are not tax-deductible for holders |

---

## 🔗 11. Smart Contract Verification

### 11.1. Contract Information

| Parameter | Value |
| :--- | :--- |
| **Contract Address** | `0x781C0d15347Cb0B94C42C65c7a67E70371205De5` |
| **Network** | Polygon (PoS) |
| **Compiler** | Solidity 0.8.34 |
| **License** | MIT |
| **Verification** | PolygonScan (fully verified) |

### 11.2. Key Contract Functions

```solidity
// Callable functions:
totalSupply()       // Total supply (always 1T)
balanceOf()         // Wallet balance
transfer()          // Transfer tokens
approve()           // Approval for spending
permit()            // EIP-2612 gasless approval
burn()              // Burn tokens
burnFrom()          // Burn from allowance
maxSupply()         // Returns 1T (constant)
```

---

## ✅ 12. Compliance Summary

| Parameter | Contract Implementation | Status |
| :--- | :--- | :--- |
| **Total supply 1 trillion** | `_MAX_TOTAL_SUPPLY = 1T` | :white_check_mark: |
| **No `mint()`** | No `mint` function | :white_check_mark: |
| **No owner** | No `Ownable`, no `owner()` | :white_check_mark: |
| **0% Tax** | No fee mechanisms | :white_check_mark: |
| **EIP-2612 Permit** | `ERC20Permit` | :white_check_mark: |
| **Burnable** | `ERC20Burnable` | :white_check_mark: |
| **Distribution (7 wallets)** | Off-contract (from `initialOwner`) | :white_check_mark: Complete |
| **Deployer balance** | 0 PNJC | :white_check_mark: Verified |
| **Liquidity Lock** | Off-contract (Unicrypt/PinkSale) | :hourglass: Planned |
| **Vesting (Team + Founder)** | Off-contract | :hourglass: Planned |
| **Multisig Treasury** | Off-contract (Gnosis Safe) | :hourglass: Planned |
| **Charity Reserve** | Off-contract (public wallet) | :white_check_mark: Active |

---

## 🏁 13. Conclusion

The PanjoCoin (PNJC) tokenomics **fully complies with the smart contract**, which:

| # | Feature | Status |
| :--- | :--- | :--- |
| 1 | Fixed supply of 1 trillion tokens | :white_check_mark: |
| 2 | No `mint()` function (no new tokens can be created) | :white_check_mark: |
| 3 | No owner (ownership model intentionally excluded) — full decentralization | :white_check_mark: |
| 4 | EIP-2612 (Permit) for gasless approvals | :white_check_mark: |
| 5 | Burnable mechanism (holders can burn tokens) | :white_check_mark: |
| 6 | 0% Tax on transactions | :white_check_mark: |

**Key architectural decision:** Token distribution (Liquidity, Treasury, Team, Founder, DAO, Airdrop, Charity, Community) and protection mechanisms (Liquidity Lock, Vesting, Multisig) are implemented **off-contract** through separate transactions, specialized services, and contracts — which is a standard and safe practice for ERC-20 tokens.

**Current status:** Distribution is complete and verified on-chain. Protection mechanisms are at the planning stage and will be confirmed via on-chain transactions when executed.

---

## 📊 14. Final Tokenomics Score

| # | Criterion | Max Score | Score | Justification |
| :--- | :--- | :--- | :--- | :--- |
| 1 | Fixed supply / No Mint | 10 | 10 | :white_check_mark: |
| 2 | Ownership model excluded | 10 | 10 | :white_check_mark: |
| 3 | 0% Tax on transactions | 10 | 10 | :white_check_mark: |
| 4 | EIP-2612 (Permit) | 10 | 10 | :white_check_mark: |
| 5 | Burnable mechanism | 10 | 10 | :white_check_mark: |
| 6 | Liquidity Lock (50%, planned) | 10 | 8 | :hourglass: Planned, not yet executed |
| 7 | Vesting Team + Founder (planned) | 10 | 8 | :hourglass: Planned, not yet executed |
| 8 | Multisig Treasury (3/5, planned) | 10 | 8 | :hourglass: Planned, not yet executed |
| 9 | Transparent charity (5%) | 10 | 10 | :white_check_mark: Wallet active, on-chain transparent |
| 10 | Staged market release (10% → +10%) | 10 | 10 | :white_check_mark: |
| 11 | Public wallets (7 addresses, verified) | 10 | 10 | :white_check_mark: Distribution confirmed on-chain |
| 12 | DAO control (10%) | 10 | 8 | :hourglass: Planned, not yet active |
| 13 | Deflationary model | 10 | 10 | :white_check_mark: |
| 14 | Whitepaper & code compliance | 10 | 10 | :white_check_mark: |
| 15 | Documentation & transparency | 10 | 10 | :white_check_mark: |
| **TOTAL** | | **150** | **142** | |

**FINAL SCORE: 142 / 150 → 95 / 100**

> :information_source: **Note on scoring:** The 5-point deduction reflects that key investor protection mechanisms (liquidity lock, vesting, multisig) are currently at the planning stage. Score will reach 150/150 when these mechanisms are implemented and verified on-chain.

---

## 🔗 15. Official Links

| Resource | Link |
| :--- | :--- |
| **Smart Contract (PNJC)** | `0x781C0d15347Cb0B94C42C65c7a67E70371205De5` |
| **Liquidity Wallet** | `0xf55B994FDD7019d8E99c632c76A6e0AdE765988A` |
| **Project Treasury** | `0xD539a54f54e9B174F831D9Da6b48ac15441fC581` |
| **DAO Treasury** | `0xD5e2DD65BA4984565b53EFdcec6A9D2F494b5FE2` |
| **Core Team** | `0xdEBACbF7f51C3865dc2034ED676D3d344954f9FE` |
| **Community & Growth** | `0x54D3beB9e0F473803cC7a972Db2C17f005a2D089` |
| **Founder (Tengo)** | `0xF48840486697AE3c15D38E30e45cECB9897CfA74` |
| **Charity Reserve (SmileDonate)** | `0xa22E471BF4e405c92bDD074792d8d36923e31055` |
| **Network** | Polygon (PoS) |
| **DEX** | Uniswap V3 |
| **GitHub** | [github.com/CryptoTengo/PanjoCoin](https://github.com/CryptoTengo/PanjoCoin) |
| **Twitter (X)** | [@CryptoTengo](https://x.com/CryptoTengo) |
| **Discord** | [Invite Link](https://discord.com/channels/1337364200254738454/1337364201588654093) |

---

*"PanjoCoin (PNJC) Tokenomics v.10.0" document fully complies with the smart contract and Whitepaper v.10.0.*

*All planned mechanisms will be confirmed via on-chain transactions when executed.*

*🐕 Panjo the Shar Pei | 🏥 Iashvili Hospital, 3rd floor | 🎭 ClownCare by SmileDonate*
