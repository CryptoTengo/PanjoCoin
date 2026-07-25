## Smart Contract Architecture
PanjoCoin (PNJC)
Version: 1.1 (Updated)
Date: July 25, 2026
Network: Polygon PoS
Standard: ERC-20 (ERC20Burnable + ERC20Permit)
Solidity Version: 0.8.36
Framework: OpenZeppelin Contracts v5.5.0
Contract Address: 0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF

## 1. Overview
PanjoCoin (PNJC) is a decentralised ERC-20 utility token deployed on the Polygon PoS network.

The smart contract architecture is designed with a focus on:

Security – OpenZeppelin libraries, ReentrancyGuard, no admin keys;

Transparency – Verified code on PolygonScan, public GitHub;

Decentralisation – Ownerless contract, no upgradeability;

Regulatory Readiness – Utility-focused design, clear documentation;

Community Governance – DAO roadmap for future decentralisation;

Long-Term Ecosystem Sustainability – Fixed supply, zero tax.

The contract implements a fixed supply model with no future minting capability and optional user-driven burning.

## 2. Architecture Principles
The PNJC smart contract architecture follows these core principles:

2.1. Immutable Supply
Total supply is permanently fixed at deployment:

Property	Value
Total Supply	1,000,000,000,000 PNJC
Mint Function	❌ Absent
Supply Increase	Impossible
Inflation	None
2.2. Ownerless Design
The contract has no owner (owner = address(0)).

Feature	Status
Owner	None
Admin Keys	None
Upgradeability	None
Emergency Functions	None
2.3. Zero Tax
All token transfers are tax-free.

Transaction Type	Tax
Buy	0%
Sell	0%
Transfer	0%
2.4. Transparency
All code is publicly verifiable.

Resource	Status
Code Verification	✅ PolygonScan (Exact Match)
Source Code	✅ Open Source (GitHub)
Documentation	✅ Public
2.5. Non-Upgradeable
Contracts are immutable once deployed.

Feature	Status
Proxy Pattern	❌ Not used
Upgrade Function	❌ Absent
Contract Modifications	Impossible
## 3. Smart Contract Inheritance
The PNJC token contract inherits from OpenZeppelin standards:

text
PanjoCoin
    │
    ├── ERC20 (OpenZeppelin)
    │       │
    │       └── IERC20, IERC20Metadata
    │
    ├── ERC20Burnable (OpenZeppelin)
    │       │
    │       └── Burn Functionality
    │
    └── ERC20Permit (OpenZeppelin, EIP-2612)
            │
            └── Gasless Approvals
Inheritance Benefits
Standard	Functionality
ERC20	Core token functionality (transfers, balances, approvals).
ERC20Burnable	Optional user-driven token burning via burn() and burnFrom().
ERC20Permit	Gasless approvals using signed messages (EIP-2612).
## 4. Core Contract Features
4.1. Fixed Supply
Property	Value
MAX_SUPPLY	1_000_000_000_000 * 10**18
Total Supply	1,000,000,000,000 PNJC
Mint Function	❌ Not implemented
Supply Increase	Impossible
On-Chain Verification:

maxSupply() returns 1000000000000000000000000 (1 trillion with 18 decimals);

No mint() function exists in the contract code.

4.2. Zero Transaction Tax
Feature	Status
Transfer Tax	0%
Buy Tax	0%
Sell Tax	0%
Hidden Fees	None
Implementation:

No custom tax logic in _update() or _transfer() functions;

Standard OpenZeppelin ERC20 transfer logic.

4.3. Optional Burning
Feature	Status
Burn Function	✅ burn(uint256 amount)
BurnFrom Function	✅ burnFrom(address account, uint256 amount)
Burn Tax	0% (no automatic burning)
Total Burned	totalBurned() view function
Implementation:

Inherited from ERC20Burnable;

User-initiated and optional;

All burns are on-chain and verifiable.

4.4. Gasless Approvals (Permit)
Feature	Status
Permit Function	✅ permit(address owner, ...)
Standard	EIP-2612
Purpose	Gasless approvals via signed messages
Benefits:

Improved user experience;

Reduced transaction costs;

Enables meta-transactions.

## 5. Contract Functions
5.1. Public View Functions
Function	Description	Returns
maxSupply()	Maximum token supply.	uint256 (1 trillion)
totalSupply()	Current total supply (minus burned).	uint256
totalBurned()	Total tokens burned.	uint256
balanceOf(address)	Token balance of an address.	uint256
allowance(address, address)	Remaining allowance.	uint256
5.2. Core Functions
Function	Description	Access
transfer(address, uint256)	Transfer tokens.	Public
transferFrom(address, address, uint256)	Transfer with allowance.	Public
approve(address, uint256)	Approve spending.	Public
burn(uint256)	Burn own tokens.	Public
burnFrom(address, uint256)	Burn tokens with allowance.	Public
permit(address, address, uint256, uint256, uint8, bytes32, bytes32)	Gasless approval (EIP-2612).	Public
5.3. Constructor
The constructor is called once at deployment:

solidity
constructor(address receiver)
    ERC20("PanjoCoin", "PNJC")
    ERC20Permit("PanjoCoin")
{
    require(receiver != address(0), "Zero address");
    _mint(receiver, MAX_SUPPLY);
    emit InitialSupplyMinted(receiver, MAX_SUPPLY);
}
Events Emitted:

InitialSupplyMinted(address indexed receiver, uint256 amount) – emitted when the total supply is minted.

## 6. Tokenomics Integration
6.1. Supply Allocation
Category	Share	Amount (PNJC)	Contract Interface
Liquidity (Uniswap V2)	50%	500,000,000,000	PNJCLiquidityLockerV2
Operational Treasury	12%	120,000,000,000	Multisig
Team	10%	100,000,000,000	PNJCVestingVault
DAO Treasury	10%	100,000,000,000	DAO Governor (Q4 2026)
Community	8%	80,000,000,000	MerkleAirdrop
Founder	5%	50,000,000,000	PNJCVestingVault
Charity Reserve	5%	50,000,000,000	Public wallet
6.2. Liquidity Lock
Property	Value
Contract	PNJCLiquidityLockerV2
Locked Amount	500,000,000,000 PNJC
Lock Period	12 months
Emergency Withdrawal	None
Contract Type	Immutable, ownerless
6.3. Vesting Contracts
Contract	Purpose	Cliff	Vesting Period
PNJCVestingVault (Team)	Core contributors	6 months	12 months
PNJCVestingVault (Founder)	Founder commitment	12 months	24 months
## 7. Future Smart Contracts
Contract	Purpose	Status	Timeline
PNJCLiquidityLockerV2	12-month liquidity lock	🧩 Code Ready	Q2 2026
PNJCVestingVault	Linear token vesting	🧩 Code Ready	Q3 2026
PNJCTreasuryVault	Multisig treasury management	🧩 Code Ready	Q3 2026
MerkleAirdrop	Gas-efficient token distribution	🧩 Code Ready	Q2 2026
DAO Governor	Decentralised governance	🧩 Code Ready	Q4 2026
ClownCare Bridge	Transparent charity	🧩 Design Phase	Q2 2027
ONE+ Platform	Gaming ecosystem	🧩 Design Phase	Q3 2027
## 8. Security Features
8.1. Security Measures
Measure	Status	Description
OpenZeppelin 5.5.0	✅	Industry-standard audited libraries.
ReentrancyGuard	✅	Prevents reentrancy attacks.
No selfdestruct	✅	Contract cannot be destroyed.
No delegatecall	✅	No proxy or upgrade patterns.
No upgradeability	✅	Contract is immutable.
No owner (token)	✅	No administrative controls.
Ownerless	✅	owner = address(0).
Zero tax	✅	No hidden fees.
Code verified	✅	PolygonScan (Exact Match).
8.2. Independent Audits
Contract	Auditor	Timeline
PanjoCoin (token)	CertiK	Q2 2026
PNJCLiquidityLockerV2	CertiK	Q2 2026
PNJCVestingVault	CertiK / Hacken	Q3 2026
MerkleAirdrop	CertiK / Hacken	Q2 2026
PNJCTreasuryVault	CertiK / Hacken	Q3 2026
DAO Governor	CertiK / Hacken	Q4 2026
## 9. Contract Verification
9.1. PolygonScan Verification
Property	Status
Contract	PanjoCoin
Address	0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF
Verification Status	✅ Exact Match
Compiler Version	v0.8.36
Optimization	Enabled
MIT License	✅
9.2. GitHub Repository
Property	Value
Repository	github.com/CryptoTengo/PanjoCoin
License	MIT
Code	Open Source
## 10. Gas Optimization
Feature	Description
Efficient Code	Minimal functions, standard libraries.
Permit	Reduces approval transactions.
Polygon PoS	Low gas costs.
## 11. Upgradeability Policy
Feature	Status	Description
Proxy Pattern	❌ Not used	No delegatecall proxy.
Upgrade Function	❌ Absent	No upgrade functions.
Modifications	❌ Impossible	Contract is immutable.
Reason	Maximum security, trust, and decentralisation.	
## 12. Contract Address Verification
Source	Address
Token Contract	0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF
PolygonScan	View Contract
GitHub	View Code
## 13. Core Parameters Summary
Parameter	Value
Token Name	PanjoCoin
Ticker	PNJC
Network	Polygon PoS
Standard	ERC-20 + ERC20Burnable + ERC20Permit
Total Supply	1,000,000,000,000 PNJC
Decimals	18
Transfer Tax	0%
Owner	None (ownerless)
Mint Function	❌ Absent
Upgradeability	❌ None
Blacklist / Freeze	❌ None
Code Verification	✅ PolygonScan
## 14. Comparison: Core Parameters vs. Token Contract
Parameter	Whitepaper Value	Contract Implementation	Status
Token Name	PanjoCoin	ERC20("PanjoCoin", "PNJC")	✅
Ticker	PNJC	✅	✅
Standard	ERC-20 + Burnable + Permit	Inherits all three	✅
Total Supply	1,000,000,000,000	MAX_SUPPLY = 1_000_000_000_000 * 10**18	✅
Decimals	18	ERC20 default (18)	✅
Transfer Tax	0%	No custom tax logic	✅
Owner	None	No Ownable inheritance	✅
Mint Function	❌	❌ Not implemented	✅
Upgradeability	❌	❌ No proxy	✅
## 15. Conclusion
The PanjoCoin smart contract architecture provides a secure, transparent, and decentralised foundation for the PNJC ecosystem.

Key Highlights:

Fixed supply – 1 trillion PNJC, no inflation;

Zero tax – 0% on all transactions;

Ownerless – No admin keys or central control;

Burnable – Optional user-driven burning;

Permit – Gasless approvals (EIP-2612);

Verified – Code on PolygonScan (Exact Match);

Immutable – No upgradeability;

Audit-ready – Independent audits scheduled.

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
Document	Smart Contract Architecture
Version	1.1 (Updated)
Date	July 25, 2026
Status	Official
© 2026 PanjoCoin (PNJC) / CryptoTengo. All rights reserved.
Document Version: 1.1 (Updated)
Last Updated: July 25, 2026
