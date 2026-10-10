# Jaret IT Practical Labs — Current Project Status

Last updated: 2026-10-09

## Purpose and authority

This file is the **sole repository authority for detailed current operational state** across Jaret's IT, Cloud, Systems Administration, Identity, SaaS, Support Operations, and Cybersecurity learning portfolio.

Use the Source-of-Truth order defined in `docs/PROJECT-CONTINUITY-PROTOCOL.md`. Directly verifiable system state takes precedence when available. This file summarizes the current checkpoint after that verification.

Do **not** duplicate module-by-module current progress in `README.md` or `ROADMAP.md`. Those documents should reference this file instead.

## Canonical repository

- Repository: `jaretabad/jaret-it-practical-labs`
- Default branch: `main`
- Visibility: public
- `PROJECT-CONTEXT.md` may exist locally and is intentionally excluded from Git.
- Directly verified Git/system/platform state overrides this summary if they conflict.

## Professional direction

Primary journey:

**Jaret Cloud & Systems Administration Journey — Microsoft 365, Azure, Identity & SaaS**

Current progression remains:

IT Support foundations → Windows troubleshooting → Networking → Operating Systems → Enterprise Identity → Microsoft 365 / Entra ID → Endpoint Management → Azure → SaaS Administration → Security / Cybersecurity.

All portfolio work must remain clearly represented as hands-on learning, self-directed labs, or simulated enterprise work rather than production employment experience.

## Current learning checkpoint

### Completed

- Lab 01 — Windows Diagnostic Toolkit
- Lab 02 — Network Troubleshooting Casebook
- Google IT Support Professional Certificate — Course 1: Technical Support Fundamentals
- Google IT Support Professional Certificate — Course 2: The Bits and Bytes of Computer Networking
- Google IT Support Professional Certificate — Course 3: Operating Systems and You: Becoming a Power User
  - Module 1 — Basic Commands: **Completed**
  - Module 2 — Users and Permissions: **Completed**

### Active

- Google IT Support Professional Certificate
- Course 3 — Operating Systems and You: Becoming a Power User
  - Module 3 — Package and Software Management: **In Progress**
  - Operational conversation active.
  - Lesson study completed in this conversation so far:
    - Windows: Software Packages
    - Supplemental Reading for Windows Software Packages
    - Linux: Software Packages
  - A package-management practical reinforcement mini-lab is intentionally deferred until enough related lessons exist to form a higher-value workflow rather than an isolated command exercise.
  - Next step: continue with the next exact Coursera lesson title supplied by Jaret.

### Queued / ready after current Coursera priority

- Module 01 — Enterprise Identity & Microsoft Cloud Foundations

### Planned / not started

- Lab 03 — Enterprise Identity Lifecycle & Access Control Simulation
- Mini-Module S1 — Microsoft Excel for IT Support Operations
- Lab S1 — Help Desk Ticket Lifecycle Simulation

## Course 3 checkpoint detail

### Module 1 — Basic Commands — Completed

Completion included:

- coursework / lesson study;
- graded review;
- Qwiklabs practical activities;
- glossary review; and
- final Module 1 study PDF, reviewed as a private study artifact.

Routine guided Qwiklabs were intentionally not promoted into standalone public portfolio projects.

### Module 2 — Users and Permissions — Completed

User-confirmed closeout includes:

- Windows users, administrators, groups, passwords, account lifecycle, and file permissions;
- Linux users, `root` / `sudo`, passwords, account lifecycle, file permissions, `chmod`, `chown`, and `chgrp`;
- SetUID, SetGID, and Sticky Bit;
- Mobile Users and Accounts;
- Windows ACL / DACL / SACL concepts;
- `ICACLS` practical work in Qwiklabs;
- Module 2 glossary review;
- module review / quiz work; and
- final Module 2 Study PDF created and reviewed as a private study artifact.

### Module 3 — Package and Software Management — In Progress

Current covered lesson sequence:

1. **Windows: Software Packages**
2. **Supplemental Reading for Windows Software Packages**
3. **Linux: Software Packages**

Current practical-reinforcement decision:

- do not create a filler lab immediately after a single `apt`/package-management concept;
- wait until the lesson sequence supports a more complete workflow such as `Identify → Inspect/Search → Install → Verify → Troubleshoot if needed → Remove/Clean up → Verify`;
- treat any such mini-lab as study reinforcement first, not automatically as a public portfolio project.

Module completion remains gated on required coursework, graded review, practical work when applicable, glossary review, weak-area review, and final Study PDF workflow.

## Instruction architecture checkpoint

The project now uses a two-layer ChatGPT instruction model:

- **Local ChatGPT Project Instructions** — compact always-loaded bootstrap only;
- **`docs/CHATGPT-PROJECT-INSTRUCTIONS.md`** — extended version-controlled canonical ChatGPT operating policy.

The extended policy contains durable teaching, practical-reinforcement, troubleshooting, PDF, privacy, Git, device, career, and paid/cloud-resource rules so future improvements no longer need to consume the limited local Project Instruction space.

Progressive context loading is the default for meaningful ChatGPT work:

`Local bootstrap → verify current state → PROJECT-STATUS.md → extended ChatGPT policy → relevant canonical documents only`

## Current operating priority

The immediate learning priority remains the Google IT Support Professional Certificate through Course 3.

Strategic sequence:

`Course 3 active → finish current Course 3 module(s) → Module 01 → Lab 03`

Complementary track:

`Mini-Module S1 → Lab S1`

The Support Operations Track may receive limited parallel study time, but it must not replace or delay the primary Course 3 / Module 01 / Lab 03 sequence unless the roadmap is intentionally changed.

## Cloud and paid-resource status

At this checkpoint:

- No Microsoft 365 tenant has been created for Module 01.
- No Azure subscription or paid Azure resource has been intentionally created for Module 01.
- No paid cloud licensing decision should be made without evaluating current price, recurring charges, practical learning value, portfolio value, safer alternatives, monitoring, and cleanup / deletion plan.

Update this section when the real account/resource state changes.

## Portfolio evidence standards

- Never publish passwords, tokens, API keys, tenant IDs, subscription IDs, personal identifiers, private network values, raw sensitive logs, or secrets.
- Keep private/raw evidence separate from reviewed public artifacts.
- Claim only skills and results that were actually performed, validated, documented, and can be explained.
- Do not present labs, Qwiklabs, simulations, or self-directed projects as production employment experience.
- Preserve completed labs and study artifacts; do not redo them unless a later task genuinely requires a targeted refresh or extension.

## Immediate next action

Continue the official Course 3 Module 3 operational conversation.

**Next safe step:** Jaret provides the next exact Coursera lesson title for **Module 3 — Package and Software Management**.

## Documentation update rule

Update this file when a material current-state change occurs, including:

- a course, module, lab, or meaningful study block starts or completes;
- the immediate next action changes;
- a roadmap priority materially changes;
- a paid/cloud resource is created, removed, or becomes financially relevant;
- a meaningful repository milestone is published;
- a new track is activated or retired; or
- a current safety/privacy constraint changes.

Do not update `README.md`, `ROADMAP.md`, or durable governance files merely to mirror routine current progress.
