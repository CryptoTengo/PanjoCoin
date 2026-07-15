# Smart Contract Specification

## PanjoCoin (PNJC)

**Version:** 1.0  
**Date:** July 2026  
**Network:** Polygon PoS  
**Token Standard:** ERC-20  
**Solidity Version:** 0.8.34  
**Framework:** OpenZeppelin Contracts v5  

**Contract Address:**
0x781C0d15347Cb0B94C42C65c7a67E70371205De5

---

# 1. Purpose

This document defines the technical specification of the PanjoCoin (PNJC) smart contract.

The specification describes:

- Contract architecture
- Functional requirements
- Security requirements
- Token mechanics
- Transaction logic
- Administrative limitations
- External integrations
- Future ecosystem compatibility


---

# 2. Contract Overview

PanjoCoin is a decentralized ERC-20 utility token deployed on Polygon PoS.

The smart contract provides:

- Fixed token supply
- ERC-20 compatibility
- Automated ecosystem taxes
- Deflationary burn mechanism
- Charity allocation mechanism
- Anti-abuse protections
- DEX compatibility


---

# 3. Technical Stack

| Component | Specification |
|-|-|
| Blockchain | Polygon PoS |
| Language | Solidity |
| Version | 0.8.34 |
| Token Standard | ERC-20 |
| Libraries | OpenZeppelin v5 |
| Decimal Places | 18 |
| Upgradeability | Disabled |
| Minting | Disabled |


---

# 4. Token Parameters

## Token Information

| Parameter | Value |
|-|-|
| Name | PanjoCoin |
| Symbol | PNJC |
| Standard | ERC-20 |
| Decimals | 18 |
| Maximum Supply | 1,000,000,000,000 PNJC |
| Supply Type | Fixed |


---

# 5. Supply Specification

## Initial Supply

At deployment:
1,000,000,000,000 PNJC

The contract does not include:

- Public mint function
- Owner mint capability
- Inflation mechanism


---

# 6. Core Contract Requirements

## 6.1 ERC-20 Compliance

The contract MUST implement:

```solidity
totalSupply()

balanceOf()

transfer()

transferFrom()

approve()

allowance()
Required behavior:

Standard wallet compatibility
DEX compatibility
Web3 application compatibility
7. Transfer Logic Specification
Normal Transfer Flow
Sender
 |
 |
Transfer Request
 |
 |
PNJC Contract
 |
 |
Tax Calculation
 |
 |
Recipient Balance Update

8. Tax System Specification

The contract implements automated ecosystem taxes.

Current Parameters
Charity Tax
4%

Purpose:

Charity programs
Social impact activities
Proof of Kindness ecosystem
Burn Tax
3%

Purpose:

Reduce circulating supply
Create deflationary pressure
Total Active Tax
7%

Maximum protection:

MAX_TOTAL_TAX = 20%

The contract MUST prevent total taxes exceeding this limit.

9. Tax Processing Logic

Example:

Transfer:

1,000 PNJC

Calculation:

Charity:
40 PNJC


Burn:
30 PNJC


Receiver:
930 PNJC


Transaction result:

Sender:
-1000 PNJC

Charity Wallet:
+40 PNJC

Burn Address:
+30 PNJC

Receiver:
+930 PNJC

10. Burn Mechanism Specification

The burn mechanism:

Permanently removes tokens from circulation
Cannot create new tokens
Cannot restore burned supply

Burn destination:

Dead Address

Purpose:

Long-term scarcity
Deflationary token economics
11. Charity Mechanism Specification

The charity mechanism transfers allocated tokens to a designated charity wallet.

Requirements:

Transparent wallet address
Public transaction history
Blockchain verification

Usage:

Charity initiatives
Community impact programs
Social projects
12. Anti-Bot Protection

The contract includes trading protection mechanisms.

Cooldown

Maximum frequency:

60 seconds

Purpose:

Reduce automated manipulation
Protect early liquidity
13. Transaction Limits
Buy Limit

Maximum:

10,000,000 PNJC
Sell Limit

Maximum:

1,000,000 PNJC / 24 hours

Purpose:

Reduce market manipulation
Protect liquidity stability
14. Security Requirements

The smart contract MUST maintain:

No Hidden Control Functions

Forbidden:

Hidden minting
Hidden blacklist
Unauthorized freezing
Arbitrary balance modification
Ownership Restrictions

The contract does NOT allow:

Owner can:

❌ Mint tokens

❌ Increase supply

❌ Freeze wallets

❌ Block users

❌ Change balances

15. Administrative Functions

Allowed administrative operations:

Configuration Management

Limited to:

Tax wallet updates (if applicable)
Security parameters
Emergency protections

All sensitive changes MUST follow:

Multisig approval
Public disclosure
16. Event Specification

The contract emits standard ERC-20 events.

Transfer Event
event Transfer(
address indexed from,
address indexed to,
uint256 value
);
Approval Event
event Approval(
address indexed owner,
address indexed spender,
uint256 value
);
17. Gas Optimization Requirements

The contract should:

Minimize storage writes
Use efficient Solidity patterns
Avoid unnecessary external calls
Follow OpenZeppelin best practices
18. External Compatibility

The contract MUST support:

Wallets
MetaMask
WalletConnect
Phantom
DEX
QuickSwap
Uniswap V3
Analytics
PolygonScan
DEX analytics tools
19. Testing Requirements

Before production deployment:

Unit Testing

Required tests:

Transfer tests
Tax calculation tests
Burn tests
Charity tests
Limit tests
Security Testing

Required:

Static analysis
Reentrancy testing
Access control testing
Gas analysis
20. Audit Requirements

Recommended audit process:

Phase 1

Automated scanning:

Slither
Mythril
Foundry tests
Phase 2

Professional review:

Recommended:

CertiK
Hacken
Quantstamp
21. Deployment Requirements

Deployment checklist:

☑ Contract compiled successfully

☑ Tests passed

☑ Source verified

☑ Token parameters confirmed

☑ Ownership configured

☑ Liquidity prepared

☑ Documentation published

22. Version Control

Future changes:

Major contract changes require:

New contract deployment
Community announcement
Migration plan

The PNJC core token contract is intended to remain immutable.

23. Future Extensions

Future ecosystem contracts may include:

Proof of Kindness Contract

Functions:

Impact verification
Reward distribution
Community scoring
GameFi Contracts

Functions:

NFT integration
Player rewards
In-game economy
DAO Governance Contracts

Functions:

Proposal creation
Voting
Treasury management
24. Compliance Considerations

The smart contract design supports:

Transparency requirements
Investor due diligence
Regulatory review
VASP/MiCA documentation preparation

The token does not provide:

Ownership rights
Equity claims
Guaranteed returns
25. Final Statement

The PanjoCoin smart contract specification defines a secure, transparent, and scalable ERC-20 implementation designed for a SocialFi ecosystem.

The architecture prioritizes:

Fixed supply
Security
Transparency
Decentralization
Community-driven growth
