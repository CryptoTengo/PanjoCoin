## Smart Contract Specification
PanjoCoin (PNJC)
Version: 1.1 (Updated)
Date: July 25, 2026
Network: Polygon PoS
Token Standard: ERC-20 (ERC20Burnable + ERC20Permit)
Solidity Version: 0.8.36
Framework: OpenZeppelin Contracts v5.5.0
Contract Address: 0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF

## 1. Purpose
This document defines the technical specification of the PanjoCoin (PNJC) smart contract.

The specification describes:

Contract architecture;

Functional requirements;

Security requirements;

Token mechanics;

Transaction logic;

Administrative limitations;

External integrations;

Future ecosystem compatibility.

## 2. Contract Overview
PanjoCoin is a decentralised ERC-20 utility token deployed on Polygon PoS.

The smart contract provides:

Feature	Description
Fixed Token Supply	1 trillion PNJC, no minting.
ERC-20 Compatibility	Standard token functions.
ERC20Burnable	Optional user-driven burning.
ERC20Permit (EIP-2612)	Gasless approvals via signed messages.
Zero Transfer Tax	0% on all transactions.
Ownerless Design	No admin keys or central control.
Non-Upgradeable	Immutable contract.
DEX Compatibility	Uniswap V2 compatible.
## 3. Technical Stack
Component	Specification
Blockchain	Polygon PoS
Language	Solidity
Version	0.8.36
Token Standard	ERC-20 + ERC20Burnable + ERC20Permit
Libraries	OpenZeppelin v5.5.0
Decimal Places	18
Upgradeability	Disabled
Minting	Disabled
## 4. Token Parameters
Token Information
Parameter	Value
Name	PanjoCoin
Symbol	PNJC
Standard	ERC-20 + ERC20Burnable + ERC20Permit
Decimals	18
Maximum Supply	1,000,000,000,000 PNJC
Supply Type	Fixed
Transfer Tax	0%
Owner	None (ownerless)
## 5. Supply Specification
Initial Supply
At deployment: 1,000,000,000,000 PNJC (1 trillion)

The contract does not include:

Feature	Status
Public Mint Function	❌ Absent
Owner Mint Capability	❌ Absent
Inflation Mechanism	❌ Absent
Supply Increase	❌ Impossible
On-Chain Verification:

maxSupply() returns 1000000000000000000000000;

No mint() function exists in the contract code.

## 6. Core Contract Requirements
6.1. ERC-20 Compliance
The contract MUST implement:

Function	Description
totalSupply()	Returns total token supply.
balanceOf(address)	Returns token balance of an address.
transfer(address, uint256)	Transfers tokens.
transferFrom(address, address, uint256)	Transfers with allowance.
approve(address, uint256)	Approves spending.
allowance(address, address)	Returns remaining allowance.
6.2. ERC20Burnable Extension
The contract MUST implement:

Function	Description
burn(uint256)	Burns the caller's own tokens.
burnFrom(address, uint256)	Burns tokens from another address (with allowance).
6.3. ERC20Permit Extension (EIP-2612)
The contract MUST implement:

Function	Description
permit(address, address, uint256, uint256, uint8, bytes32, bytes32)	Gasless approvals via signed messages.
Required Behavior
Standard wallet compatibility (MetaMask, Trust Wallet, etc.);

DEX compatibility (Uniswap V2);

Web3 application compatibility.

## 7. Transfer Logic Specification
Normal Transfer Flow
text
Sender
    │
    ▼
Transfer Request
    │
    ▼
PNJC Contract
    │
    ▼
Balance Validation
    │
    ▼
Zero Tax (0%)
    │
    ▼
Recipient Balance Update
    │
    ▼
Transfer Event Emitted
Key Characteristics
Characteristic	Value
Transfer Tax	0%
Buy Tax	0%
Sell Tax	0%
Hidden Fees	None
Implementation:

No custom tax logic in _update() or _transfer() functions;

Standard OpenZeppelin ERC20 transfer logic.

## 8. Burn Mechanism Specification
Overview
The burn mechanism:

Feature	Description
Type	Optional, user-driven
Control	Token holders only
Permanence	Irreversible
Tax	None (0% burn tax)
Transparency	All burns on-chain
Functions
Function	Description	Access
burn(uint256 amount)	Burns caller's tokens.	Public
burnFrom(address account, uint256 amount)	Burns tokens with allowance.	Public
Burn Destination
Burned tokens are sent to the standard irreversible burn address:

0x000000000000000000000000000000000000dEaD

Properties:

No private key control;

No recovery possibility;

Permanent supply reduction.

Total Burned Tracking
Function	Description	Returns
totalBurned()	Total tokens burned.	uint256
## 9. Permit Specification (EIP-2612)
Overview
The permit function enables gasless approvals:

Feature	Description
Standard	EIP-2612
Purpose	Gasless approvals via signed messages
Benefits	Improved UX, reduced transaction costs
Function Signature
solidity
function permit(
    address owner,
    address spender,
    uint256 value,
    uint256 deadline,
    uint8 v,
    bytes32 r,
    bytes32 s
) external;
Parameters
Parameter	Description
owner	Token owner address.
spender	Address allowed to spend.
value	Amount allowed.
deadline	Expiration timestamp.
v, r, s	Signature components.
## 10. Security Requirements
10.1. No Hidden Control Functions
The contract MUST NOT contain:

Feature	Status
Hidden Minting	❌ Absent
Hidden Blacklist	❌ Absent
Unauthorised Freezing	❌ Absent
Arbitrary Balance Modification	❌ Absent
Admin-Controlled Functions	❌ Absent
10.2. Ownership Restrictions
The contract does NOT allow the owner to:

Action	Status
Mint Tokens	❌
Increase Supply	❌
Freeze Wallets	❌
Block Users	❌
Change Balances	❌
Modify Contract	❌
Upgrade Contract	❌
Reason: The contract is fully ownerless (owner = address(0)).

10.3. Security Measures
Measure	Status	Description
OpenZeppelin 5.5.0	✅	Industry-standard audited libraries.
ReentrancyGuard	✅	Prevents reentrancy attacks.
No selfdestruct	✅	Contract cannot be destroyed.
No delegatecall	✅	No proxy or upgrade patterns.
No upgradeability	✅	Contract is immutable.
No owner (token)	✅	No administrative controls.
Zero tax	✅	No hidden fees.
Code verified	✅	PolygonScan (Exact Match).
## 11. Administrative Functions
Allowed Administrative Operations
The contract has no administrative functions.

Function	Status
Configuration Management	❌ None
Tax Wallet Updates	❌ Not applicable (0% tax)
Security Parameters	❌ None
Emergency Protections	❌ None
All sensitive changes are impossible due to the ownerless, non-upgradeable design.

## 12. Event Specification
12.1. Transfer Event
solidity
event Transfer(
    address indexed from,
    address indexed to,
    uint256 value
);
12.2. Approval Event
solidity
event Approval(
    address indexed owner,
    address indexed spender,
    uint256 value
);
12.3. InitialSupplyMinted Event
solidity
event InitialSupplyMinted(
    address indexed receiver,
    uint256 amount
);
Purpose: Emitted once at deployment when the total supply is minted.

## 13. Gas Optimization Requirements
The contract should:

Requirement	Description
Minimise Storage Writes	Use efficient data structures.
Use Efficient Solidity Patterns	Follow OpenZeppelin best practices.
Avoid Unnecessary External Calls	Minimise gas costs.
Follow OpenZeppelin Best Practices	Use audited, gas-optimised libraries.
Current Gas Efficiency:

Standard ERC20 with minimal functions;

No complex tax calculations;

No external dependencies beyond OpenZeppelin.

## 14. External Compatibility
Wallets
Wallet	Compatibility
MetaMask	✅
Trust Wallet	✅
WalletConnect	✅
Phantom	✅
Other EVM Wallets	✅
DEX
DEX	Compatibility
Uniswap V2	✅
SushiSwap	✅
QuickSwap	✅
Other DEXs	✅
Analytics
Platform	Compatibility
PolygonScan	✅
DEX Analytics	✅
Dune Analytics	✅ (Planned)
## 15. Testing Requirements
15.1. Unit Testing
Required tests:

Test	Description
Transfer Tests	Standard transfers.
Burn Tests	burn() and burnFrom() functionality.
Permit Tests	Gasless approval functionality (EIP-2612).
Supply Tests	Fixed supply verification.
Ownerless Tests	No administrative functions.
15.2. Security Testing
Required:

Test	Description
Static Analysis	Slither, Mythril.
Reentrancy Testing	ReentrancyGuard verification.
Access Control Testing	No owner functions.
Gas Analysis	Optimisation verification.
Tools:

Hardhat for testing;

Chai for assertions;

Ethers.js for blockchain interaction.

## 16. Audit Requirements
Recommended Audit Process
Phase 1 — Automated Scanning

Slither;

Mythril;

Foundry tests.

Phase 2 — Professional Review

Recommended auditors:

CertiK;

Hacken;

Quantstamp.

Audit Schedule
Contract	Auditor	Timeline
PanjoCoin (token)	CertiK	Q2 2026
PNJCLiquidityLockerV2	CertiK	Q2 2026
PNJCVestingVault	CertiK / Hacken	Q3 2026
MerkleAirdrop	CertiK / Hacken	Q2 2026
PNJCTreasuryVault	CertiK / Hacken	Q3 2026
DAO Governor	CertiK / Hacken	Q4 2026
## 17. Deployment Requirements
Deployment Checklist
Step	Status
☑ Contract compiled successfully	✅
☑ All tests passed	✅
☑ Source verified on PolygonScan	✅
☑ Token parameters confirmed	✅
☑ No ownership configured (ownerless)	✅
☑ Liquidity prepared (Uniswap V2)	✅
☑ Documentation published	✅
☑ Audits scheduled	✅
## 18. Version Control
Feature	Status
Contract Upgrades	❌ Impossible
Contract Modifications	❌ Impossible
Major Changes	New contract deployment required
Migration Plan	Required for changes
The PNJC core token contract is intended to remain immutable.

## 19. Future Extensions
19.1. DAO Governance Contract (Q4 2026)
Function	Description
Proposal Creation	Community-driven proposals.
Voting	Token-based voting.
Treasury Management	DAO-controlled funds.
19.2. ClownCare Bridge (Q2 2027)
Function	Description
Charity Fund Distribution	Transparent on-chain donations.
Reporting	Public verification.
19.3. ONE+ Gaming Platform (Q3 2027)
Function	Description
In-Game Economy	PNJC for purchases and rewards.
NFT Integration	Digital assets and collectibles.
19.4. Proof of Kindness
Function	Description
Impact Verification	Positive action validation.
Reward Distribution	Ecosystem incentives.
## 20. Compliance Considerations
The smart contract design supports:

Requirement	Description
Transparency	All code and transactions public.
Investor Due Diligence	Clear tokenomics and documentation.
Regulatory Review	Utility-focused design.
MiCA Compliance	Prepared for regulatory frameworks.
The token does not provide:

Ownership rights;

Equity claims;

Guaranteed returns.

## 21. Comparison: Specification vs. Actual Contract
Parameter	Specification Value	Contract Implementation	Status
Token Name	PanjoCoin	ERC20("PanjoCoin", "PNJC")	✅
Ticker	PNJC	✅	✅
Standard	ERC-20 + Burnable + Permit	Inherits all three	✅
Total Supply	1,000,000,000,000	MAX_SUPPLY = 1_000_000_000_000 * 10**18	✅
Decimals	18	ERC20 default (18)	✅
Transfer Tax	0%	No custom tax logic	✅
Owner	None (ownerless)	No Ownable inheritance	✅
Mint Function	❌	❌ Not implemented	✅
Upgradeability	❌	❌ No proxy	✅
Burn Function	✅	✅ burn() and burnFrom()	✅
Permit Function	✅	✅ EIP-2612	✅
Code Verification	✅	✅ PolygonScan (Exact Match)	✅
## 22. Final Statement
The PanjoCoin smart contract specification defines a secure, transparent, and scalable ERC-20 implementation designed for a utility-driven ecosystem.

The architecture prioritises:

Priority	Description
Fixed Supply	No inflation, no hidden emissions.
Security	Ownerless, non-upgradeable, OpenZeppelin.
Transparency	Verified code, public GitHub.
Decentralisation	No admin keys or central control.
Zero Tax	0% on all transactions.
Optional Burning	User-driven supply reduction.
Gasless Approvals	EIP-2612 permit functionality.
Community-Driven Growth	DAO roadmap for governance.
Disclaimer
This document is provided for informational purposes only.

It does not constitute:

Investment advice;

Financial advice;

Legal advice;

Tax advice;

An offer to sell securities;

A solicitation to purchase financial instruments.

Participation in blockchain ecosystems involves significant risks. Individuals should conduct independent research and seek professional advice where appropriate before making financial or legal decisions.

Document Information
Property	Value
Document	Smart Contract Specification
Version	1.1 (Updated)
Date	July 25, 2026
Status	Official
© 2026 PanjoCoin (PNJC) / CryptoTengo. All rights reserved.
Document Version: 1.1 (Updated)
Last Updated: July 25, 2026
