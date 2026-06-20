# 🟢 PNJC Protocol Specification

## 1. Overview

PNJC (PanjoCoin) is a fixed-supply ERC-20 token system designed for deployment on EVM-compatible networks (e.g., Polygon).

The protocol is intentionally minimal and deterministic, focusing on:

- Fixed token supply
- Immutable token contract logic
- Off-chain controlled distribution model
- Modular ecosystem components (vesting, liquidity, airdrop, treasury)

PNJC does NOT currently implement on-chain governance.

---

## 2. Architecture

The PNJC ecosystem consists of the following components:

### 2.1 Core Token Contract
- ERC20 standard implementation
- ERC20Permit (EIP-2612) support
- Burnable functionality
- Fixed supply minted at deployment

### 2.2 Liquidity Layer
- Liquidity is managed via dedicated wallet(s)
- LP tokens are intended to be locked via Liquidity Locker contract
- No automatic liquidity management logic inside token contract

### 2.3 Vesting Layer (if deployed)
- Linear vesting vault contracts
- Token distribution over time based on immutable schedule
- Beneficiary-based claim mechanism

### 2.4 Airdrop Layer
- Merkle-proof based claim system
- One-time claim per address
- Off-chain generated distribution tree

### 2.5 Treasury Layer
- Multisig-controlled wallet
- Used for operational funds, listings, and ecosystem expenses
- No on-chain governance enforcement

---

## 3. Invariants

The following properties are guaranteed by design:

### 3.1 Token Invariants
- Total supply is fixed at deployment and equals 1,000,000,000,000 PNJC
- No mint function exists after deployment
- Burn operations reduce circulating supply only
- ERC20 balances remain consistent with transfer rules

### 3.2 Contract Invariants
- Token contract is immutable after deployment
- No owner or admin roles exist in the token contract
- No upgradeability mechanism is present

### 3.3 Vesting Invariants (if applicable)
- Vesting is monotonic over time
- Claimed amount can never exceed vested amount
- Total distributed amount cannot exceed allocation

### 3.4 Airdrop Invariants
- Each address can claim only once per defined distribution set
- Valid Merkle proof is required for all claims
- Claims are irreversible once executed

### 3.5 Liquidity Invariants
- LP tokens must remain locked until unlock conditions are met
- Early withdrawal is not permitted under contract logic

---

## 4. Failure Modes

The system may be affected by the following risks:

### 4.1 Deployment Risks
- Incorrect initial token distribution due to deployment script errors
- Misconfiguration of recipient wallet addresses

### 4.2 Liquidity Risks
- Failure to deposit liquidity at launch
- Improper locking of LP tokens

### 4.3 Vesting Risks
- Incorrect vesting schedule parameters leading to locked or misallocated tokens
- Loss of access to vesting beneficiary wallet

### 4.4 Airdrop Risks
- Incorrect Merkle root generation
- Invalid off-chain dataset causing claim failure

### 4.5 Treasury Risks
- Loss or compromise of multisig wallet keys
- Human error in treasury fund allocation

### 4.6 External Risks
- Blockchain network failure or congestion
- RPC or infrastructure failure affecting interaction reliability

---

## 5. Assumptions

The PNJC protocol assumes the following external conditions:

- EVM-compatible blockchain behaves according to specification
- Deployment scripts are executed correctly and securely
- Off-chain systems (e.g., Merkle tree generation) are accurate
- Multisig participants act honestly and securely manage keys
- DEX infrastructure (e.g., Uniswap/QuickSwap) operates correctly
- No catastrophic failure of underlying blockchain network

---

## 6. Security Model

### 6.1 Security Guarantees
- No minting capability after deployment
- No administrative control over token contract
- Deterministic ERC20 behavior
- No hidden or backdoor logic in token contract

### 6.2 Trust Assumptions
- Security of multisig wallets
- Correct execution of deployment scripts
- Integrity of off-chain distribution logic
- Honest participation of governance operators (if any multisig governance exists)

### 6.3 Limitations
- No on-chain governance enforcement exists in current version
- Distribution correctness depends on off-chain processes
- Treasury operations depend on multisig security model

---

## 7. System Classification

PNJC is classified as:

> A fixed-supply ERC-20 token system with modular off-chain governed ecosystem components and multisig-controlled treasury operations.

---

## 8. Version Status

- Protocol Version: v1
- Governance Model: Off-chain multisig
- Upgradeability: None
- Deployment Stage: Phase 1 (Core Infrastructure)
