### PanjoCoin (PNJC) — WHITEPAPER
Version: 2.2 (Reconciled with README v2.0)
Date: August 2, 2026 (original v2.2: July 25, 2026)
Network: Polygon PoS


## 1. THE LEGEND OF PANJO
In the heart of Tbilisi, in the courtyard of the Iashvili Central Children's Clinical Hospital, a Shar Pei named Panjo appeared one day. He belonged to no one and seemed to have wandered in by chance — to a place where chance usually does not bring visitors. He stopped in the courtyard, raised his head, and gazed for a long time at the sky where clouds drifted slowly — as if searching for something familiar among them.

It was at that very moment he noticed a window on the second floor. Behind the glass stood a boy. He was not smiling. He simply looked down quietly — with a tired yet living gaze. Panjo looked back at him. And instead of walking away, he took a step closer.

He began to behave strangely — sitting down, tilting his head, standing up, sitting again, spinning around as if performing a little dance understood only by himself. His wrinkled face would alternate between serious and comical, as if he were deliberately "breaking" the sadness in the air.

At first, the boy simply watched. Then his expression changed. And then he smiled. It was a quiet, almost imperceptible smile — but it became the moment for which everything had happened.

Panjo did not know the words "joy" or "hope." But he understood the most important thing: he could return. And he began to come again. Almost every day.

From that time on, people in the hospital courtyard began to recognize him. Doctors said his presence changed the atmosphere in the ward. Children waited for him. Some would come to the window, others would go down to the courtyard, and some would simply begin to feel a little better, without even understanding why.

Thus, Panjo became something more than just a dog. He became a reminder that sometimes one living being, one movement, one glance can change more than any words. And this very story became the foundation of PNJC — a token that exists as a symbol of a simple principle:

Even a small act of kindness can change someone's reality.

## 2. INTRODUCTION AND CORE PARAMETERS
PanjoCoin (PNJC) is a utility digital asset deployed on the Polygon PoS network. The token provides holders with access to services and features of the PanjoCoin ecosystem (including the planned ONE+ gaming platform and transparent charity system).

Core Parameters (implemented in smart contracts):

| Parameter | Value |
|---|---|
| Name | PanjoCoin |
| Ticker | PNJC |
| Network | Polygon PoS |
| Standard | ERC-20 + ERC20Burnable + ERC20Permit (EIP-2612) |
| Total Supply | 1,000,000,000,000 PNJC |
| Decimals | 18 |
| Supply Model | Fixed (emission occurred at deployment) |
| Mint Function | Absent |
| Admin Keys | None (ownerless contract) |
| Upgradeability | None |
| Transfer Tax | 0% (on all transactions) |
| Blacklists / Freezing | None |
| Token Contract Address | 0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF |
| DEX | Uniswap V2 (**listing pending** — no liquidity pool has been created yet) |
| Compiler | Solidity 0.8.36 (verified) |

### 2.1. ERC20Permit (EIP-2612) — Gasless Approvals
The PanjoCoin smart contract implements ERC20Permit, an extension of the ERC-20 standard defined by EIP-2612. This feature enables gasless token approvals using signed messages, eliminating the need for a separate on-chain approval transaction before a token transfer.

**How It Works:**

| Traditional ERC-20 | ERC20Permit |
|---|---|
| User submits `approve()` transaction (paying gas). | User signs a message off-chain (no gas). |
| Spender waits for approval to be mined. | Spender submits `permit()` with the signed message. |
| Spender calls `transferFrom()`. | The `permit()` function validates the signature and sets approval atomically. |

**Benefits:**
- Reduced Transaction Costs — Users save gas by combining approval and transfer operations.
- Improved User Experience — No need for two separate transactions (approve + transfer).
- Meta-Transaction Support — Enables relayers to submit transactions on behalf of users.
- Better DEX Integration — Allows seamless token swaps without requiring users to approve tokens first.

**Implementation:** The `permit()` function accepts the following parameters:
- `owner` — The token holder (address);
- `spender` — The address authorised to spend tokens;
- `value` — The amount of tokens to approve;
- `deadline` — Expiration timestamp for the signature;
- `v, r, s` — Signature components.

Once the signature is validated, the approval is applied directly. This feature is particularly valuable for users interacting with decentralised applications, DEXs, and automated protocols where minimising transaction steps and costs is critical.

## 3. PROBLEM STATEMENT
The modern memecoin market is characterized by systemic problems:

| Problem | Description |
|---|---|
| Lack of Utility | Over 99% of memecoins provide no real functions or services. |
| Security Risks | Hidden emissions, predatory taxes (up to 50–90%), centralized control. |
| Opacity | Lack of public code verification and fund distribution transparency. |
| Short-termism | Most projects survive a few weeks and disappear. |

PNJC addresses these issues through:
- Open source code (verified on PolygonScan).
- No administrative privileges (ownerless contract).
- Public wallets (full distribution transparency).
- Planned utility (gaming platform, charity, DAO).
- Gasless approvals (ERC20Permit) for improved user experience.

## 4. SOLUTION: SECURITY ARCHITECTURE

### 4.1. Technical Security (implemented in code)
- The contract has no owner (`owner = address(0)`) — no one can change functions, emission, or taxes.
- Code verified on PolygonScan.
- No `mint()`, `blacklist`, `pause()`, or `freeze()` functions.
- 0% tax on all transactions.
- ERC20Permit (EIP-2612) is implemented for gasless approvals, enabling meta-transactions, relayer support, reduced transaction overhead, and seamless DEX integration.

### 4.2. Economic Model (implemented)
- Fixed supply (1 trillion PNJC) — emission occurred once at deployment.
- Zero fees on all operations (buying, selling, transferring).
- Transparent distribution with public addresses.

### 4.3. Future Utility (code ready / design phase — not yet deployed)

| Module | Purpose | Planned Timeline | Deployment Status |
|---|---|---|---|
| DAO Governor | Decentralized token holder voting (quorum 4%, 7-day period) | Q4 2026 | 🧩 Code ready — not yet deployed |
| VestingVault | Linear token distribution schedule for team and founder | Q3 2026 | 🧩 Code ready — not yet deployed |
| MerkleAirdrop | Gas-efficient token distribution to pre-determined addresses | July 2026  (original target — has passed; timeline under revision) | 🧩 Code ready — not yet deployed |
| TreasuryVault | Treasury management with transparent reporting (multisig) | Q3 2026 | 🧩 Code ready — not yet deployed |
| ONE+ Gaming Platform | Access to games, in-game items, and rewards | Q3 2027 | 🔄 Design phase |
| ClownCare Bridge | Transparent charitable payment system with on-chain reporting | Q2 2027 | 🔄 Design phase |

## 5. TOKENOMICS AND DISTRIBUTION

### 5.1. Fixed Supply
Total supply is 1,000,000,000,000 PNJC (1 trillion). The `mint()` function is permanently disabled, and no additional tokens can ever be created.

### 5.2. Allocation Breakdown

| Category | Share | Amount (PNJC) | Control Mechanism | Deployment Status |
|---|---|---|---|---|
| Liquidity Pool (Uniswap V2) | 50% | 500,000,000,000 | Will be locked via PNJCLiquidityLockerV2 for 12 months after DEX listing, with no early withdrawal, once the locker contract is deployed | 🧩 Code ready — **not deployed; LP is not currently locked** |
| Operational Treasury | 12% | 120,000,000,000 | 3/5 Multisig for operational expenses, listings, and partnerships | ⏳ Multisig setup in progress — **1 of 5 signers currently appointed** |
| DAO Treasury | 10% | 100,000,000,000 | Will be governed by DAO after launch (targeted Q4 2026). Grants, community initiatives | 🧩 Code ready — not deployed |
| Team | 10% | 100,000,000,000 | Will be locked in VestingVault (6-month cliff, 12-month linear vesting) once deployed | 🧩 Code ready — not deployed |
| Community | 8% | 80,000,000,000 | Airdrops, referral bonuses, marketing campaigns, community rewards — to be distributed via PNJCMerkleAirdrop once deployed | 🧩 Code ready — not deployed |
| Founder | 5% | 50,000,000,000 | Will be locked in VestingVault (12-month cliff, 24-month linear vesting) once deployed | 🧩 Code ready — not deployed |
| Charity Reserve | 5% | 50,000,000,000 | Public wallet for transparent charitable donations | ✅ Wallet public and active |

Verification: 500 + 120 + 100 + 100 + 80 + 50 + 50 = 1,000 billion PNJC (100%).

**Important:** allocations not yet covered by a deployed contract (Liquidity Pool, DAO Treasury, Team, Community, Founder) are currently held on the deployer/founder-controlled address and are **not technically locked, vested, or restricted in any way** until the corresponding contract is deployed and funded. Only the Charity Reserve wallet is presently operating under its intended control mechanism.

### 5.3. Control Mechanisms

| Mechanism | Status | Description |
|---|---|---|
| Liquidity Lock | 🧩 Code ready, not deployed | Once deployed, 50% of supply will be locked in an immutable, ownerless contract with no early withdrawal option for 12 months. Not active today. |
| Vesting Contracts | 🧩 Code ready, not deployed | Once deployed, Team and Founder allocations will be subject to linear vesting (Team: 6-month cliff + 12 months; Founder: 12-month cliff + 24 months) to ensure long-term commitment. Not active today. |
| Multisig Wallets | ⏳ Partially active (1/5 signers) | Treasury wallets are intended to be protected by a 3/5 multisig until DAO launch. Currently only the founder's key is appointed; the 3-signature threshold cannot yet be met. |

## 6. CIRCULATION MODEL

### 6.1. Initial Circulating Supply
At launch, 1% of total supply entered circulation — 10,000,000,000 PNJC. This provides initial liquidity and price discovery once a DEX pool is created.

### 6.2. Locked Supply and Release Schedule
The remaining 99% (990,000,000,000 PNJC) is intended to be locked and released gradually once the relevant vesting/release contracts are deployed (see Section 5.3). As of this revision, this 99% is **not yet locked by any contract** — it is held on project-controlled addresses pending deployment.

**Release Formula (target, once deployed):** Each year, 5% of the remaining locked balance enters circulation. This creates a smooth, predictable supply increase.

### 6.3. Annual Circulation Table (target schedule)

Formula: Locked₍ₙ₎ = 990 × 0.95ⁿ (bln); Circulation₍ₙ₎ = 1000 − Locked₍ₙ₎; % = Circulation₍ₙ₎ / 10

Year	Locked (Billion)	In Circulation (Billion)	% in Circulation
0 (Launch)	990.000000	10.000000	1.000000%
1	940.500000	59.500000	5.950000%
2	893.475000	106.525000	10.652500%
3	848.801250	151.198750	15.119875%
4	806.361188	193.638813	19.363881%
5	766.043128	233.956872	23.395687%
6	727.740972	272.259028	27.225903%
7	691.353923	308.646077	30.864608%
8	656.786227	343.213773	34.321377%
9	623.946916	376.053084	37.605308%
10	592.749570	407.250430	40.725043%

**Model Advantages (once deployed):**
- Predictable for holders.
- Reduced sell pressure.
- Long-term team alignment.

## 7. UTILITY AND ECOSYSTEM

### 7.1. Current Utility (available now)

| Function | Description |
|---|---|
| DEX Trading | Free wallet-to-wallet transfers (0% tax). Note: no Uniswap V2 pool is live yet — see Section 2. |
| Transparent Charity | Public Charity Reserve wallet — all transfers are on-chain verifiable. |
| Optional Burning | Users can burn their own tokens via the `burn()` function. |
| Gasless Approvals | ERC20Permit (EIP-2612) enables off-chain signature approvals, reducing transaction costs. |

### 7.2. Future Utility (code ready / design phase)

| Function | Description | Planned Timeline | Deployment Status |
|---|---|---|---|
| DAO Voting | Participation in ecosystem development votes | Q4 2026 | 🧩 Code ready — not deployed |
| ONE+ Platform | Access to games, in-game items, and rewards | Q3 2027 | 🔄 Design phase |
| ClownCare Bridge | Transparent fund distribution with on-chain reporting | Q2 2027 | 🔄 Design phase |

## 8. TECHNOLOGY AND SECURITY

### 8.1. Deployed Contracts

| Contract | Status | Link |
|---|---|---|
| PanjoCoin (token) | ✅ Active | PolygonScan |
| PNJCLiquidityLockerV2 | 🧩 Code Ready — not deployed | GitHub |
| PNJCAirdrop | 🧩 Code Ready — not deployed | GitHub |
| PNJCVestingVault | 🧩 Code Ready — not deployed | GitHub |
| PNJCTreasuryVault | 🧩 Code Ready — not deployed | GitHub |
| DAO Governor | 🧩 Code Ready — not deployed | GitHub |

### 8.2. Confirmed Security Measures

This table is split by contract scope to avoid ambiguity about ownership, since "ownerless" applies specifically to the token contract, not to every contract in the ecosystem.

**PanjoCoin token contract:**

| Measure | Status |
|---|---|
| OpenZeppelin 5.5.0 | ✅ |
| ReentrancyGuard | ✅ |
| No selfdestruct | ✅ |
| No delegatecall | ✅ |
| No upgradeability | ✅ |
| No owner (`owner = address(0)`) | ✅ |
| Code verified | ✅ |
| ERC20Permit (EIP-2612) | ✅ |

**Treasury / Locker / Vesting contracts (once deployed):**

| Measure | Status |
|---|---|
| Owner model | Controlled by 3/5 multisig (not by a single admin key) |
| Multisig operational status | ⏳ Not yet fully operational — 1 of 5 signers appointed (see Section 11.2) |
| Upgradeability | None — immutable once deployed |

## 9. AUDIT AND VERIFICATION

### 9.1. Completed Checks

| Check | Status |
|---|---|
| Verification on PolygonScan | ✅ Completed |
| Internal testing (Hardhat) | ✅ Completed |
| Automated static analysis (Slither, all 5 contracts) | ✅ Completed — 95/100, no critical or high-severity findings. Bilingual (Georgian/Russian) reports available. |
| Community code review | 🔄 Available |

Automated static analysis is a useful preliminary sanity check. It is **not** a substitute for an independent professional audit and should not be presented or interpreted as one.

### 9.2. Planned Independent Audits

| Contract | Auditor | Original Timeline | Status |
|---|---|---|---|
| PanjoCoin (token) | CertiK | Q2 2026 | ⏳ Not started — target passed, being rescheduled |
| PNJCLiquidityLockerV2 | CertiK | Q2 2026 | ⏳ Not started — target passed, being rescheduled |
| VestingVault | CertiK / Hacken | Q3 2026 | ⏳ Not started |
| Airdrop | CertiK / Hacken | Q2 2026 | ⏳ Not started — target passed, being rescheduled |
| TreasuryVault | CertiK / Hacken | Q3 2026 | ⏳ Not started |
| DAO Governor | CertiK / Hacken | Q4 2026 | ⏳ Not started |

Audit results will be published on the website and GitHub repository in full and unedited, regardless of outcome. None of these five modules will be deployed to mainnet prior to completion of its respective independent audit.

## 10. ROADMAP (24 MONTHS)

| Month | Period | Module / Stage | Details | Actual Status (as of Aug 2026) |
|---|---|---|---|---|
| 1 | July 2026 | Token Launch / Automated Audit / LP Lock / Airdrop | Deploy and verify token contract. Run automated (Slither) audit. Deploy PNJCLiquidityLockerV2, lock 50% LP for 12 months. Launch Merkle tree airdrop. | ✅ Token deployed & verified · ✅ Slither audit completed · ⏳ Locker and Airdrop not yet deployed |
| 2 | August 2026 | VestingVault / TreasuryVault | Deploy vesting contracts for team and founder. Activate multisig treasury. | ⏳ Pending |
| 3 | September 2026 | DAO Governor Preparation | DAO code audit, parameter configuration (quorum 4%, 7-day voting). | ⏳ Pending |
| 4 | October 2026 | DAO Governor Testing | Deploy to Polygon testnet, internal testing. | ⏳ Pending |
| 5 | November 2026 | DAO Governor Launch | Mainnet deployment, transfer of governance to DAO. | ⏳ Pending |
| 6-9 | Dec–Mar 2027 | Marketing & Analysis | Educational campaigns, DEX aggregator integration, metrics collection. | ⏳ Pending |
| 10-13 | Apr–Jul 2027 | ClownCare Bridge | Design, development, testing, and launch of charity bridge. | ⏳ Pending |
| 14-18 | Aug–Dec 2027 | ONE+ Platform | Development, MVP, internal testing, community beta, official launch. | ⏳ Pending |
| 19-24 | Jan–Jun 2028 | Scaling & Enhancements | New games, DAO improvements, cross-chain research. | ⏳ Pending |

Month 1's original plan bundled the LP lock and airdrop launch together with the token deployment; in practice only the token deployment, verification, and automated audit were completed within that window. The Liquidity Locker and Airdrop deployments have carried over and remain pending — see the README's "Current Project Status" table for live updates.

## 11. TEAM

### 11.1. Founder

| Parameter | Details |
|---|---|
| Name | Tengo Kalandia |
| Experience | 11+ years in charitable sector (Director of SmileDonate Foundation) |
| Role | Smart contract developer, Whitepaper author, strategic development |
| Status | Fully doxxed (public reputation) |

### 11.2. Governance (until DAO launch)

3/5 Multisig signers — **currently 1 of 5 seats filled**:

| Seat | Holder |
|---|---|
| 1 | Tengo Kalandia (founder) — appointed |
| 2 | Technical advisor — to be appointed |
| 3 | Strategic advisor — to be appointed |
| 4 | Backup key (auditor) — to be appointed |
| 5 | Backup key (community representative) — to be appointed |

Until at least two additional signers are appointed, the multisig cannot reach its 3-signature threshold, and treasury operations requiring multisig approval are effectively bottlenecked on the founder. After DAO launch, keys will be transferred to independently elected community members.

## 12. RISK DISCLOSURE

| Risk | Description |
|---|---|
| Market Risks | Token price is determined by the market and may fall to zero. |
| Liquidity Risks | No liquidity pool currently exists; once created, pool depth may be insufficient for large orders. |
| Technical Risks | Unknown vulnerabilities may exist in smart contracts; only an automated static analysis has been completed so far, not an independent professional audit. |
| Governance Risks | The operational multisig is not yet fully appointed (1 of 5 signers); until then, effective control of treasury operations rests with a single key. |
| Regulatory Risks | Cryptocurrency laws may change, affecting token usability. |
| Development Risks | Planned features (Locker, VestingVault, TreasuryVault, Airdrop, DAO Governor) are code-complete but not yet deployed and may be delayed further. |

**Important:** The token provides access to ecosystem services. Its acquisition is not an investment and does not guarantee income. Participate only with funds you are prepared to lose completely.

## 13. LEGAL STATUS
PNJC is a utility token that provides access to ecosystem services. The token does not grant rights to:
- Income or dividends.
- Share in the project.
- Expectation of profit from project activities.

Users bear personal responsibility for complying with their country's laws. This section reflects the project's own position and has not been reviewed by qualified legal counsel — see the Legal Disclaimer for the full caveat.

## 14. SOURCE OF TRUTH

Priority in case of conflicts between documents:

1. Smart contract state on blockchain (Polygon).
2. Blockchain transaction history.
3. Verified smart contract source code.
4. **The "Current Project Status" table in the project README** — updated more frequently than this Whitepaper and reflects real-time deployment status of each module.
5. This Whitepaper.

If this Whitepaper's roadmap dates or control-mechanism descriptions ever conflict with the README's status table, the README takes precedence for questions of "is X deployed / active right now."

## 15. CONCLUSION
PanjoCoin (PNJC) is a utility digital asset that currently provides a secure and transparent token for wallet-to-wallet transfers, with phased deployment of additional modules (DAO, vesting, airdrop, treasury, liquidity lock) according to the roadmap. As of this revision, only the token contract is live; all other modules are code-complete and pending deployment and independent audit.

**Key Advantages:**
- Maximum security (ownerless token contract, 0% tax, no hidden functions).
- Full transparency (all addresses and transactions public, including honest disclosure of what is and isn't deployed yet).
- Verified code on PolygonScan and open GitHub.
- Gasless approvals (ERC20Permit) for seamless and cost-effective user experience.

Join us — every step brings us closer to a child's smile and a sustainable ecosystem.

## 16. OFFICIAL LINKS

| Resource | Link |
|---|---|
| Website | https://cryptotengo.netlify.app|
| Smart Contract (token) | 0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF |
| GitHub | github.com/CryptoTengo/PanjoCoin |
| Liquidity Lock | Not yet deployed — to be added after locker deployment |
| Network | Polygon PoS |
| DEX | Uniswap V2 (listing pending) |
| Socials | X (Twitter), Telegram |

© 2026 PanjoCoin. All rights reserved.
Document Version: 2.2 (Reconciled with README v2.0)
Last Updated: August 2, 2026
