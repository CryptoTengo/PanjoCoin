# PanjoCoin (PNJC) Frontend

## Overview
This directory contains the frontend application for the PanjoCoin ecosystem.
The live website is available at https://cryptotengo.netlify.app and provides a user-friendly interface for accessing PNJC token information, ecosystem documentation, and community resources, with additional decentralized application features planned for future releases.

## Status
**The core website is live and deployed** (RU / EN / GE, full i18n support), including:
* Trilingual public website with up-to-date token contract address (0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF)
* Panjo Runner — HTML5 browser game

The following planned features have **not yet been built**:
* Wallet connectivity (MetaMask / WalletConnect)
* On-chain token/holder analytics dashboard
* Staking, governance, and treasury-transparency dashboards
* Charity reporting interface (see Whitepaper Section 4.3, "ClownCare Bridge" — design phase)

## Objectives
* Provide public access to ecosystem information ✅ Live
* Enable wallet connectivity ⏳ Planned
* Display token and ecosystem analytics ⏳ Planned
* Support future staking and governance modules ⏳ Planned (modules not yet deployed on-chain — see Whitepaper Section 8.1)
* Increase transparency and accessibility ✅ Ongoing

## Live Features
### Public Website
* Trilingual (Russian / English / Georgian), full i18n
* Token contract address and PolygonScan link
* Project documentation and roadmap

### Panjo Runner
* HTML5 browser game featuring the Panjo character

## Planned Features

### Wallet Integration
* MetaMask support
* WalletConnect support
* Polygon network support

### Token Dashboard
* Contract information
* Supply information
* Holder statistics
* Ecosystem overview

### Ecosystem Access
* Documentation portal (partially live via main website)
* Roadmap tracking
* Community resources

### Future Features (require on-chain modules not yet deployed — see Whitepaper Section 8.1)
* Staking dashboard
* Governance portal (depends on DAO Governor deployment)
* Treasury transparency dashboard (depends on TreasuryVault deployment)
* Charity reporting interface (depends on ClownCare Bridge — design phase, Q2 2027 per roadmap)

## Planned Technology Stack
* React
* TypeScript
* Ethers.js
* WalletConnect
* Polygon Network

## Note on Documentation Accuracy
This README previously stated that frontend development had not started. That was inaccurate — the public website and game are live. Status fields in this document should be kept in sync with the "Current Project Status" table in the main repository README, per the Whitepaper's documented source-of-truth hierarchy (Whitepaper Section 14).
