 Escrow Smart Contract (Solidity)

A **minimal, logic-first Escrow smart contract** written in Solidity. This contract safely locks ETH between a **buyer** and a **seller** and releases funds only when predefined conditions are met.

This project focuses on **state machines, access control, and secure ETH transfers**, not UI or hype.

---

##  What Problem Does This Solve?

In many real-world transactions:

* A buyer wants assurance before paying
* A seller wants assurance before delivering

This Escrow contract:

* Locks ETH on-chain
* Releases funds only after buyer confirmation
* Prevents cheating by either party

---

## Actors

* **Buyer** – Deposits ETH and confirms delivery
* **Seller** – Receives ETH after confirmation
* **Escrow Contract** – Holds ETH and enforces rules

Actors are **fixed at deployment** and cannot be changed.


> Built as a learning-focused Web3 project to strengthen Solidity fundamentals and protocol-level thinking.
