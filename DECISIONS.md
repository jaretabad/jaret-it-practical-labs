# Jaret IT Practical Labs — Material Decisions

## Purpose

This file records **material decisions already made** that should remain understandable across conversations and future project stages.

It is not a current-status tracker and should not be updated for routine lesson, quiz, module, or lab progress.

Use:

- `PROJECT-STATUS.md` for current operational state;
- `ROADMAP.md` for future sequence and priorities;
- `docs/PROJECT-CONTINUITY-PROTOCOL.md` for durable working rules; and
- this file for decisions whose rationale should remain visible after current status changes.

---

## D-001 — GitHub repository is the canonical project source

**Status:** CONFIRMED

The canonical repository is:

`jaretabad/jaret-it-practical-labs`

Directly verifiable Git/GitHub/system/platform evidence takes precedence when available. Repository documentation summarizes and organizes that state but does not override stronger current evidence.

Conversation history and memory support continuity but are not the primary authority when verifiable sources exist.

---

## D-002 — Current-state details live in PROJECT-STATUS.md

**Status:** CONFIRMED

`PROJECT-STATUS.md` is the sole repository authority for detailed current operational state, including:

- active course/module/lab;
- completed learning blocks;
- immediate next action;
- cloud/resource state; and
- meaningful current blockers or constraints.

`README.md` and `ROADMAP.md` must not duplicate transient module-level progress. This decision exists specifically to reduce documentation drift.

---

## D-003 — Portfolio claims must distinguish learning from employment

**Status:** CONFIRMED

Labs, guided labs, simulations, self-directed projects, course exercises, Qwiklabs, and portfolio projects may demonstrate practical skill, but they must not be described as production employment experience.

Public evidence must be sanitized, reproducible where practical, and limited to results that were actually performed and can be explained.

---

## D-004 — Cloud / paid resources require a value and risk gate

**Status:** CONFIRMED

No Microsoft 365 tenant, Azure subscription/resource, paid license, cloud sandbox, or recurring-cost tool should be activated solely because it appears useful.

Before activation, evaluate:

- purpose;
- current price and recurring cost;
- unexpected-charge risk;
- free or lower-cost alternatives;
- practical learning value;
- portfolio value;
- readiness/prerequisites;
- monitoring; and
- cleanup/deletion plan.

Paid resources are acceptable when their professional value justifies the cost.

---

## D-005 — Support Operations Track is complementary, not a replacement path

**Status:** CONFIRMED

Mini-Module S1 — Microsoft Excel for IT Support Operations and Lab S1 — Help Desk Ticket Lifecycle Simulation are complementary learning blocks.

They may run in parallel in a limited way, but they must not unintentionally replace or delay the primary Google IT Support → Enterprise Identity → Microsoft Cloud progression unless the roadmap is deliberately revised.

---

## D-006 — Course study uses module-level operational conversations

**Status:** CONFIRMED

For structured courses with clear modules, use one operational conversation per module by default.

A new module conversation continues the same project rather than resetting it. The prior module must remain preserved, and the next module should begin only after the previous module's required coursework, review, practical work when applicable, glossary/weak-area review, and established completion artifact workflow are closed.

Detailed teaching and completion rules remain defined in `docs/PROJECT-CONTINUITY-PROTOCOL.md`.

---

## Decision-log maintenance

Add a new decision only when the choice is material enough that a future conversation would benefit from knowing **what was decided and why**.

Do not use this file for:

- lesson completion;
- ordinary quiz results;
- temporary next steps;
- transient blockers;
- routine repository housekeeping; or
- information already better represented as current status or roadmap planning.
