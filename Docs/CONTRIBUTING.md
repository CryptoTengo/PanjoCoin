# CONTRIBUTING.md

## PanjoCoin (PNJC) — Contributor Guidelines

**Version:** 1.1 (Updated)
**Date:** July 25, 2026
**Project:** PanjoCoin (PNJC)
**Blockchain:** Polygon PoS
**Token Standard:** ERC-20 (ERC20Burnable + ERC20Permit)
**Smart Contract Address:** `0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF`

---

## 🎯 Introduction

Welcome to the PanjoCoin open‑source project! We are building a transparent, community‑driven blockchain ecosystem on **Polygon PoS**. Your contributions — whether code, documentation, design, testing, or feedback — are invaluable to us.

This document outlines the standards and workflows we follow. By participating, you agree to abide by these guidelines and our Code of Conduct.

---

## 📜 Code of Conduct

We are committed to providing a welcoming and harassment‑free experience for everyone. Please read and follow our **Code of Conduct**.

**In short:**
- Be respectful and inclusive.
- Provide constructive feedback.
- No harassment, discrimination, or personal attacks.
- Report unacceptable behaviour to `conduct@cryptotengo.com`.

---

## 🚀 Getting Started

### Prerequisites

| Requirement | Version |
| :--- | :--- |
| **Node.js** | v18 or higher |
| **npm** or **yarn** | Latest stable |
| **Git** | Latest stable |
| **Hardhat** | Installed via dependencies |
| **Code Editor** | VS Code recommended (with Solidity and Prettier extensions) |

### Repository Setup

```bash
# Fork the repository
# Clone your fork
git clone https://github.com/<YOUR_USERNAME>/PanjoCoin.git
cd PanjoCoin

# Add upstream remote
git remote add upstream https://github.com/CryptoTengo/PanjoCoin.git

# Install dependencies
npm install   # or yarn install

# Copy environment variables (if applicable)
cp .env.example .env   # and fill in your keys
```

---

## 🤝 How to Contribute

We welcome all types of contributions:

| Area | Examples |
| :--- | :--- |
| **Code** | Smart contracts, tests, deployment scripts, helper libraries. |
| **Documentation** | Whitepaper, Tokenomics, API docs, README, inline comments, guides. |
| **Security** | Code audits, vulnerability reports, threat modelling. |
| **Design** | UI/UX for the ONE+ platform, dashboards, logos. |
| **Community** | Translation, moderation, answering questions, promoting the project. |

---

## 🧑‍💻 Development Workflow

### 1. Choose an Issue

Look for issues labelled `good first issue`, `help wanted`, or `bug`. If you want to work on something not yet tracked, open a **Discussion** or create an **Issue** first to avoid duplication.

### 2. Create a Branch

Use a descriptive branch name based on the type of change:

| Branch Type | Format |
| :--- | :--- |
| **Feature** | `feature/issue-number-short-description` |
| **Fix** | `fix/issue-number-short-description` |
| **Docs** | `docs/issue-number-short-description` |
| **Test** | `test/issue-number-short-description` |
| **Security** | `security/issue-number-short-description` |

**Example:** `feature/42-add-vesting-cliff`

### 3. Write Code

Follow our **Coding Standards**. Keep changes focused and atomic.

### 4. Test Thoroughly

- Add unit tests for new functionality.
- Run the full test suite: `npx hardhat test`
- Check coverage: `npx hardhat coverage` (aim for >90% for new code)
- Test on a testnet if your changes affect deployment or upgrade logic.

### 5. Commit Changes

Write clear, **conventional commit messages**:

```
<type>(<scope>): <subject>

<optional body>
```

**Types:** `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `chore`, `security`

**Example:**

```
feat(vesting): add cliff period support

- Added `cliffDuration` parameter to VestingVault
- Updated tests to cover cliff logic
- Updated documentation
```

### 6. Push and Open a Pull Request (PR)

- Push your branch to your fork: `git push origin your-branch`
- Open a PR against the `main` branch of the main repository.
- Use the PR template (if available) and fill in:
  - What does this PR do?
  - Why is it needed? (link to issue)
  - How has it been tested?
  - Checklist (self‑review).

### 7. Review Process

- At least one maintainer will review your PR.
- Address any feedback promptly.
- Once approved and all checks (CI, tests) pass, a maintainer will merge it.

---

## 📏 Coding Standards

### Solidity

| Standard | Specification |
| :--- | :--- |
| **Version** | `pragma solidity ^0.8.36;` |
| **Style** | Follow [Solidity Style Guide](https://docs.soliditylang.org/en/latest/style-guide.html) |
| **Indentation** | 4 spaces (no tabs) |
| **Naming** | Contracts, libraries, structs, events: `CapWords`; Functions, variables, modifiers: `camelCase`; Constants: `UPPER_CASE_WITH_UNDERSCORES` |
| **NatSpec** | Every public/external function must have `@notice`, `@param`, `@return` (if applicable). |
| **Imports** | Use named imports from `@openzeppelin/contracts`; sort alphabetically. |
| **Addresses** | No hardcoded addresses (use constants or config). |
| **Timestamps** | Avoid `block.timestamp` for critical logic – use time‑locked mechanisms where possible. |

### JavaScript/TypeScript (tests & scripts)

- Use ESLint and Prettier (config provided).
- Write descriptive test names (`it('should revert when ...')`).
- Use `async/await` with proper error handling.
- Avoid `console.log` in production code.

### General

- Keep functions small and focused.
- Prefer libraries over inheritance where possible.
- Document non‑obvious decisions with inline comments.
- Ensure all new code is covered by tests.

---

## 🧪 Testing Guidelines

| Test Type | Description |
| :--- | :--- |
| **Unit tests** | Use Hardhat + Ethers. Mock external dependencies when needed. |
| **Integration tests** | Test interactions between contracts (e.g., token + locker). |
| **Fork testing** | For complex scenarios, use Hardhat's fork feature with a live network. |
| **Gas reporting** | Run `npx hardhat gas-reporter` to check gas costs. |
| **Security testing** | Use Slither, Mythril, or Echidna for static/dynamic analysis (optional but encouraged). |

---

## 📄 Documentation

- Update the relevant documentation (README, Whitepaper, Tokenomics, etc.) for any user‑facing change.
- For code changes, update **NatSpec** comments.
- For new features, add a short description in the main `README.md` and link to detailed docs.
- All documentation is in **Markdown (.md)** and should be clear, concise, and grammatically correct in **English**.

---

## 🔒 Security

Security is a top priority. If you discover a vulnerability:

- **Do NOT** open a public issue.
- Email `security@cryptotengo.com` with a detailed report.
- We will acknowledge within 48 hours and work on a fix.

See **SECURITY.md** for our full disclosure policy.

We are developing a bug bounty program – details will be announced soon.

---

## 🧠 Community & Communication

| Channel | Purpose |
| :--- | :--- |
| **GitHub Issues** | Bug reports and feature requests. |
| **GitHub Discussions** | General questions, ideas, and Q&A. |
| **Telegram** | Real‑time community chat (link on website). |
| **X (Twitter)** | Official announcements. |

Be respectful and helpful. We are all here to learn and grow together.

---

## 🏆 Recognition

Contributors who make significant, high‑quality contributions may be:

- Mentioned on our **Contributors** page.
- Invited to become **Maintainers** or **Core Team** members.
- Eligible for PNJC rewards (subject to DAO approval in the future – Q4 2026).

We value every contribution, big or small!

---

## 📜 License

By contributing, you agree that your contributions will be released under the **MIT License** (see LICENSE file).

---

## 🔄 Version History

| Version | Date | Changes |
| :--- | :--- | :--- |
| **1.0** | July 23, 2026 | Initial release. |
| **1.1** | July 25, 2026 | Updated Solidity version to 0.8.36; updated contract address; aligned with Whitepaper v2.2 and Tokenomics v2.1; removed references to deprecated mechanisms. |

---

## ❓ Need Help?

- Check existing issues and discussions.
- Join our community channels.
- Reach out directly: `info@cryptotengo.com`.

We're here to help you succeed!

---

## 📋 Smart Contract Reference

| Property | Value |
| :--- | :--- |
| **Token Name** | PanjoCoin |
| **Ticker** | PNJC |
| **Network** | Polygon PoS |
| **Standard** | ERC-20 + ERC20Burnable + ERC20Permit |
| **Total Supply** | 1,000,000,000,000 PNJC |
| **Contract Address** | `0x51ba27A6EB41D879B03ed28eD0A5d6a2982B0BcF` |
| **Transfer Tax** | 0% |
| **Owner** | None (ownerless) |

---

### Document Information

| Property | Value |
| :--- | :--- |
| **Document** | Contributing Guidelines |
| **Version** | 1.1 (Updated) |
| **Date** | July 25, 2026 |
| **Status** | Official |
| **Next Review** | Annually or after major changes |

---

© 2026 PanjoCoin (PNJC) / CryptoTengo. All rights reserved.  
**Document Version:** 1.1 (Updated)  
**Last Updated:** July 25, 2026
