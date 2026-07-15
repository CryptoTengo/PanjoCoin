# Database Design

## PanjoCoin (PNJC)

**Version:** 1.0  
**Date:** July 2026  
**System Type:** Web3 SocialFi Ecosystem Database  
**Blockchain:** Polygon PoS  

---

# 1. Overview

This document defines the database architecture for the PanjoCoin (PNJC) ecosystem.

The database layer provides off-chain data storage and processing capabilities required for:

- User profiles
- Wallet management
- Blockchain indexing
- SocialFi functionality
- Proof of Kindness (PoK)
- Impact Score
- GameFi services
- Community analytics
- DAO operations
- AI Content Factory analytics


The database does NOT store:

- Private keys
- Seed phrases
- Custodial wallet credentials
- User funds

All financial transactions remain on-chain.

---

# 2. Database Architecture

High-level architecture:

             PNJC Ecosystem Applications

                      |

                API Gateway

                      |

              Backend Services

                      |

    -----------------------------------

    |              |                 |

PostgreSQL Redis Cache IPFS Storage

    |

Blockchain Indexer

    |

Polygon PoS Network

    |

PNJC Smart Contract


---

# 3. Design Principles

The database follows:

- Security by design
- Blockchain-first architecture
- Data minimization
- Scalability
- High availability
- GDPR-aware data handling
- Auditability

---

# 4. Database Technology Stack

Recommended production stack:

| Component | Technology |
|-|-|
| Primary Database | PostgreSQL |
| Cache Layer | Redis |
| Search Engine | Elasticsearch |
| Object Storage | IPFS |
| Analytics | ClickHouse |
| Message Queue | RabbitMQ / Kafka |
| ORM | Prisma / TypeORM |
| Backup | Encrypted Cloud Storage |

---

# 5. Database Layers

## 5.1 Core Layer

Stores:

- Users
- Wallets
- Roles
- Permissions


---

## 5.2 Blockchain Layer

Stores:

- Blocks
- Transactions
- Token transfers
- Contract events


---

## 5.3 SocialFi Layer

Stores:

- Impact activities
- Proof submissions
- Reputation scores


---

## 5.4 GameFi Layer

Stores:

- Player profiles
- Achievements
- Rewards


---

## 5.5 Analytics Layer

Stores:

- User behavior
- Community metrics
- Growth statistics


---

# 6. Entity Relationship Overview


User

|

Wallet

|

Blockchain Activity

User

|

Impact Records

|

Impact Score

User

|

Game Profile

|

Rewards

Community

|

DAO Governance


---

# 7. Core Database Schema

---

# 7.1 Users Table

Purpose:

Stores ecosystem user profiles.


Table:


users


Columns:

| Field | Type | Description |
|-|-|-|
| id | UUID | Primary key |
| username | VARCHAR | Public username |
| email_hash | VARCHAR | Optional hashed email |
| country | VARCHAR | Optional region |
| language | VARCHAR | Preferred language |
| created_at | TIMESTAMP | Registration date |
| status | ENUM | Active/Suspended |

---

# 7.2 Wallets Table

Purpose:

Stores connected blockchain wallets.


Table:


wallets


Columns:

| Field | Type |
|-|-|
| id | UUID |
| user_id | UUID |
| wallet_address | VARCHAR |
| blockchain | VARCHAR |
| verified | BOOLEAN |
| created_at | TIMESTAMP |


Example:


0x781C0d15347Cb0B94C42C65c7a67E70371205De5


---

# 7.3 Blockchain Transactions Table

Purpose:

Stores indexed blockchain activity.


Table:


blockchain_transactions


Columns:

| Field | Type |
|-|-|
| id | UUID |
| tx_hash | VARCHAR |
| wallet_from | VARCHAR |
| wallet_to | VARCHAR |
| amount | DECIMAL |
| gas_used | BIGINT |
| block_number | BIGINT |
| timestamp | TIMESTAMP |

---

# 7.4 Token Transfers Table

Purpose:

Tracks PNJC transfers.


Table:


token_transfers


Columns:

| Field | Type |
|-|-|
| id | UUID |
| transaction_hash | VARCHAR |
| sender | VARCHAR |
| receiver | VARCHAR |
| amount | DECIMAL |
| tax_amount | DECIMAL |
| created_at | TIMESTAMP |

---

# 8. Smart Contract Indexing Database

Stores:

- Transfer events
- Approval events
- Burn events
- Charity events


Table:


contract_events



Columns:

| Field | Type |
|-|-|
| id | UUID |
| event_name | VARCHAR |
| contract_address | VARCHAR |
| event_data | JSON |
| block_number | BIGINT |
| timestamp | TIMESTAMP |

---

# 9. Proof of Kindness Database

## Impact Activities Table


Table:


impact_records



Columns:

| Field | Type |
|-|-|
| id | UUID |
| wallet_address | VARCHAR |
| activity_type | VARCHAR |
| description | TEXT |
| proof_hash | VARCHAR |
| verification_status | ENUM |
| created_at | TIMESTAMP |

---

# 10. Impact Score Table

Stores reputation data.


Table:


impact_scores



Columns:

| Field | Type |
|-|-|
| wallet_address | VARCHAR |
| score | INTEGER |
| rank | VARCHAR |
| updated_at | TIMESTAMP |


Example:


Score: 850

Rank:
Gold


---

# 11. GameFi Database

## Player Profile

Table:


game_players



Columns:

| Field | Type |
|-|-|
| id | UUID |
| wallet_address | VARCHAR |
| level | INTEGER |
| experience | INTEGER |
| achievements | JSON |
| created_at | TIMESTAMP |

---

# 12. NFT Assets Table

Stores:

- NFT ownership references
- Metadata links
- Game assets


Table:


nft_assets



Columns:

| Field | Type |
|-|-|
| token_id | VARCHAR |
| owner_wallet | VARCHAR |
| metadata_uri | VARCHAR |
| rarity | VARCHAR |

---

# 13. Reward System Database

Table:


rewards



Columns:

| Field | Type |
|-|-|
| id | UUID |
| wallet_address | VARCHAR |
| reward_type | VARCHAR |
| amount | DECIMAL |
| transaction_hash | VARCHAR |
| created_at | TIMESTAMP |

---

# 14. DAO Database

## Governance Proposals


Table:


dao_proposals



Columns:

| Field | Type |
|-|-|
| id | UUID |
| title | VARCHAR |
| description | TEXT |
| creator | VARCHAR |
| status | ENUM |
| created_at | TIMESTAMP |

---

## Voting Records


Table:


dao_votes



Columns:

| Field | Type |
|-|-|
| proposal_id | UUID |
| wallet_address | VARCHAR |
| vote | ENUM |
| voting_power | DECIMAL |

---

# 15. Community Database

Stores:

- Members
- Activities
- Engagement


Table:


community_members



Columns:

| Field | Type |
|-|-|
| wallet_address | VARCHAR |
| reputation | INTEGER |
| contribution_score | INTEGER |
| joined_at | TIMESTAMP |

---

# 16. AI Content Factory Database

Stores automated content operations.


Table:


content_tasks



Columns:

| Field | Type |
|-|-|
| id | UUID |
| platform | VARCHAR |
| language | VARCHAR |
| topic | VARCHAR |
| generated_content | TEXT |
| performance_score | INTEGER |
| created_at | TIMESTAMP |


---

# 17. Security Model

Database security requirements:


## Encryption

Required:

- Database encryption at rest
- TLS connections
- Encrypted backups


---

## Access Control

Roles:


ADMIN

DEVELOPER

ANALYST

CONTENT_MANAGER

READ_ONLY


---

# 18. Backup Strategy

Recommended:

## Daily

Full backup


## Hourly

Incremental backup


## Disaster Recovery

Target:


RPO:
< 1 hour

RTO:
< 4 hours


---

# 19. Scalability Strategy

Future scaling:

## Horizontal Scaling

- Read replicas
- Database sharding


## Data Processing

- Event streaming
- Blockchain indexing


---

# 20. Compliance Considerations

Database architecture supports:

- GDPR principles
- Data minimization
- Audit logging
- User consent management


Sensitive information should never include:

- Private keys
- Seed phrases
- Passwords


---

# 21. Monitoring

Recommended tools:

- Prometheus
- Grafana
- Datadog
- ELK Stack


Monitoring:

- Database health
- Query performance
- Failed requests
- Security events


---

# 22. Disaster Recovery

Recovery procedures:

1. Detect failure
2. Restore database backup
3. Verify integrity
4. Reconnect blockchain indexer
5. Resume API services


---

# 23. Future Database Expansion

Planned modules:

## AI Knowledge Base

- Documentation embeddings
- Vector database
- RAG search


## Global Kindness Map

- Geographic impact visualization
- Verified activities


## Enterprise API

- Partner integrations
- Institutional analytics


---

# 24. Conclusion

The PanjoCoin database architecture provides a scalable foundation for a decentralized SocialFi ecosystem.

The design separates:

- On-chain financial data
- Off-chain application data
- AI intelligence systems
- Community services

This architecture enables PNJC to evolve from a token into a complete Web3 ecosystem.

---

© 2026 CryptoTengo  
PanjoCoin (PNJC)
