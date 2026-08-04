# PanjoCoin (PNJC) — Test Suite

## Overview
This directory documents the testing status and validation procedures for the PanjoCoin (PNJC) smart contract ecosystem.
The PanjoCoin (PNJC) token is deployed on the Polygon network as an ERC-20 token and its source code is publicly available and verified on PolygonScan.

## Current Status
Internal testing (Hardhat) of the PanjoCoin token contract was completed prior to deployment, covering core ERC-20 behavior, ERC20Burnable, and ERC20Permit (EIP-2612) functionality. These test scripts have not yet been published to this repository.

**A public, reproducible automated test suite has not yet been published here.** Publishing the existing Hardhat test scripts, and expanding them for the remaining five modules, is planned — see Future Releases below.

This distinction matters: internal testing during development is not a substitute for a published, independently reproducible test suite or a professional third-party audit. Per the Whitepaper (Section 9.2), independent audits (CertiK / Hacken) for all six contracts have not yet started.

## Future Releases
Planned additions to this directory:
* Publication of the existing Hardhat unit tests for the PanjoCoin token contract
* Integration tests across the full contract ecosystem
* Security validation scripts
* Gas usage analysis
* Regression testing suite, run on every future change

## Planned Test Coverage

### ERC-20 Compliance
* Token name verification
* Token symbol verification
* Decimals verification
* Total supply verification

### Transfer Functionality
* Standard token transfers
* Balance updates
* Transfer event emission

### Approval & Allowance
* Approve functionality
* Allowance tracking
* transferFrom execution
* ERC20Permit (EIP-2612) signature-based approval flow

### Security Validation
* Unauthorized access prevention
* Overflow/underflow protection
* Invalid transfer handling

### Future Ecosystem Components (not yet deployed)
The following modules are code-complete but not yet deployed to mainnet (see Whitepaper Section 8.1 / README status table for live deployment status). Each will require its own dedicated test suite, published before mainnet deployment, per the project's audit-first policy:
* PNJCLiquidityLockerV2
* PNJCVestingVault
* PNJCMerkleAirdrop
* PNJCTreasuryVault
* DAO Governor

## Development Goal
The objective of this directory is to maintain transparent and verifiable testing standards as the PanjoCoin ecosystem evolves, and to keep this documentation in sync with the deployment and audit status reported in the Whitepaper and main repository README.

## Disclaimer
This directory is intended for development and testing documentation purposes only. It does not constitute, and should not be interpreted as, a completed independent security audit. Test coverage will expand as new ecosystem components are introduced and deployed.
