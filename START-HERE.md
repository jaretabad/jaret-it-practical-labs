# Start Here — Jaret IT Practical Labs

This repository documents Jaret's hands-on progression from IT Support fundamentals into Systems Administration, Cloud, Identity, SaaS operations, and Cybersecurity.

The goal of this file is simple: show a human reviewer or future project conversation **where to look for the right information without guessing**.

## If you want the current state

Open:

**[`PROJECT-STATUS.md`](PROJECT-STATUS.md)**

It is the sole repository authority for detailed current operational state, including:

- active course/module/lab;
- completed learning blocks;
- immediate next action;
- current cloud/resource state; and
- meaningful current constraints.

## If you want the long-term plan

Open:

**[`ROADMAP.md`](ROADMAP.md)**

It defines:

- sequence and priorities;
- planned labs;
- learning phases;
- Support Operations Track direction;
- tool/investment strategy; and
- long-term professional development path.

The roadmap intentionally does not duplicate detailed module-by-module current progress.

## If you want to understand why a major choice was made

Open:

**[`DECISIONS.md`](DECISIONS.md)**

It records material decisions worth preserving across conversations and future stages.

Routine lesson progress and temporary next steps do not belong there.

## If you want the working rules

Open:

**[`docs/PROJECT-CONTINUITY-PROTOCOL.md`](docs/PROJECT-CONTINUITY-PROTOCOL.md)**

It defines:

- Source-of-Truth priority;
- continuity across conversations/devices;
- course/module operating method;
- module completion and Study PDF closeout;
- troubleshooting/lab workflow;
- privacy and evidence rules;
- cloud/paid-resource gates;
- Git workflow; and
- documentation drift control.

## If you are an automated repository agent

Open:

**[`AGENTS.md`](AGENTS.md)**

It is a compact execution entry point and references the canonical project documents above.

## Portfolio projects

### Lab 01 — Windows Diagnostic Toolkit

A completed hands-on Windows diagnostic project focused on structured PowerShell evidence collection, layered connectivity checks, least-privilege execution, privacy-aware output, support documentation, and reproducibility.

- [Lab 01 guide](01_Windows_Diagnostic_Toolkit/README.md)
- [Lab 01 case study](01_Windows_Diagnostic_Toolkit/evidence/Lab-01-Case-Study.md)
- [Sanitized endpoint-baseline ticket](01_Windows_Diagnostic_Toolkit/evidence/HD-001-Endpoint-Baseline.md)
- [Sanitized connectivity results](01_Windows_Diagnostic_Toolkit/evidence/Connectivity-Tests-Sanitized.csv)
- [Completed redaction checklist](01_Windows_Diagnostic_Toolkit/evidence/Redaction-Checklist-Completed.md)
- [Script SHA-256 record](01_Windows_Diagnostic_Toolkit/evidence/Script-SHA256.txt)

### Lab 02 — Network Troubleshooting Casebook

A completed troubleshooting project focused on layered network diagnosis across TCP/IP, DHCP, gateway reachability, DNS, routing, and application-port connectivity.

- [Lab 02 guide](02_Network_Troubleshooting_Casebook/README.md)

## How learning work becomes portfolio evidence

Not every course exercise or guided lab should become a public portfolio project.

A stronger portfolio artifact normally adds value through one or more of these:

- independent troubleshooting;
- reproducible commands or scripts;
- evidence-based diagnosis;
- meaningful configuration or validation;
- architecture/design reasoning;
- safe automation;
- technical documentation;
- realistic support scenarios; or
- a clear explanation of what was learned, tested, and verified.

Routine guided exercises may remain private study evidence.

## Publication standard

Public artifacts should communicate the problem, method, relevant evidence, conclusion, and verification without exposing sensitive information.

Do not publish:

- credentials, tokens, or private keys;
- personal/account/device identifiers;
- email addresses;
- serial numbers;
- unnecessary private/public IP or network details;
- unreviewed raw logs;
- tenant/subscription IDs; or
- private customer/user data.

Keep original private evidence separate from sanitized employer-facing artifacts.

## Project continuity rule

A new chat, browser, device, course module, or lab does **not** mean restarting the project.

Use the repository's current Source of Truth, preserve completed work, and continue from the latest verified safe checkpoint.
