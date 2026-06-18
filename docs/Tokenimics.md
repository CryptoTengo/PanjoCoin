# 📊 PanjoCoin (PNJC) — Tokenomics v1.0 (Audit-Grade Clean)

## 📌 1. Scope

This document defines the **mathematical supply model and distribution logic** of PanjoCoin (PNJC).

No governance, no utility promises, no roadmap assumptions.

Only deterministic token economics.

---

# 🪙 2. Core Constants

| Parameter        | Value                     |
| ---------------- | ------------------------- |
| Total Supply (S) | 1,000,000,000,000 PNJC    |
| Decimals         | 18                        |
| Minting          | 0                         |
| Inflation Rate   | 0                         |
| Burn Mechanism   | Optional (user-initiated) |

---

# 📊 3. Supply Equation

### Fixed Supply Constraint

[
S = 1,000,000,000,000
]

[
\frac{dS}{dt} = 0
]

No mint function exists:

[
S_{max} = S_{initial}
]

---

# 🧮 4. Allocation Model

## 4.1 Deterministic Distribution

Let:

[
S = 1,000,000,000,000
]

| Category  | Ratio | Formula  | Amount          |
| --------- | ----- | -------- | --------------- |
| Liquidity | 0.50  | 0.50 × S | 500,000,000,000 |
| Treasury  | 0.12  | 0.12 × S | 120,000,000,000 |
| Team      | 0.10  | 0.10 × S | 100,000,000,000 |
| Community | 0.08  | 0.08 × S | 80,000,000,000  |
| Founder   | 0.05  | 0.05 × S | 50,000,000,000  |
| Charity   | 0.05  | 0.05 × S | 50,000,000,000  |

---

## 4.2 Verification Constraint

[
\sum allocation = S
]

[
500B + 120B + 100B + 80B + 50B + 50B = 1,000B
]

[
\sum ratio = 1.00
]

---

# 🔄 5. Circulation Model

## 5.1 Initial Circulation

[
C_0 = 0.10 \times S = 100,000,000,000
]

## 5.2 Locked Supply

[
L_0 = 0.90 \times S = 900,000,000,000
]

Constraint:

[
C_0 + L_0 = S
]

---

# ⏳ 6. Unlock Function

Let:

* ( L_n ) = locked supply at period n
* ( R_n ) = release at period n

### Release rule:

[
R_n = 0.10 \times L_{n-1}
]

### State transition:

[
L_n = L_{n-1} - R_n
]

---

## 6.1 Closed-form decay

[
L_n = L_0 \cdot (0.9)^n
]

[
C_n = S - L_n
]

---

# 📉 7. Burn Model

If burn is enabled:

[
S_{effective} = S - B
]

Where:

* ( B ) = cumulative burned tokens
* ( B \geq 0 )
* ( B \leq S )

No re-minting:

[
\frac{dB}{dt} \geq 0
]

---

# 📊 8. Liquidity Constraint Model

Liquidity pool requirement:

[
LP_{min} > 0
]

Initial market formation condition:

[
Liquidity_{USD} \geq L_{threshold}
]

(No protocol-defined value; market dependent)

---

# 🔐 9. System Constraints

* No mint function:
  [
  \text{mint} = \emptyset
  ]

* No admin supply control:
  [
  control_{centralized} = 0
  ]

* No inflation:
  [
  \pi = 0
  ]

---

# 📌 10. Final Model Summary

### Supply System:

[
S_{fixed} = 10^{12}
]

### State Vector:

[
(S, C_n, L_n, B)
]

Where:

* S = total fixed supply
* C = circulating supply
* L = locked supply
* B = burned supply

Constraint:

[
S = C_n + L_n + B
]

---

# ✅ Result

This Tokenomics model is:

* mathematically deterministic
* supply-invariant
* governance-free
* audit-ready
* fully on-chain verifiable

