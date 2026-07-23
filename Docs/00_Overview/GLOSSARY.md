### PanjoCoin (PNJC) — GLOSSARY.md
Version: 1.0
Date: July 23, 2026
Network: Polygon PoS

## 1. Introduction
This glossary defines key terms, concepts, and acronyms used throughout the PanjoCoin (PNJC) documentation. It is designed to help readers understand the technical, economic, and governance terminology associated with the project.

Whether you are a developer, investor, community member, or researcher, this glossary provides clear and concise definitions to enhance your understanding of the PanjoCoin ecosystem.

## 2. Glossary of Terms
A
Term	Definition
Airdrop	A distribution of tokens to a large number of wallet addresses, typically used as a marketing or community-building strategy. PanjoCoin uses Merkle tree-based airdrops for gas efficiency.
AML	Anti-Money Laundering. A set of laws, regulations, and procedures designed to prevent the generation of income through illegal activities.
API	Application Programming Interface. A set of protocols that allows different software applications to communicate with each other.
Audit	An independent review of smart contract code to identify vulnerabilities, bugs, and security issues. PanjoCoin plans audits with CertiK and Hacken.
B
Term	Definition
Blacklist	A list of addresses that are prohibited from interacting with a smart contract. PanjoCoin's token contract does not have a blacklist function.
Blockchain	A distributed, immutable ledger that records transactions across a network of computers. PanjoCoin is deployed on the Polygon blockchain.
Bug Bounty	A program that rewards security researchers for discovering and reporting vulnerabilities. PanjoCoin plans to launch a bug bounty program.
Burn	The permanent removal of tokens from circulation by sending them to an inaccessible address (e.g., 0x000...dEaD). PanjoCoin implements burning through the GoldenPhoenixProtocol.
Buyback	The process of purchasing tokens from the open market, typically to reduce supply or support price. PanjoCoin's GoldenPhoenixProtocol performs buybacks using USDT revenue.
C
Term	Definition
CDD	Customer Due Diligence. The process of identifying and verifying customers to assess AML/CFT risks.
CEX	Centralized Exchange. A cryptocurrency exchange operated by a central authority (e.g., Binance, Coinbase).
CFT	Countering the Financing of Terrorism. Measures to prevent the use of financial systems for terrorist financing.
Cliff	A period at the beginning of a vesting schedule during which no tokens are released. PanjoCoin team has a 6-month cliff; founder has a 12-month cliff.
ClownCare Bridge	A planned transparent charitable payment system with on-chain reporting, scheduled for Q2 2027.
Community	The collective group of users, holders, contributors, and supporters of the PanjoCoin project.
Compiler	Software that translates Solidity code into bytecode that can be executed on the Ethereum Virtual Machine (EVM). PanjoCoin uses Solidity 0.8.34.
Contract Address	The unique identifier for a smart contract on the blockchain. PanjoCoin token contract: 0x45522cD96EA7eBAF28fc760952b1AD9d5fffc848.
D
Term	Definition
DAO	Decentralized Autonomous Organization. A governance structure where decisions are made by community vote rather than a central authority. PanjoCoin plans a DAO for Q4 2026.
DAO Treasury	A pool of funds controlled by the DAO for ecosystem development, grants, and community initiatives. PanjoCoin's DAO Treasury holds 100B PNJC (10%).
Decentralization	The distribution of power and control away from a central authority. PanjoCoin's token contract is ownerless, and governance will transition to a DAO.
Deflationary	An economic model where the total supply of tokens decreases over time through burning. PanjoCoin's GoldenPhoenixProtocol provides deflationary pressure.
DEX	Decentralized Exchange. A peer-to-peer marketplace where users trade cryptocurrencies directly without an intermediary. PanjoCoin trades on Uniswap V2.
Doxxed	A term meaning "documents have been revealed." A doxxed team has publicly disclosed their identities. PanjoCoin's founder is fully doxxed.
E
Term	Definition
EIP	Ethereum Improvement Proposal. A standard for proposing improvements to the Ethereum network. PanjoCoin implements EIP-2612 (Permit).
Emission	The creation of new tokens. PanjoCoin's emission occurred once at deployment; no new tokens can be minted.
ERC-20	The standard interface for fungible tokens on the Ethereum blockchain (and compatible networks like Polygon).
ERC-20Burnable	An extension of the ERC-20 standard that allows tokens to be burned (permanently destroyed).
ERC20Permit	An extension (EIP-2612) that allows gasless approvals using signed messages. PanjoCoin implements this for improved user experience.
EVM	Ethereum Virtual Machine. The runtime environment for executing smart contracts on Ethereum-compatible blockchains.
F
Term	Definition
FATF	Financial Action Task Force. An intergovernmental organization that sets global AML/CFT standards.
Fixed Supply	A token supply that cannot be increased. PanjoCoin has a fixed supply of 1,000,000,000,000 PNJC.
Fork	A copy of a GitHub repository that allows contributors to make changes without affecting the original. Also refers to a blockchain split.
Freeze	The ability to halt token transfers. PanjoCoin's token contract does not have a freeze function.
Front-Running	The practice of exploiting knowledge of pending transactions to gain an advantage. PanjoCoin's 0% tax reduces MEV incentives.
G
Term	Definition
Gas	The fee paid to execute transactions on a blockchain. PanjoCoin is optimized for Polygon, offering low gas costs.
GitHub	A platform for version control and collaboration on software projects. PanjoCoin's code is hosted on GitHub.
Global Kindness Map	A conceptual feature for visualizing kindness transactions with geographic tagging. Currently in the conceptual development stage.
GoldenPhoenixProtocol	PanjoCoin's deflationary mechanism that uses USDT revenue to buy back and burn tokens, with a portion allocated to an insurance fund. Planned for Q3 2026.
Governance	The process of making decisions about the project's development and direction. PanjoCoin will transition to DAO governance in Q4 2026.
H
Term	Definition
Hardhat	A development environment for compiling, testing, and deploying smart contracts. PanjoCoin uses Hardhat for testing.
Hardware Wallet	A physical device that stores private keys offline for enhanced security (e.g., Ledger, Trezor).
I
Term	Definition
Impact Score	A conceptual on-chain social reputation system that measures user contributions to the ecosystem.
Immutable	Unchangeable. PanjoCoin's smart contracts are immutable once deployed — they cannot be upgraded or modified.
Insurance Fund	A reserve fund that protects against extreme market volatility. Part of the GoldenPhoenixProtocol.
Invariant	A condition that must always hold true. In GoldenPhoenixProtocol: insurancePercent + buybackPercent = 30%.
K
Term	Definition
KYC	Know Your Customer. The process of verifying the identity of customers, typically required by centralized exchanges.
Kindness	The core theme of PanjoCoin, inspired by the story of Panjo the Shar Pei and the positive impact of small acts of kindness.
L
Term	Definition
Liquidity	The ability to buy or sell an asset without significantly affecting its price. PanjoCoin allocates 50% of supply to liquidity.
Liquidity Pool	A pool of tokens locked in a smart contract that facilitates trading on a DEX. PanjoCoin's LP is locked for 12 months.
LP	Liquidity Provider. A user who deposits tokens into a liquidity pool to earn fees.
LP Token	A token representing a user's share of a liquidity pool. PanjoCoin's LP tokens are locked in PNJCLiquidityLockerV2.
M
Term	Definition
Mainnet	The main blockchain network where real transactions occur (as opposed to testnet). PanjoCoin is deployed on Polygon mainnet.
Meme Coin	A cryptocurrency inspired by internet memes, often with little or no utility. PanjoCoin addresses the problems of meme coins.
Merkle Airdrop	A gas-efficient token distribution method using Merkle trees to verify eligibility. PanjoCoin uses this for community distributions.
Merkle Tree	A data structure that allows efficient verification of data integrity. Used in PanjoCoin's airdrop contracts.
Mint	The creation of new tokens. PanjoCoin's token contract does not have a mint function.
MiCA	Markets in Crypto-Assets. An EU regulation establishing a comprehensive framework for crypto-assets.
Multisig	Multi-signature wallet. A wallet that requires multiple signatures to execute transactions. PanjoCoin uses 3/5 multisig for treasury management.
N
Term	Definition
NatSpec	Natural Specification. A documentation format for Solidity that uses comments to generate user and developer documentation.
Non-Upgradeable	A contract that cannot be modified after deployment. PanjoCoin's contracts are non-upgradeable.
O
Term	Definition
OFAC	Office of Foreign Assets Control. A US government agency that administers economic and trade sanctions.
ONE+	PanjoCoin's planned gaming platform, scheduled for Q3 2027.
OpenZeppelin	A library of audited, secure smart contract components. PanjoCoin uses OpenZeppelin 5.0.2.
Ownable	An OpenZeppelin contract that provides ownership controls. PanjoCoin's token contract does not inherit Ownable.
Ownable2Step	An enhanced version of Ownable with two-step ownership transfer. Used by contracts that require administrative functions.
Ownerless	A contract that has no owner. PanjoCoin's token contract is ownerless (owner = address(0)).
P
Term	Definition
Panjo	The Shar Pei dog whose story inspired the PanjoCoin project.
PNJC	The ticker symbol for PanjoCoin.
PoK	Proof of Kindness. A conceptual mechanism for validating good deeds on the blockchain.
Polygon	A Layer 2 scaling solution for Ethereum. PanjoCoin is deployed on Polygon PoS.
PoS	Proof of Stake. A consensus mechanism where validators are selected based on the number of tokens they stake.
Private Key	A cryptographic key that allows the holder to access and control blockchain assets. Must be kept secure.
Protocol	A set of rules and smart contracts that define how a blockchain application operates.
Pull Request (PR)	A method of submitting code changes to a GitHub repository for review and merging.
Q
Term	Definition
Quorum	The minimum number of votes required for a DAO proposal to pass. PanjoCoin's quorum is 4% of total supply.
R
Term	Definition
ReentrancyGuard	A security feature that prevents reentrancy attacks. Used in PanjoCoin's contracts.
Responsible Disclosure	The practice of reporting security vulnerabilities privately before public disclosure.
Roadmap	A plan outlining the project's development milestones and timelines. PanjoCoin has a 24-month roadmap.
Rug Pull	A type of scam where developers abandon a project and take investor funds. PanjoCoin's liquidity lock prevents this.
S
Term	Definition
Selfdestruct	A Solidity function that removes a contract from the blockchain. PanjoCoin's contracts do not contain selfdestruct.
Slippage	The difference between the expected price of a trade and the actual executed price.
Smart Contract	Self-executing code stored on the blockchain that enforces the terms of an agreement.
Social Mining	A conceptual reward model for participants who promote the project and create content.
SocialFi	The integration of social media and decentralized finance. PanjoCoin incorporates SocialFi elements through community engagement.
Solidity	A programming language used to write smart contracts on Ethereum-compatible blockchains. PanjoCoin uses Solidity 0.8.34.
Staking	Locking tokens to support network operations or earn rewards. Future staking is planned for PanjoCoin.
STR	Suspicious Transaction Report. A report filed to authorities about potentially illicit transactions.
T
Term	Definition
Testnet	A test blockchain network used for development and testing (e.g., Polygon Mumbai).
Timelock	A delay between the approval and execution of a transaction or proposal. PanjoCoin uses a 48-hour timelock for DAO proposals.
Token	A digital asset that represents value or utility on a blockchain. PNJC is a utility token.
Tokenomics	The study of token economics, including supply, distribution, utility, and incentives.
Total Supply	The total number of tokens that exist or will ever exist. PanjoCoin's total supply is 1 trillion.
Treasury	A pool of funds managed by the project for operational and developmental purposes. PanjoCoin has Operational (12%) and DAO (10%) treasuries.
U
Term	Definition
Uniswap	A decentralized exchange (DEX) protocol. PanjoCoin trades on Uniswap V2.
Unlock Schedule	The timeline for releasing locked tokens into circulation. PanjoCoin releases 5% of locked supply annually.
Upgradeability	The ability to modify a smart contract after deployment. PanjoCoin's contracts are not upgradeable.
USDT	Tether. A stablecoin pegged to the US dollar. Used in PanjoCoin's GoldenPhoenixProtocol for buybacks and burns.
Utility Token	A token that provides access to a product or service within a specific ecosystem. PNJC is a utility token.
V
Term	Definition
Velocity	The rate at which tokens circulate through the economy. PanjoCoin aims for sustainable token velocity.
Vesting	The gradual release of tokens over a specified period to prevent early sell pressure. PanjoCoin uses VestingVault for team and founder allocations.
VestingVault	A smart contract that implements linear token vesting for team and founder allocations. Code is ready for Q3 2026.
Voting Period	The duration during which a governance proposal can be voted on. PanjoCoin's voting period is 7 days.
W
Term	Definition
Wallet	A software or hardware application that stores private keys and allows interaction with blockchain networks.
Whitepaper	A comprehensive document describing a project's vision, technology, tokenomics, and roadmap.
Withdrawal	The removal of funds or tokens from a contract or wallet. PanjoCoin's liquidity locker has no emergency withdrawal.
## 3. Acronyms and Abbreviations
Acronym	Full Form
AML	Anti-Money Laundering
API	Application Programming Interface
CDD	Customer Due Diligence
CEX	Centralized Exchange
CFT	Countering the Financing of Terrorism
DAO	Decentralized Autonomous Organization
DEX	Decentralized Exchange
EIP	Ethereum Improvement Proposal
ERC	Ethereum Request for Comments
EVM	Ethereum Virtual Machine
FATF	Financial Action Task Force
KYC	Know Your Customer
LP	Liquidity Provider
MiCA	Markets in Crypto-Assets
NFT	Non-Fungible Token
OFAC	Office of Foreign Assets Control
PNJC	PanjoCoin
PoK	Proof of Kindness
PoS	Proof of Stake
PR	Pull Request
STR	Suspicious Transaction Report
USDT	Tether (USD stablecoin)
## 4. PanjoCoin-Specific Terms
Term	Definition
ClownCare Bridge	PanjoCoin's planned transparent charitable payment system with on-chain reporting (Q2 2027).
GoldenPhoenixProtocol	PanjoCoin's deflationary mechanism using USDT revenue for buybacks, burns, and insurance (Q3 2026).
ONE+	PanjoCoin's planned gaming platform (Q3 2027).
Panjo	The Shar Pei who inspired the project, symbolizing kindness and hope.
PNJCLiquidityLockerV2	PanjoCoin's immutable liquidity locking contract with no emergency withdrawal.
PNJCTreasuryVault	PanjoCoin's multisig treasury management contract.
PNJCVestingVault	PanjoCoin's linear vesting contract for team and founder allocations.
## 5. Blockchain and Crypto Terms
Term	Definition
Block	A group of transactions recorded on the blockchain.
Blockchain	A distributed, immutable ledger of transactions.
Bytecode	Low-level code that the EVM can execute, generated by compiling Solidity.
Consensus	The process by which blockchain participants agree on the validity of transactions.
Cryptocurrency	Digital or virtual currency that uses cryptography for security.
DApp	Decentralized Application. An application that runs on a blockchain.
Decentralization	The distribution of power and control away from a central authority.
Ether	The native cryptocurrency of the Ethereum network.
Gas	The fee paid to execute transactions on a blockchain.
Hash	A fixed-length string of characters generated from input data, used for verification.
Node	A computer that participates in the blockchain network.
Nonce	A number used once in cryptographic communications.
Private Key	A secret key that allows access to blockchain assets.
Public Key	A publicly shareable key derived from the private key.
Transaction	A record of value transfer or contract execution on the blockchain.
## 6. Document Information
Property	Value
Document	Glossary
Version	1.0
Date	July 23, 2026
Status	✅ Active
Next Review	As needed
© 2026 PanjoCoin. All rights reserved.
Document Version: 1.0
Last Updated: July 23, 2026
