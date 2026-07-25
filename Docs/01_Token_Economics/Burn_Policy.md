## Burn Policy
PanjoCoin (PNJC)
Version: 1.1 (Updated)
Date: July 25, 2026
Network: Polygon PoS
Token Standard: ERC-20 (ERC20Burnable + ERC20Permit)
Smart Contract Address: 0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF

## 1. Overview
This document defines the Burn Policy of PanjoCoin (PNJC).

PNJC implements an optional, user-driven burn mechanism through the burn() function inherited from the ERC20Burnable extension. This allows token holders to permanently remove their tokens from circulation at their own discretion.

The purpose of the burn mechanism is to provide a transparent and voluntary method for permanently reducing token supply, supporting:

Long‑term scarcity through user choice;

Sustainable token economics;

Transparent supply reduction;

Community confidence.

The burn mechanism follows:

Principle	Description
Transparency	All burn events are publicly verifiable on PolygonScan.
User‑Controlled	Burning is optional and initiated by token holders.
Permanent Supply Reduction	Burned tokens are irreversibly removed.
Responsible Token Economics	No automatic or mandatory burning is applied.
## 2. Burn Philosophy
PNJC uses a voluntary, user-driven deflationary mechanism designed to allow token holders to permanently reduce circulating supply through blockchain-based burns.

The objective is not artificial scarcity or price manipulation, but:

Empowering users with control over their tokens;

Supporting long‑term economic balance;

Offering a transparent mechanism for those who wish to reduce supply.

Important: PNJC does not impose any automatic burn tax on transactions. Burning is entirely optional and user‑initiated.

## 3. Supply Reference
Maximum Supply: 1,000,000,000,000 PNJC (1 Trillion)

Parameter	Status
Maximum Supply	Fixed
Additional Minting	Disabled (no mint() function)
Burn Mechanism	Enabled (optional, user‑driven)
Supply Increase	Impossible
Automatic Burn Tax	None (0%)
## 4. Burn Mechanism Overview
The PNJC burn mechanism consists of:

text
User Initiates Burn
        ↓
Tokens Sent to Burn Address
        ↓
Permanent Removal from Supply
        ↓
Reduced Total Supply
        ↓
Blockchain Record Created
Key Characteristics:

Burning is optional and user‑initiated;

No transaction tax or automatic burn is applied;

Burned tokens are permanently removed from circulation;

All burn events are publicly verifiable.

## 5. Burn Function Implementation
PNJC implements the burn mechanism through the ERC20Burnable extension, which provides:

Function	Description
burn(uint256 amount)	Allows a token holder to burn their own tokens.
burnFrom(address account, uint256 amount)	Allows burning tokens from another address (with allowance).
Technical Details:

Inherited from OpenZeppelin's ERC20Burnable;

Verified on PolygonScan;

No administrative controls over burning;

Fully transparent and on‑chain.

## 6. Burn Address
Burned tokens are sent to the standard irreversible burn address:

0x000000000000000000000000000000000000dEaD

Properties:

No private key control;

No recovery possibility;

Permanent supply reduction;

Publicly verifiable.

## 7. Burn Security Rules
The burn mechanism ensures:

Rule	Description
✅ User‑Controlled	Only token holders can burn their own tokens (or with allowance).
✅ Transparent	All burn events are recorded on-chain and publicly viewable.
✅ Permanent	Burned tokens cannot be recovered or re‑minted.
✅ No Hidden Burns	No administrative or automatic burns are implemented.
✅ No Supply Manipulation	The mechanism does not allow unauthorised supply changes.
## 8. Burn Impact Model
Burning affects:

Metric	Impact
Total Supply	Permanently reduced by the burned amount.
Circulating Supply	Reduced as tokens are removed from circulation.
Scarcity	May increase as supply decreases (market-dependent).
Example:

Stage	Total Supply
Initial	1,000,000,000,000 PNJC
After Burns	999,xxx,xxx,xxx PNJC (depending on actual burned amounts)
## 9. Burn Economics
The economic effect of voluntary burning:

text
Higher Ecosystem Activity
        ↓
More User-Initiated Burns
        ↓
Lower Total Supply
        ↓
Potential Scarcity Increase
        ↓
Market-Driven Value Dynamics
Important: Burning alone does not guarantee value appreciation. Long‑term value depends on:

Adoption and ecosystem growth;

Utility development (gaming, charity, governance);

Community activity;

Market conditions.

## 10. Burn and Token Utility Relationship
The optional burn mechanism supports:

User empowerment and choice;

Long‑term participation incentives;

Transparent supply management.

PNJC's primary value drivers are utility, not burning:

Utility	Status
DAO Governance	Q4 2026
ONE+ Gaming Platform	Q3 2027
ClownCare Bridge (Charity)	Q2 2027
Proof of Kindness	Conceptual
Impact Score	Conceptual
## 11. Burn Transparency
All burn events are publicly verifiable:

Information	Source
Burn Transaction Hash	PolygonScan
Burn Amount	PolygonScan
Date and Time	PolygonScan
Remaining Supply	totalSupply() function on PolygonScan
Total Burned	totalBurned() function on PolygonScan
On‑Chain Verification:

Function: totalBurned() returns the total amount burned;

Function: totalSupply() shows the current supply;

All burns are recorded as standard on‑chain transactions.

## 12. Burn Monitoring Metrics
Key metrics for tracking burns:

Metric	Purpose
Total Burned	Cumulative supply reduction.
Total Supply	Current remaining supply.
Burn Transactions	Number of burn events.
Burn Rate	Frequency and volume of burns (market‑driven).
## 13. Burn Risk Management
Risk	Impact	Mitigation
Excessive Burning	Could reduce ecosystem liquidity.	Burning is user‑controlled; no mandatory burns.
Insufficient Burning	Limited deflationary effect.	Utility growth and adoption drive demand.
Misunderstanding Burn Effects	Incorrect market expectations.	Transparent communication and educational documentation.
## 14. Governance of Burn Parameters
PNJC's burn mechanism is fixed and non‑upgradeable:

No administrative controls over burning;

No parameter changes possible;

Fully immutable and transparent.

Future Considerations:

The DAO (Q4 2026) may discuss community initiatives related to burning;

However, the smart contract itself cannot be modified.

## 15. Burn and Compliance Considerations
The burn mechanism is designed as:

A transparent technical function;

A voluntary supply management tool;

Not a guarantee of price appreciation or investment returns.

Token value depends on market conditions, adoption, and ecosystem growth.

## 16. Burn Model Summary
text
PNJC Burn Policy:

Fixed Supply (1 Trillion)
        +
Optional, User-Controlled Burn
        +
Permanent Removal from Circulation
        +
On-Chain Transparency
        +
No Automatic or Mandatory Burning
        =
Long-Term Supply Management
## 17. Frequently Asked Questions
Q: Is there a burn tax on transactions?
A: No. PNJC has 0% tax on all transactions. Burning is entirely optional and user‑initiated.

Q: Who can burn tokens?
A: Any token holder can burn their own tokens using the burn() function. Users with allowance can also burn tokens from other addresses using burnFrom().

Q: Are burned tokens recoverable?
A: No. Burned tokens are permanently removed and cannot be recovered or re‑minted.

Q: Does burning guarantee price increase?
A: No. Burning reduces supply, but price depends on demand, utility, and market conditions.

Q: How can I verify burns?
A: All burns are recorded on‑chain and can be viewed on PolygonScan using the contract address: 0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF.

## 18. Final Statement
The PanjoCoin Burn Policy establishes a transparent, optional, and user‑controlled approach to reducing token supply.

The burn mechanism supports:

User empowerment and choice;

Supply transparency;

Long‑term ecosystem alignment.

Burning is one component of the PNJC economic model and works together with:

Component	Description
Utility Growth	Gaming, charity, and governance use cases.
Liquidity Strategy	50% locked for 12 months.
Treasury Management	Transparent multisig control.
Community Adoption	DAO governance and participation.
Disclaimer
This document is provided for informational purposes only.

It does not constitute:

Investment advice;

Financial advice;

Legal advice;

Tax advice;

An offer to sell securities;

A guarantee of price appreciation or investment returns.

Participation in blockchain ecosystems involves significant risks. Individuals should conduct independent research and seek professional advice where appropriate before making financial or legal decisions.

Document Information
Property	Value
Document	Burn Policy
Version	1.1 (Updated)
Date	July 25, 2026
Status	Official
© 2026 PanjoCoin (PNJC) / CryptoTengo. All rights reserved.
Document Version: 1.1 (Updated)
Last Updated: July 25, 2026
