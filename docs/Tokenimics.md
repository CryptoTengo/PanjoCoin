# 📊 PANJOCOIN (PNJC) — TOKENOMICS (UNIFIED VERSION 1.0)

**Date:** July 4, 2026  
________________________________________

## 1. GENERAL PARAMETERS

| Parameter | Value |
|-----------|-------|
| **Name** | PanjoCoin |
| **Ticker** | PNJC |
| **Blockchain** | Polygon PoS |
| **Standard** | ERC‑20 + EIP‑2612 (Permit) + ERC‑20 Burnable |
| **Total Supply** | 1,000,000,000,000 PNJC (1 trillion) — fixed, no additional minting |
| **Decimals** | 18 |
| **Contract Owner** | Renounced (administrative rights revoked permanently) |
| **Transaction Tax** | 0% |
| **Upgradeability** | None (immutable code) |
| **Blacklists / Freeze** | None |
| **Contract Address** | `0x781C0d15347Cb0B94C42C65c7a67E70371205De5` |

________________________________________

## 2. TOKEN DISTRIBUTION

The total supply is allocated across the following categories:

| Category | % | Amount (PNJC) | Purpose |
|----------|---|---------------|---------|
| 💧 **Liquidity (DEX)** | 50% | 500,000,000,000 | Providing liquidity on QuickSwap V2 (70%) and Uniswap V3 (30%). All LP tokens belonging to the project are locked for 12 months via the `PNJCLiquidityLocker` smart contract (address to be published post‑deployment in official channels). |
| 🏦 **Project Treasury** | 12% | 120,000,000,000 | Funds for ecosystem development, marketing, legal support, future security audits, CEX listings, and operational expenses. Managed by a 3/5 multisig via `PNJCTreasuryVault`. |
| 👨‍💻 **Team** | 10% | 100,000,000,000 | Compensation for the development team and key contributors. Vesting: 6‑month cliff, followed by linear unlock over 12 months (1/12 monthly) via `PNJCVestingVault`. |
| 🗳️ **DAO Treasury** | 10% | 100,000,000,000 | Funds fully controlled by PNJC holders through DAO votes. Used for grants, partnerships, community initiatives, and emergency needs. Managed via a 3/5 multisig. |
| 👤 **Founder** | 5% | 50,000,000,000 | Founder compensation. Vesting: 6‑month cliff, followed by linear unlock over 12 months (1/12 monthly) via `PNJCVestingVault`. |
| 🎁 **Airdrop** | 5% | 50,000,000,000 | Attracting early users via a Merkle drop (`PNJCMerkleAirdrop`). Unclaimed tokens are burned after 3 months. |
| ❤️ **Charity Reserve** | 5% | 50,000,000,000 | Donations to verified charitable organisations (e.g., ClownCare). Organisation selection and amounts are determined by the DAO. All transactions are public via `PNJCTreasuryVault`. |
| 🏅 **Community Rewards** | 3% | 30,000,000,000 | Incentives for participation in Proof of Kindness, Social Mining, Kindness Challenges, and other activities. Monthly budget is fixed; unused rewards are burned. Managed via the `PNJC_GoldenPhoenixProtocol` (rewards pool). |

**Sum Check:** 50+12+10+10+5+5+5+3 = 100%

________________________________________

## 3. VESTING MECHANISM

A unified vesting schedule applies to team and founder tokens via the `PNJCVestingVault` contract:

- **Cliff:** 6 months — tokens are not unlocked during this period.
- **Vesting Period:** 12 months after the cliff ends.
- **Unlock Schedule:** Linear, with equal monthly instalments (1/12 of the total vesting allocation).
- **Features:** The contract has no owner functions and cannot be paused or modified. Only the beneficiary can call `claim()`.

All vesting contracts are public and verified on PolygonScan.

________________________________________

## 4. DEFLATIONARY MECHANISM — GOLDEN PHOENIX PROTOCOL

The Golden Phoenix Protocol (`PNJC_GoldenPhoenixProtocol`) automatically creates deflationary pressure through external USDT inflows (revenues from partners, NFT marketplace, voluntary contributions). The protocol is governed by a multisig (3/5) and the DAO.

### 4.1 Full Operational Algorithm

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                        GOLDEN PHOENIX PROTOCOL                             │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  1️⃣ USDT Inflow (partners, revenues, contributions)                        │
│                  │                                                          │
│                  ▼                                                          │
│  2️⃣ Reserve 5% → Insurance Fund (insurancePercent)                        │
│                  │                                                          │
│                  ▼                                                          │
│  3️⃣ Remaining 95% USDT                                                     │
│                  │                                                          │
│     ┌────────────┴────────────┐                                            │
│     │                         │                                            │
│     ▼                         ▼                                            │
│  25% for buyback         75% accumulated                                   │
│  (buybackPercent)        (on contract balance)                             │
│     │                                                                       │
│     ▼                                                                       │
│  4️⃣ Convert USDT → PNJC via QuickSwap V2                                  │
│     │                                                                       │
│     ▼                                                                       │
│  5️⃣ 50% BURNED (burnPercent)                                               │
│     │                                                                       │
│     ▼                                                                       │
│  6️⃣ 50% → Community Rewards Pool (rewardPercent)                           │
│                                                                             │
│  🔄 Cycle repeats upon new USDT inflows                                    │
│                                                                             │
│  🛡️ If price drops below price floor → Insurance Fund activation           │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 4.2 Detailed Step Description

**Step 1. USDT Inflow**
- USDT is received at the protocol address from external sources:
  - Partner fees (e.g., from integrations).
  - NFT marketplace revenues.
  - Voluntary contributions from participants.
  - A portion of ecosystem revenues.

**Step 2. Insurance Fund Reservation (`insurancePercent`)**
- 5% of the received USDT amount is directed to the Insurance Fund.
- **Purpose:** price protection when the price falls below the established level (price floor).
- The parameter is DAO‑adjustable within the range of 3–10%.

**Step 3. Buyback Amount Calculation (`buybackPercent`)**
- After reserving the Insurance Fund, the remaining 95% of USDT is distributed as follows:
  - `buybackPercent` (default 25%) of the remaining amount is allocated to buy back tokens via DEX.
  - The remaining funds are accumulated on the contract balance for future cycles.
- The parameter is DAO‑adjustable within the range of 15–35%.
- **Important:** `insurancePercent + buybackPercent == 30` (smart‑contract constraint).

**Step 4. Conversion to PNJC**
- The amount determined in Step 3 is converted to PNJC via the QuickSwap V2 Router.
- Swap path: USDT → WMATIC → PNJC.
- Maximum slippage is respected (`maxSlippageBps`, default 300 bps = 3%).
- The contract uses `forceApprove` and `swapExactTokensForTokens` for secure swapping.

**Step 5. Burning (`burnPercent`)**
- 50% of the purchased tokens are permanently burned.
- If the `burn()` function is unavailable, tokens are sent to the dead address.
- The parameter is DAO‑adjustable within the range of 30–70%.

**Step 6. Community Rewards (`rewardPercent`)**
- The remaining 50% of purchased tokens are sent to the community rewards pool.
- **Purpose:** distribution through Proof of Kindness, Social Mining, and Kindness Challenges.
- The parameter is DAO‑adjustable within the range of 30–70%.
- **Important:** `burnPercent + rewardPercent == 100` (smart‑contract constraint).

**Step 7. Price Protection (optional)**
- If the PNJC price falls below the established price floor, the multisig (3/5) may initiate the use of Insurance Fund assets.
- Function `protectPrice()`:
  - Checks the current price via an oracle (DEX router).
  - Uses up to 50% of the Insurance Fund balance for buybacks and burning.
  - Requires multisig approval (4 of 5 signatures).

### 4.3 Why is `buybackPercent` not 100%?

**Technical rationale:**

1. **Slippage Reduction**  
   - Large one‑time buybacks can significantly increase the PNJC price, amplifying slippage.  
   - Gradual buybacks (25% per cycle) minimise market impact and make burning more efficient.

2. **Capital Accumulation**  
   - Accumulated funds allow for larger buybacks during periods of low liquidity.  
   - This maximises the deflationary effect under favourable market conditions.

3. **Management Flexibility**  
   - The DAO can adjust `buybackPercent` based on market conditions.  
   - The parameter can be increased when liquidity is high and decreased when liquidity is low.

4. **Strategic Reserving**  
   - A portion of funds remains on the protocol balance for emergency situations.  
   - For example, to activate price protection via the Insurance Fund without requiring external funds.

### 4.4 Protocol Parameters (DAO‑Adjustable)

| Parameter | Description | Default Value | Adjustment Range |
|-----------|-------------|---------------|------------------|
| `insurancePercent` | Share of USDT reserved in the Insurance Fund | 5% | 3–10% |
| `buybackPercent` | Share of remaining USDT allocated to token buybacks | 25% | 15–35% |
| `burnPercent` | Share of purchased tokens permanently burned | 50% | 30–70% |
| `rewardPercent` | Share of purchased tokens sent to the rewards pool | 50% | 30–70% |
| `priceFloor` | Minimum price triggering the protection mechanism | 0.000001 PNJC | Subject to DAO review |
| `minExecutionAmount` | Minimum USDT amount to activate the protocol | 100 USDT | 50–10,000 USDT |
| `maxSlippageBps` | Maximum acceptable slippage during swaps | 300 bps (3%) | 50–1000 bps |

**Smart‑contract constraints:**
- `insurancePercent + buybackPercent == 30` (the sum of these two parameters always equals 30%)
- `burnPercent + rewardPercent == 100` (the sum always equals 100%)

### 4.5 Protocol Governance

**Multisig (3/5):**
- Initiates protocol execution (`executeGoldenBurn()`).
- Manages emergency situations (pause, use of Insurance Fund).
- Controls fund withdrawals (only in emergency cases, with public reporting).

**DAO:**
- Votes on changes to all protocol parameters.
- Approves non‑standard use of the Insurance Fund.
- Monitors protocol performance through quarterly reports.

**Automation:**
- The call to `executeGoldenBurn()` may be automated via a bot or oracle.
- The protocol checks the USDT balance and activates when `minExecutionAmount` is reached.

### 4.6 Economic Impact

- 📉 **Continuous reduction of circulating supply:** Each cycle burns 50% of purchased tokens.
- 📈 **Price support:** With constant demand, reduced supply creates upward price pressure.
- 🎁 **Incentivising activity:** 50% of tokens are returned to the community as rewards.
- 🛡️ **Protection against sharp declines:** The Insurance Fund (5% of inflows) provides price protection.
- ⚙️ **Governance flexibility:** The DAO can adapt protocol parameters to market conditions.

________________________________________

## 5. SOURCES OF DEMAND (UTILITIES)

| Scenario | Action | Impact on Demand |
|----------|--------|------------------|
| **Proof of Kindness** | Payment for verification of good deeds | Constant small expenditure |
| **Impact Score** | Burning tokens to accelerate rank growth | Deflationary effect |
| **Social Mining** | PNJC collateral for content creation participation | Temporary lock‑up |
| **DAO Voting** | Minimum balance for participation | Token retention |
| **Kindness Challenges** | Entry fee in PNJC | Consumption |
| **ONE+ Platform** | Payment for premium services | Regular spending |
| **NFT / Status Levels** | Purchase with PNJC | Burning or lock‑up |
| **Charity** | Voluntary donations | Removal from circulation |

________________________________________

## 6. LIQUIDITY LOCKING

- All LP tokens belonging to the project are locked for 12 months via the `PNJCLiquidityLocker` smart contract.
- The contract has no owner functions and cannot be upgraded or paused.
- **Lock Date:** July 1, 2026 (after contract deployment).
- **Unlock Date:** July 1, 2027 (lock extension possible via DAO decision).
- The Locker contract address will be published in official channels immediately after deployment and will be verifiable on PolygonScan.

________________________________________

## 7. TREASURY MANAGEMENT

**🏦 Project Treasury (12%)**
- Managed by a 3/5 multisig (Gnosis Safe) via `PNJCTreasuryVault`.
- Funds are spent strictly on approved items: development, marketing, legal support, future audits, listings, operational expenses.
- All transactions are public; quarterly reports are published openly.
- The contract has no owner functions; only the multisig can initiate withdrawals.

**🗳️ DAO Treasury (10%)**
- Fully controlled by PNJC holders through votes on Snapshot (quorum 5% of circulating supply).
- Spending decisions are made by simple majority; large expenditures (over 50,000 USDT) require a supermajority (66%).
- The DAO also approves charitable organisations and donation amounts.
- Execution of decisions is carried out via the multisig (3/5).

________________________________________

## 8. CONTRACT ADDRESSES

| Contract | Address | Purpose |
|----------|---------|---------|
| **PNJC Token** | `0x781C0d15347Cb0B94C42C65c7a67E70371205De5` | Main ERC‑20 token |
| **PNJC_GoldenPhoenixProtocol** | To be published | Deflationary protocol |
| **PNJCLiquidityLocker** |`0x301CA915ca73550b3E6b578279e6a65511858C0c | LP token is not locking yet|
| **PNJCAirdrop** | To be published | Merkle distribution |
| **PNJCTreasuryVault** | To be published | Treasury (multisig) |
| **PNJCVestingVault** | To be published | Linear vesting |

________________________________________

## 9. DATA RESPONSIBILITY

This version of the Tokenomics (v3.2) is the single official version for all project documents (Whitepaper v5.1, FAQ, Token Information Sheet, DAO Operating Agreement, etc.). All figures and mechanisms described herein take precedence over any previous versions.

**Key changes in version 3.2:**
- ✅ Added full description of the `buybackPercent` parameter.
- ✅ Described the mechanism of fund accumulation on the protocol balance.
- ✅ Synchronised smart‑contract constraints (`insurancePercent + buybackPercent == 30`, `burnPercent + rewardPercent == 100`).
- ✅ Clarified the role of the multisig and DAO in protocol governance.
- ✅ Specified the contracts for each token category.
- ✅ Added information on protocol execution automation.

Any future changes may only be made through DAO votes.

________________________________________

**© 2026 PanjoCoin (PNJC). All rights reserved.** 🐾
