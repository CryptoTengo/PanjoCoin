# 🏗️ PanjoCoin (PNJC) — Current System Architecture

> **Version:** 1.0.0 (Current Implementation)
> **Network:** Polygon (MATIC)
> **Status:** **LIVE** (Base Token Deployed)
> **Last Updated:** June 2026

## ⚠️ IMPORTANT — READ FIRST

This document describes the **ACTUAL implemented architecture** of the PanjoCoin smart contract as deployed on the Polygon network.

**Current Scope:** Only the core ERC-20 token contract is live. The diagrams showing Staking, Treasury, and Governance are **conceptual future plans only** and do not exist in the current v1.0 contract.

For planned features, see the [Roadmap](./Roadmap.md).

---

## 📐 Current High-Level Architecture (v1.0)

┌─────────────────────────────────────────────────────────────┐
│                    USER (EOA or Contract)                   │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                    POLYGON BLOCKCHAIN                       │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                    🧠 TOKEN CONTRACT (PNJC)                  │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │                 IMPLEMENTED FEATURES                │   │
│  ├─────────────────────────────────────────────────────┤   │
│  │ • ERC-20 (Total Supply: 1 Trillion PNJC)           │   │
│  │ • ERC-20Burnable (Holders can destroy their tokens)│   │
│  │ • ERC-20Permit (EIP-2612 — Gasless approvals)      │   │
│  │ • Fixed Supply (No mint function)                  │   │
│  │ • No Owner / No Admin (Rug-pull proof)             │   │
│  │ • No Transaction Taxes (0% buy/sell fee)           │   │
│  └─────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘

**Key Constraints:**
- All 1 Trillion PNJC were minted once to the deployer address at initialization.
- No additional tokens can ever be created.
- No administrative functions exist (cannot pause, freeze, or modify contract behavior).

---

## 🔗 Current Module Interaction Flow

### 1. Standard ERC-20 Transfer

User A (Sender)
     │
     ▼
┌─────────────────────────────────────────────────────────────┐
│ PNJC.transfer(recipient, amount)                            │
│                                                             │
│ 1. Check sender balance                                     │
│ 2. Subtract amount from sender                              │
│ 3. Add amount to recipient                                  │
│ 4. Emit Transfer event                                      │
│                                                             │
│ ⚠️ No taxes, no fees, no hooks. Pure transfer.              │
└─────────────────────────────────────────────────────────────┘
     │
     ▼
User B (Recipient)

---

### 2. Burn Flow (Deflationary Mechanism)

User (Token Holder)
     │
     ▼
┌─────────────────────────────────────────────────────────────┐
│ PNJC.burn(amount)                                           │
│                                                             │
│ 1. Verify sender has sufficient balance                     │
│ 2. Subtract amount from sender                              │
│ 3. Reduce totalSupply by amount                             │
│ 4. Emit Transfer(sender, address(0), amount) event          │
│                                                             │
│ 🔥 Result: Tokens permanently removed from circulation.     │
└─────────────────────────────────────────────────────────────┘

---

### 3. Permit Flow (Gasless Approval)

Off-chain: User signs a message (EIP-2612 format)
     │
     ▼
On-chain: Spender calls `permit(...)` with signature
     │
     ▼
┌─────────────────────────────────────────────────────────────┐
│ PNJC.permit(owner, spender, value, deadline, v, r, s)       │
│                                                             │
│ 1. Recover signer from signature                            │
│ 2. Verify signature is valid and not expired                │
│ 3. Set allowance[owner][spender] = value                    │
│                                                             │
│ ✅ Result: Spender can now transfer tokens without owner    │
│    paying gas for an explicit approve() transaction.        │
└─────────────────────────────────────────────────────────────┘

**Use Case:** DEX integrations (QuickSwap, Uniswap) — users approve once via signature.

---

## 🧩 Current Module Responsibility

| Module              | Status        | Implementation                                                                 |
|---------------------|---------------|--------------------------------------------------------------------------------|
| **Token (PNJC)**    | ✅ **LIVE**   | ERC-20, Burnable, Permit. No taxes, no owner, fixed supply.                    |
| **Staking**         | ❌ NOT YET    | Concept only — requires separate contract. See Roadmap.                       |
| **Treasury**        | ❌ NOT YET    | Concept only — requires multi-sig + governance.                               |
| **DAO / Governance**| ❌ NOT YET    | Concept only — requires token holder base + separate module.                  |
| **dApp Interface**  | ❌ NOT YET    | Basic wallet interactions only (via Polygonscan/explorers).                    |
| **Subgraph/Indexer**| ❌ NOT YET    | Planned for analytics. Currently use Polygonscan.                             |

---

## 🔐 Current Security & Access Control

| Role                | Access Level                                                                                     | Current Implementation                 |
|---------------------|--------------------------------------------------------------------------------------------------|----------------------------------------|
| **Default Admin**   | None. Contract has no owner/administrator.                                                       | ✅ **NO ADMIN ROLE EXISTS**            |
| **Multisig**        | N/A — No treasury or upgrade authority.                                                          | ❌ Not applicable                       |
| **DAO**             | N/A — Governance not yet implemented.                                                            | ❌ Not applicable                       |
| **Users**           | Transfer tokens, burn own tokens, approve spending, transfer via permit.                         | ✅ Fully open and permissionless.       |

**Security Guarantee (v1.0):**
- No single entity can mint new tokens.
- No single entity can pause transfers.
- No single entity can blacklist wallets.
- No single entity can upgrade the contract.

**Trade-off:** If a critical bug is discovered, there is no emergency pause mechanism. This is intentional for decentralization.

---

## 📊 Data Flow Example: User Transfer with Permit (Gasless)

```mermaid
sequenceDiagram
    participant Alice as Alice (Owner)
    participant Bob as Bob (Spender - e.g., DEX)
    participant Chain as Polygon (PNJC Contract)
    
    Note over Alice,Bob: Off-chain step
    Alice->>Alice: Sign permit message (PNJC amount for Bob)
    
    Note over Alice,Bob: On-chain step (Bob pays gas)
    Bob->>Chain: permit(...) with Alice's signature
    Chain-->>Bob: Allowance set
    
    Bob->>Chain: transferFrom(Alice, Bob, amount)
    Chain-->>Bob: Tokens transferred
    
    Bob-->>Alice: Transaction complete (Alice paid no gas)
🧪 Current Testing & Deployment Verification
text
Manual Code Review
        │
        ▼
Local Hardhat Tests (Basic ERC20 compliance)
        │
        ▼
Deploy to Polygon Amoy (Testnet) — Optional
        │
        ▼
Manual Verification of:
├── No admin functions
├── No hidden minting
├── Permit signature validation
└── Burn mechanics
        │
        ▼
Deploy to Polygon Mainnet
        │
        ▼
Verify contract on Polygonscan
        │
        ▼
Transfer all tokens from deployer to multi-sig or distribution wallets
        │
        ▼
✅ TOKEN IS LIVE

⚠️ Note: Professional 3rd party audit is RECOMMENDED before large liquidity events.
📚 Current Standards & Dependencies
Standard	Implementation
ERC-20	✅ OpenZeppelin v5.0.0+
ERC-20Burnable	✅ OpenZeppelin extension
EIP-2612 (Permit)	✅ OpenZeppelin ERC20Permit
Solidity	0.8.34
OpenZeppelin	Contracts imported via @openzeppelin/
🔮 Future Architecture (Conceptual — NOT Implemented)
The following components are under consideration for future releases (see Roadmap for timelines):

Staking Contract (with APY and lock periods)

DAO Governance (OpenZeppelin Governor + Timelock)

Treasury Multi-sig (for ecosystem funding)

Transaction Tax (buy/sell fees for treasury)

dApp Interface (staking UI, governance portal)

Subgraph / The Graph integration

Cross-chain bridge (Polygon ↔ BSC/Arbitrum)

No timelines are guaranteed. All future development depends on community growth, market conditions, and external audits.

📌 Final Note for Auditors and Investors
Current Architecture (v1.0) is intentionally simple and secure:

What you see is what you get — a standard ERC-20 token with no hidden complexity.

Risk: Centralized supply (all tokens initially held by deployer). Mitigation requires transparent distribution before DEX listing.

Recommendation: Distribute supply across multiple wallets (liquidity pool, marketing, team vesting) and publish vesting schedules.

For the highest trust, consider:

Moving deployer's remaining tokens to a multi-sig wallet.

Locking liquidity pool tokens via a trusted locker (e.g., Team.Finance, Unicrypt).

Publishing a token distribution plan with on-chain proof (e.g., via Airdrop contract).

This architecture document reflects the state of the PanjoCoin smart contract as of its deployment date. It will be updated when new modules are deployed and verified on-chain.

Maintainer: PanjoCoin Team
Contract on Polygonscan: [Link to be added after deployment]
