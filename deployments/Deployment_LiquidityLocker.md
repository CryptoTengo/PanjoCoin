# PNJC Liquidity Locker V2 — Deployment Guide

## 1. Purpose

This document describes the deployment procedure for `PNJCLiquidityLockerV2`, an immutable smart contract used to lock Uniswap V2 LP tokens for a fixed period.

The goal of this deployment guide is to ensure the process is:
- reproducible,
- auditable,
- deterministic,
- and suitable for production handoff.

This guide is intended for developers, operators, auditors, and reviewers.

## 2. Scope

### 2.1 In Scope
- Deployment of the locker contract.
- Verification of the deployed source code.
- Recording of constructor parameters.
- Publication of deployment metadata.
- Post-deployment validation.

### 2.2 Out of Scope
- LP token provisioning.
- Liquidity creation on Uniswap.
- Treasury operations.
- PNJC token supply management.
- Governance actions.
- Any contract upgrades or parameter changes after deployment.

## 3. Contract Overview

`PNJCLiquidityLockerV2` is an immutable custody contract for a single Uniswap V2 LP ERC-20 token.

The contract:
- accepts one LP token address at deployment,
- locks LP tokens for a specified duration,
- releases them only after the unlock time,
- and exposes public lock status for verification.

## 4. Deployment Preconditions

Before deployment, the following conditions MUST be satisfied:

- The source code MUST be finalized and frozen.
- The test suite MUST pass.
- The compiler version MUST be pinned.
- The constructor arguments MUST be confirmed.
- The target LP token address MUST be verified.
- The deployment network MUST be selected and documented.
- The deployer wallet MUST be funded with sufficient native gas token.
- The exact commit hash or release tag MUST be recorded.
- No unreviewed code changes MUST remain pending.

## 5. Required Inputs

The deployer MUST prepare the following values:

- `creator`: the reference address for project attribution.
- `lpToken`: the Uniswap V2 LP token address to be locked.
- `network`: deployment network name.
- `chainId`: target chain ID.
- `deployerPrivateKey`: deployment key or equivalent secure signing method.
- `compilerVersion`: Solidity compiler version.
- `optimizerEnabled`: compiler optimization setting.
- `optimizerRuns`: optimizer run count.
- `commitHash`: source code revision identifier.

## 6. Security Checks Before Deployment

The following checks SHOULD be completed before deployment:

- Verify that `creator` is non-zero.
- Verify that `lpToken` is non-zero.
- Verify that `lpToken` is the intended Uniswap V2 LP token.
- Verify that the compiled bytecode matches the intended source.
- Verify that the deployment wallet is the correct wallet.
- Verify that the deployment network is correct.
- Verify that no admin or upgrade paths exist in the final bytecode.
- Verify that test coverage includes lock and withdrawal flows.

## 7. Deployment Runbook

### Step 1 — Freeze the source
Confirm that the contract source, README, SPEC, and tests are finalized.

### Step 2 — Compile
Compile the contract using the pinned Solidity version and optimizer settings.

### Step 3 — Run tests
Execute the full test suite and confirm all tests pass.

### Step 4 — Prepare constructor arguments
Set:
- `creator = <creator address>`
- `lpToken = <Uniswap V2 LP token address>`

### Step 5 — Deploy
Deploy the contract to the selected network using the approved deploy script.

### Step 6 — Record deployment output
Capture:
- deployed contract address,
- transaction hash,
- block number,
- deployment timestamp,
- constructor arguments,
- compiler settings.

### Step 7 — Verify source
Submit the exact source code and constructor arguments to the block explorer verification service.

### Step 8 — Post-deployment validation
Confirm on-chain that:
- the contract is deployed at the expected address,
- immutable variables are correct,
- `version()` returns the expected string,
- `positionManager()` returns the expected LP token address,
- `lockStatus(0)` returns `Empty` for a fresh deployment.

## 8. Deployment Parameters

Fill these values before deployment:

```text
Network: [fill in]
Chain ID: [fill in]
Compiler version: 0.8.34
Optimizer: [enabled/disabled]
Optimizer runs: [fill in]
Creator: [fill in]
LP token: [fill in]
Deployer address: [fill in]
Commit hash: [fill in]
```

## 9. Expected Deployment Artifacts

The deployment package MUST include:

- `PNJCLiquidityLockerV2.sol`
- `README.md`
- `SPEC.md`
- deployment script
- test suite
- constructor arguments
- transaction hash
- deployed contract address
- compiler settings
- verification link
- commit hash

## 10. Post-Deployment Validation

After deployment, verify the following:

- `creator` matches the intended value.
- `lpToken` matches the intended LP token.
- `version()` returns the expected version string.
- `contractVersion()` returns the same version string.
- `positionManager()` returns the LP token address.
- `lockCount` is zero immediately after deployment.
- No lock exists before any deposit.
- The contract source is verified on the explorer.

## 11. Acceptance Criteria

Deployment is considered successful only if all of the following are true:

- the contract is deployed on the intended network,
- the deployed address is recorded,
- the source is verified,
- the constructor parameters are correct,
- the test suite passed before deployment,
- and the post-deployment checks match the expected values.

If any of these conditions fail, the deployment MUST be treated as incomplete.

## 12. Rollback and Recovery

This contract is immutable and cannot be upgraded or patched after deployment.

Therefore, rollback means:
- halting downstream usage,
- documenting the issue,
- deploying a corrected replacement contract if needed,
- and updating all references to the new address.

The contract itself does not support emergency rollback.

## 13. Change Control

After deployment:
- the source code MUST remain frozen,
- documentation MUST remain synchronized with the deployed bytecode,
- any future version MUST be published as a new contract version,
- and the original deployment record MUST remain intact.

## 14. Verification Notes

The verification process MUST use:
- the exact source files,
- the exact compiler version,
- the exact optimizer settings,
- and the exact constructor arguments.

Any mismatch can cause verification failure or inaccurate public records.

## 15. Operational Handoff

Before production use, the following should be handed off to stakeholders:

- deployment summary,
- contract address,
- verification link,
- README,
- SPEC,
- test report,
- and known limitations.

## 16. Final Statement

`PNJCLiquidityLockerV2` is intended to be deployed as a frozen, immutable, and publicly verifiable LP token locker.

The deployment must be treated as a controlled release with full traceability and no post-deployment administrative control.
