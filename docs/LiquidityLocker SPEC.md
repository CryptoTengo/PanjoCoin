# PNJC Liquidity Locker V2 — Technical Specification

## 1. Document Purpose

This document defines the functional and security requirements for `PNJCLiquidityLockerV2`, an immutable smart contract designed to lock Uniswap V2-style ERC-20 LP tokens for a fixed period of time.

The purpose of this specification is to provide a single technical reference for developers, auditors, and stakeholders.

This document describes:
- the contract scope,
- assumptions,
- supported asset type,
- functional requirements,
- security properties,
- failure modes,
- and expected behavior of all public functions.

## 2. System Overview

`PNJCLiquidityLockerV2` is a custody contract that holds a single ERC-20 LP token type in escrow until a predefined unlock timestamp is reached.

The contract is intentionally minimal and immutable.

It does not:
- mint tokens,
- burn tokens,
- manage PNJC supply,
- support NFTs,
- implement governance,
- implement administrative overrides,
- or provide emergency recovery functions.

## 3. Scope

### 3.1 In Scope
- Locking a single Uniswap V2 LP ERC-20 token.
- Storing lock metadata on-chain.
- Allowing withdrawal only after the unlock time.
- Emitting traceable events for public verification.
- Exposing status and lock detail view functions.

### 3.2 Out of Scope
- ERC-20 PNJC token issuance or supply management.
- Uniswap V3 NFT position locking.
- Treasury operations.
- Governance voting.
- Liquidity management.
- Fee collection.
- Emergency withdrawals.
- Asset rescue functionality.
- Cross-chain locking.

## 4. Actors

### 4.1 Lock Creator
The entity deploying the contract. The creator address is stored immutably for reference only.

### 4.2 Lock Owner / Depositor
The wallet that approves and deposits LP tokens into the locker.

### 4.3 Beneficiary
The wallet that is entitled to withdraw the locked LP tokens after the unlock time.

### 4.4 External Observers
Indexers, explorers, auditors, and investors who monitor lock state using public view functions and emitted events.

## 5. External Dependencies

The contract depends on:
- OpenZeppelin `IERC20`
- OpenZeppelin `SafeERC20`
- OpenZeppelin `ReentrancyGuard`

The contract assumes the LP token behaves like a standard ERC-20 token.

The contract does not rely on oracle data, off-chain signatures, or upgradeable proxies.

## 6. Assumptions

The following assumptions are required for correct operation:

- The configured LP token is a valid ERC-20 token.
- The LP token supports standard `transferFrom` and `transfer` semantics.
- The LP token does not require custom callbacks for normal transfers.
- The beneficiary can receive ERC-20 tokens.
- The deployer provides correct constructor parameters.
- Unlock time is expressed as a Unix timestamp.
- Block timestamp is sufficiently reliable for lock timing purposes.

## 7. Design Principles

The contract follows these principles:
- minimal trusted surface area,
- immutable configuration,
- deterministic unlock logic,
- explicit on-chain custody,
- reentrancy resistance,
- and simple auditability.

The contract intentionally avoids mutable administrative controls to reduce governance risk and attack surface.

## 8. Functional Requirements

### 8.1 Deployment
- The contract MUST be deployed with a non-zero creator address.
- The contract MUST be deployed with a non-zero LP token address.
- The deployed LP token address MUST remain immutable.

### 8.2 Locking
- A user MUST be able to lock LP tokens by calling `lock`.
- The user MUST approve the contract before locking.
- The deposited amount MUST be greater than zero.
- The beneficiary address MUST be non-zero.
- The unlock time MUST be strictly greater than the current block timestamp.
- The contract MUST transfer LP tokens into custody before recording the lock state.
- The contract MUST emit a `LiquidityLocked` event after a successful lock.

### 8.3 Withdrawal
- Only the designated beneficiary MUST be able to call `withdraw`.
- Withdrawal MUST fail before the unlock time.
- Withdrawal MUST fail if the lock has already been withdrawn.
- Withdrawal MUST transfer the exact locked LP token amount to the beneficiary.
- The contract MUST mark the position as withdrawn before performing the external transfer.
- The contract MUST emit a `LiquidityWithdrawn` event after successful withdrawal.

### 8.4 Status Inspection
- The contract MUST expose the current lifecycle state of each lock.
- The contract MUST expose time remaining until unlock.
- The contract MUST expose the full lock record for public inspection.

## 9. State Variables

### 9.1 Immutable Variables
- `creator`: deployment reference address.
- `lpToken`: accepted LP token address.
- `VERSION`: semantic version string.

### 9.2 Mutable Variables
- `lockCount`: total number of created locks.
- `_locks`: mapping from `lockId` to `LockPosition`.

## 10. Data Structures

### 10.1 LockPosition
Each lock record contains:
- `lpToken`: the locked ERC-20 LP token address.
- `beneficiary`: the address allowed to withdraw after unlock.
- `amount`: the locked LP token amount.
- `unlockTime`: the Unix timestamp after which withdrawal is allowed.
- `withdrawn`: a boolean flag indicating whether the lock has already been withdrawn.

## 11. Public Interface Specification

### 11.1 `lock(amount, beneficiary, unlockTime)`
Creates a new lock and transfers LP tokens into custody.

#### Preconditions
- `amount > 0`
- `beneficiary != address(0)`
- `unlockTime > block.timestamp`
- caller has sufficient LP token balance
- caller has approved the contract

#### Postconditions
- LP tokens are transferred into the contract.
- A new lock record is stored.
- `lockCount` is incremented.
- `LiquidityLocked` is emitted.

### 11.2 `withdraw(lockId)`
Releases locked LP tokens to the beneficiary after unlock.

#### Preconditions
- lock exists
- caller is the beneficiary
- lock is not already withdrawn
- current time is at or after unlock time

#### Postconditions
- `withdrawn` is set to true.
- LP tokens are transferred to the beneficiary.
- `LiquidityWithdrawn` is emitted.

### 11.3 `version()`
Returns the semantic version string.

### 11.4 `contractVersion()`
Returns the same semantic version string as `version()`.

### 11.5 `positionManager()`
Returns the accepted LP token address.

This function exists as a project-wide interface alias, even though Uniswap V2 uses an ERC-20 LP token rather than a nonfungible position manager.

### 11.6 `lockStatus(lockId)`
Returns the lifecycle state of the lock.

Possible values:
- `Empty`
- `Locked`
- `Unlocked`
- `Withdrawn`

### 11.7 `timeRemaining(lockId)`
Returns the number of seconds remaining until unlock.

Returns zero if:
- the lock does not exist,
- the lock is already withdrawn,
- or the lock is already unlocked.

### 11.8 `isLocked(lockId)`
Returns true if the lock is active and not yet withdrawable.

### 11.9 `isUnlocked(lockId)`
Returns true if the unlock time has passed.

### 11.10 `isWithdrawn(lockId)`
Returns true if the LP tokens have already been released.

### 11.11 `getLock(lockId)`
Returns the full lock record.

## 12. Status Model

### 12.1 Empty
The `lockId` has never been created.

### 12.2 Locked
The lock exists, tokens are in custody, and unlock time has not yet been reached.

### 12.3 Unlocked
The unlock time has passed and withdrawal is available.

### 12.4 Withdrawn
The LP tokens have already been released to the beneficiary.

## 13. Security Requirements

### 13.1 Reentrancy Protection
All state-changing public functions MUST be protected by `nonReentrant`.

### 13.2 CEI Pattern
The contract MUST follow Checks-Effects-Interactions:
1. validate inputs,
2. update state,
3. perform external transfer.

### 13.3 No Privileged Access
The contract MUST NOT contain:
- owner roles,
- admin roles,
- pausable control,
- upgradeability,
- rescue functions,
- emergency withdrawal hooks.

### 13.4 Deterministic Custody
The contract MUST hold LP tokens until the unlock timestamp is reached.

### 13.5 Single Asset Model
The contract MUST accept only the configured LP token address.

## 14. Event Requirements

### 14.1 LiquidityLocked
MUST be emitted when a lock is created.

The event MUST include:
- `lockId`
- `lpToken`
- `beneficiary`
- `amount`
- `unlockTime`

### 14.2 LiquidityWithdrawn
MUST be emitted when a lock is released.

The event MUST include:
- `lockId`
- `beneficiary`
- `amount`

## 15. Invariants

The following invariants MUST hold:

- `lockCount` increases monotonically.
- A lock record cannot be edited after creation except for `withdrawn`.
- A withdrawn lock cannot be withdrawn again.
- A lock cannot be withdrawn before unlock time.
- The contract never mints LP tokens.
- The contract never burns LP tokens.
- The contract never changes the accepted LP token address after deployment.

## 16. Failure Modes

### 16.1 Invalid Deployment Parameters
If deployment parameters are invalid, deployment MUST revert.

### 16.2 Invalid Lock Parameters
If `amount` is zero, `beneficiary` is zero, or `unlockTime` is invalid, `lock` MUST revert.

### 16.3 Insufficient Balance or Approval
If the caller lacks sufficient LP balance or approval, `lock` MUST revert.

### 16.4 Unauthorized Withdrawal
If a non-beneficiary attempts withdrawal, `withdraw` MUST revert.

### 16.5 Early Withdrawal
If the unlock time has not been reached, `withdraw` MUST revert.

### 16.6 Duplicate Withdrawal
If the lock has already been withdrawn, `withdraw` MUST revert.

## 17. Non-Functional Requirements

- The contract SHOULD be easy to audit.
- The contract SHOULD remain minimal.
- The contract SHOULD be deterministic.
- The contract SHOULD be readable by external reviewers.
- The contract SHOULD expose enough view functions for indexers and dashboards.

## 18. Compatibility Notes

This contract is compatible with:
- Uniswap V2-style LP ERC-20 tokens,
- forks of Uniswap V2 that use standard ERC-20 LP token mechanics.

This contract is not compatible with:
- Uniswap V3 NFT positions,
- fee-on-transfer LP tokens unless explicitly tested,
- non-standard token callbacks.

## 19. Audit Checklist Mapping

Reviewers SHOULD verify:
- constructor validation,
- lock parameter validation,
- withdrawal authorization,
- withdrawal timing,
- withdrawal idempotence,
- reentrancy safety,
- event correctness,
- storage correctness,
- and immutability of configuration.

## 20. Version Status

- Contract Name: `PNJCLiquidityLockerV2`
- Protocol Role: ERC-20 LP token locker
- Upgradeability: None
- Admin Model: None
- Deployment Stage: Production / audit-ready once verified and tested

## 21. Final Statement

`PNJCLiquidityLockerV2` is a minimal, immutable, and deterministic custody contract for Uniswap V2 LP ERC-20 tokens.

The contract is designed to make liquidity locking transparent, verifiable, and easy to review by both auditors and investors.
