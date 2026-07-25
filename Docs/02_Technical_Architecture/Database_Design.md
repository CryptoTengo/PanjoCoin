## Database Design

PanjoCoin (PNJC)
Version: 1.1 (Updated)
Date: July 25, 2026
System Type: Web3 SocialFi Ecosystem Database
Blockchain: Polygon PoS
Smart Contract Address: 0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF

## 1. Overview
This document defines the database architecture for the PanjoCoin (PNJC) ecosystem.

The database layer provides off-chain data storage and processing capabilities required for:

User profiles and wallet management;

Blockchain indexing and transaction tracking;

SocialFi functionality (Proof of Kindness, Impact Score);

GameFi services (ONE+ platform);

Community analytics and engagement metrics;

DAO governance operations.

The database does NOT store:

Private keys;

Seed phrases;

Custodial wallet credentials;

User funds.

All financial transactions remain on-chain and verifiable on PolygonScan.

## 2. Database Architecture
High-level architecture:

text
         PNJC Ecosystem Applications
                    |
              API Gateway
                    |
            Backend Services
                    |
-----------------------------------
|              |                 |
PostgreSQL    Redis Cache    IPFS Storage
       |              |
 Blockchain Indexer
       |
  Polygon PoS Network
       |
  PNJC Smart Contract
## 3. Design Principles
The database follows:

Principle	Description
Security by Design	Encryption, access control, and audit logging.
Blockchain-First Architecture	Financial data remains on-chain; off-chain data is supplementary.
Data Minimization	Only necessary data is stored.
Scalability	Designed for horizontal scaling and growth.
High Availability	Redundancy and failover mechanisms.
GDPR-Aware Data Handling	Privacy-compliant data management.
Auditability	All data changes are logged and traceable.
## 4. Database Technology Stack
Recommended production stack:

Component	Technology
Primary Database	PostgreSQL
Cache Layer	Redis
Search Engine	Elasticsearch
Object Storage	IPFS
Analytics	ClickHouse
Message Queue	RabbitMQ / Kafka
ORM	Prisma / TypeORM
Backup	Encrypted Cloud Storage
## 5. Database Layers
5.1. Core Layer
Stores:

Users;

Wallets;

Roles;

Permissions.

5.2. Blockchain Layer
Stores:

Blocks;

Transactions;

Token transfers;

Contract events.

5.3. SocialFi Layer
Stores:

Impact activities;

Proof of Kindness submissions;

Reputation scores;

Impact Score data.

5.4. GameFi Layer (ONE+)
Stores:

Player profiles;

Achievements;

Rewards;

Game assets.

5.5. Analytics Layer
Stores:

User behaviour;

Community metrics;

Growth statistics.

## 6. Entity Relationship Overview
text
User
  │
  ├── Wallet
  │     │
  │     └── Blockchain Activity
  │
  ├── Impact Records
  │     │
  │     └── Impact Score
  │
  ├── Game Profile (ONE+)
  │     │
  │     └── Rewards
  │
  └── DAO Participation
## 7. Core Database Schema
7.1. Users Table
Purpose: Stores ecosystem user profiles.

Table: users

Field	Type	Description
id	UUID	Primary key
username	VARCHAR	Public username
email_hash	VARCHAR	Optional hashed email
country	VARCHAR	Optional region
language	VARCHAR	Preferred language
created_at	TIMESTAMP	Registration date
status	ENUM	Active / Suspended
7.2. Wallets Table
Purpose: Stores connected blockchain wallets.

Table: wallets

Field	Type	Description
id	UUID	Primary key
user_id	UUID	Foreign key to users
wallet_address	VARCHAR	Blockchain wallet address
blockchain	VARCHAR	Network (Polygon)
verified	BOOLEAN	Ownership verification status
created_at	TIMESTAMP	Connection date
Example: 0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF

7.3. Blockchain Transactions Table
Purpose: Stores indexed blockchain activity.

Table: blockchain_transactions

Field	Type	Description
id	UUID	Primary key
tx_hash	VARCHAR	Transaction hash
wallet_from	VARCHAR	Sender address
wallet_to	VARCHAR	Receiver address
amount	DECIMAL	Transaction amount
gas_used	BIGINT	Gas consumed
block_number	BIGINT	Block number
timestamp	TIMESTAMP	Transaction time
7.4. Token Transfers Table
Purpose: Tracks PNJC transfers.

Table: token_transfers

Field	Type	Description
id	UUID	Primary key
transaction_hash	VARCHAR	On-chain transaction hash
sender	VARCHAR	Sender address
receiver	VARCHAR	Receiver address
amount	DECIMAL	Transfer amount
tax_amount	DECIMAL	Tax amount (always 0)
created_at	TIMESTAMP	Transfer time
## 8. Smart Contract Indexing Database
Purpose: Stores contract events for indexing and analysis.

Table: contract_events

Field	Type	Description
id	UUID	Primary key
event_name	VARCHAR	Event type (Transfer, Burn, Approval)
contract_address	VARCHAR	PNJC contract address
event_data	JSON	Event parameters
block_number	BIGINT	Block number
timestamp	TIMESTAMP	Event time
Supported Events:

Transfer events;

Approval events;

Burn events (optional, user-driven).

## 9. Proof of Kindness Database
Impact Activities Table
Purpose: Stores verified positive community actions.

Table: impact_records

Field	Type	Description
id	UUID	Primary key
wallet_address	VARCHAR	User wallet
activity_type	VARCHAR	Type of impact activity
description	TEXT	Activity description
proof_hash	VARCHAR	Verification proof
verification_status	ENUM	Pending / Verified / Rejected
created_at	TIMESTAMP	Submission time
## 10. Impact Score Table
Purpose: Stores reputation data.

Table: impact_scores

Field	Type	Description
wallet_address	VARCHAR	User wallet
score	INTEGER	Numeric reputation score
rank	VARCHAR	Rank (e.g., Bronze, Silver, Gold)
updated_at	TIMESTAMP	Last update time
Example:

Score: 850;

Rank: Gold.

## 11. GameFi Database (ONE+)
Player Profile Table
Purpose: Stores player data for the ONE+ gaming platform.

Table: game_players

Field	Type	Description
id	UUID	Primary key
wallet_address	VARCHAR	User wallet
level	INTEGER	Current level
experience	INTEGER	Experience points
achievements	JSON	Unlocked achievements
created_at	TIMESTAMP	Registration date
## 12. NFT Assets Table
Purpose: Stores NFT ownership references and metadata.

Table: nft_assets

Field	Type	Description
token_id	VARCHAR	NFT identifier
owner_wallet	VARCHAR	Current owner address
metadata_uri	VARCHAR	IPFS metadata link
rarity	VARCHAR	Rarity tier
game_asset	BOOLEAN	In-game asset flag
## 13. Reward System Database
Purpose: Tracks ecosystem rewards and incentives.

Table: rewards

Field	Type	Description
id	UUID	Primary key
wallet_address	VARCHAR	Recipient wallet
reward_type	VARCHAR	Reward category
amount	DECIMAL	PNJC amount
transaction_hash	VARCHAR	On-chain transfer hash
created_at	TIMESTAMP	Reward time
## 14. DAO Database
Governance Proposals Table
Purpose: Stores DAO proposals.

Table: dao_proposals

Field	Type	Description
id	UUID	Primary key
title	VARCHAR	Proposal title
description	TEXT	Proposal details
creator	VARCHAR	Proposer wallet address
status	ENUM	Active / Passed / Rejected / Executed
created_at	TIMESTAMP	Submission time
Voting Records Table
Purpose: Stores DAO votes.

Table: dao_votes

Field	Type	Description
proposal_id	UUID	Foreign key to proposals
wallet_address	VARCHAR	Voter wallet
vote	ENUM	For / Against / Abstain
voting_power	DECIMAL	Number of PNJC held
created_at	TIMESTAMP	Vote time
## 15. Community Database
Purpose: Stores community members and engagement metrics.

Table: community_members

Field	Type	Description
wallet_address	VARCHAR	Member wallet
reputation	INTEGER	Community reputation score
contribution_score	INTEGER	Contribution metric
joined_at	TIMESTAMP	Join date
## 16. Security Model
Encryption
Requirement	Description
Encryption at Rest	Database encryption enabled.
TLS Connections	Encrypted connections between services.
Encrypted Backups	All backups encrypted.
Access Control
Role	Permissions
ADMIN	Full system access.
DEVELOPER	Schema and application access.
ANALYST	Read-only access for analytics.
CONTENT_MANAGER	Content management access.
READ_ONLY	Limited read-only access.
## 17. Backup Strategy
Type	Frequency
Full Backup	Daily
Incremental Backup	Hourly
Disaster Recovery	RPO: < 1 hour, RTO: < 4 hours
## 18. Scalability Strategy
Strategy	Description
Horizontal Scaling	Read replicas for query distribution.
Database Sharding	Partitioning for large datasets.
Event Streaming	Kafka for real-time blockchain indexing.
## 19. Compliance Considerations
Database architecture supports:

Requirement	Description
GDPR Principles	Data minimisation and user rights.
Audit Logging	All data changes logged.
User Consent Management	Consent tracking for user data.
Sensitive information should never include:

Private keys;

Seed phrases;

Passwords.

## 20. Monitoring
Recommended tools:

Tool	Purpose
Prometheus	Metrics collection.
Grafana	Dashboards and visualisation.
Datadog	Performance monitoring.
ELK Stack	Log aggregation and analysis.
Monitoring Focus:

Database health;

Query performance;

Failed requests;

Security events.

## 21. Disaster Recovery
Recovery Procedures:

Detect failure;

Restore database from backup;

Verify data integrity;

Reconnect blockchain indexer;

Resume API services.

## 22. Future Database Expansion
Planned modules:

Module	Description
Global Kindness Map	Geographic visualisation of verified impact activities.
Enterprise API	Partner integrations and institutional analytics.
Community Analytics	Enhanced community engagement metrics.
ONE+ Game Data	Expanded GameFi data storage.
## 23. Database Schema Summary
Layer	Tables	Purpose
Core	users, wallets	User and wallet management.
Blockchain	blockchain_transactions, token_transfers, contract_events	On-chain data indexing.
SocialFi	impact_records, impact_scores	Proof of Kindness and reputation.
GameFi	game_players, nft_assets	ONE+ gaming platform data.
Rewards	rewards	Ecosystem incentives.
DAO	dao_proposals, dao_votes	Governance data.
Community	community_members	Community engagement.
## 24. Conclusion
The PanjoCoin database architecture provides a scalable foundation for a decentralised SocialFi ecosystem.

The design separates:

Layer	Responsibility
On-Chain Financial Data	Smart contract state, balances, transfers.
Off-Chain Application Data	User profiles, reputation, game data.
Community Services	Engagement, analytics, DAO operations.
Social Impact Data	Proof of Kindness, Impact Score.
This architecture enables PNJC to evolve from a token into a complete Web3 ecosystem.

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
Document	Database Design
Version	1.1 (Updated)
Date	July 25, 2026
Status	Official
© 2026 PanjoCoin (PNJC) / CryptoTengo. All rights reserved.
Document Version: 1.1 (Updated)
Last Updated: July 25, 2026
