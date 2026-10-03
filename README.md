# Jaret IT Practical Labs

Hands-on IT portfolio documenting self-directed projects across IT support, Windows troubleshooting, networking, Microsoft 365, Microsoft Entra ID, endpoint management, Microsoft Azure, SaaS administration, PowerShell automation, security, and enterprise operations.

The repository follows a progressive learning path: it begins with validated Windows and network troubleshooting projects and develops toward cloud, systems, identity, endpoint, SaaS, and security administration. Each project emphasizes safe execution, evidence-based conclusions, professional documentation, and privacy-aware portfolio artifacts.

## Professional overview

This portfolio is designed to build practical, explainable, and transferable skills for relevant entry-level and early-career roles across:

- IT Support / Help Desk;
- Technical Support / Desktop Support;
- Systems Administration;
- Cloud Support and Administration;
- Identity and Access Management;
- Microsoft 365 / Entra operations;
- SaaS administration; and
- entry-level security operations.

Projects are documented as hands-on learning, self-directed labs, and simulated enterprise work — not as production employment experience.

## Current project state

Detailed live learning progress is intentionally maintained in one place to prevent documentation drift:

**[PROJECT-STATUS.md](PROJECT-STATUS.md)**

Use that file for the active course/module/lab, completed learning blocks, current resource state, and immediate next action.

Use **[ROADMAP.md](ROADMAP.md)** for future sequence and priorities rather than current module-level progress.

## Completed portfolio projects

### Lab 01 — Windows Diagnostic Toolkit

Lab 01 uses a non-elevated PowerShell toolkit to collect endpoint diagnostic evidence without changing Windows configuration. The project separates private raw evidence from reviewed portfolio artifacts and uses fixed public messages to prevent raw exceptions from appearing in published connectivity results.

**Skills demonstrated:**

- Windows endpoint diagnostics;
- PowerShell scripting and troubleshooting;
- TCP/IP, DNS, default-gateway, and HTTPS port-reachability testing;
- least-privilege execution;
- SHA-256 evidence validation;
- technical ticket and case-study documentation; and
- privacy review and evidence sanitization.

[Open Lab 01 — Windows Diagnostic Toolkit](01_Windows_Diagnostic_Toolkit/README.md)

#### Reviewed Lab 01 artifacts

- [Diagnostic toolkit script](01_Windows_Diagnostic_Toolkit/scripts/Collect-ITDiagnostics.ps1)
- [Sanitized support ticket](01_Windows_Diagnostic_Toolkit/evidence/HD-001-Endpoint-Baseline.md)
- [Case study](01_Windows_Diagnostic_Toolkit/evidence/Lab-01-Case-Study.md)
- [Sanitized connectivity results](01_Windows_Diagnostic_Toolkit/evidence/Connectivity-Tests-Sanitized.csv)
- [Script SHA-256 record](01_Windows_Diagnostic_Toolkit/evidence/Script-SHA256.txt)
- [Completed redaction checklist](01_Windows_Diagnostic_Toolkit/evidence/Redaction-Checklist-Completed.md)

### Lab 02 — Network Troubleshooting Casebook

Lab 02 applies a structured, layered troubleshooting method to controlled network scenarios. It separates observed symptoms, hypotheses, tests, conclusions, and escalation considerations across local configuration, TCP/IP, DHCP, default-gateway reachability, DNS, routing, and application-port connectivity.

**Skills demonstrated:**

- TCP/IP and DHCP troubleshooting;
- DNS resolution testing;
- default-gateway and routing analysis;
- port-reachability validation;
- layered fault isolation;
- evidence-based technical documentation; and
- safe, privacy-aware troubleshooting.

[Open Lab 02 — Network Troubleshooting Casebook](02_Network_Troubleshooting_Casebook/README.md)

## Primary learning direction

The roadmap develops progressively toward:

- Microsoft 365 administration;
- Microsoft Entra ID;
- Microsoft Intune;
- Microsoft Defender;
- Microsoft Azure;
- SaaS integrations;
- Microsoft Graph PowerShell;
- enterprise identity and access management;
- enterprise IT operations; and
- security/compliance foundations.

Planned technologies are learning objectives and are not presented as already mastered.

## Support Operations Track

The Support Operations Track is a complementary path for developing practical Help Desk operations, ticket lifecycle management, Excel-based support reporting, prioritization, escalation, troubleshooting documentation, and operational metrics.

Planned learning blocks include:

- **Mini-Module S1 — Microsoft Excel for IT Support Operations**
- **Lab S1 — Help Desk Ticket Lifecycle Simulation**

Detailed live status for this track belongs in `PROJECT-STATUS.md`.

Potential sanitized portfolio evidence may include:

- Excel-based IT support reporting;
- fictional ticket datasets;
- priority and escalation matrices;
- troubleshooting notes;
- resolution summaries;
- dashboards;
- knowledge-base articles; and
- case-study documentation.

## Demonstrated and planned skills

### Currently demonstrated through completed public portfolio work

- Windows 11 troubleshooting;
- PowerShell;
- Windows diagnostics;
- TCP/IP;
- DNS;
- gateway troubleshooting;
- port reachability;
- layered fault isolation;
- Git and GitHub; and
- technical documentation / evidence sanitization.

### Planned learning direction

- Microsoft 365;
- Microsoft Entra ID;
- Microsoft Intune;
- Microsoft Defender;
- Microsoft Azure;
- SaaS administration;
- Microsoft Graph PowerShell;
- RBAC;
- identity lifecycle;
- enterprise operations;
- Microsoft Excel for IT Support operations;
- Help Desk ticket lifecycle and escalation; and
- security operations foundations.

## Portfolio standards

- All public evidence is reviewed and sanitized before publication.
- Passwords, tokens, tenant IDs, subscription IDs, personal identifiers, private network details, or other sensitive values must not be intentionally published.
- Projects are described accurately as **hands-on labs**, **self-directed projects**, **simulated enterprise environments**, or equivalent truthful labels.
- Guided labs and simulations are not presented as production employment experience.
- Procedures emphasize safety, verification, documentation, least privilege, and rollback planning when applicable.
- Private diagnostic evidence and personal study artifacts remain separate from employer-facing portfolio evidence.

## Repository guide

- **[START-HERE.md](START-HERE.md)** — human navigation and repository map.
- **[PROJECT-STATUS.md](PROJECT-STATUS.md)** — current operational checkpoint and immediate next action.
- **[ROADMAP.md](ROADMAP.md)** — long-term sequence, priorities, and planned labs/tracks.
- **[DECISIONS.md](DECISIONS.md)** — material decisions already made.
- **[docs/PROJECT-CONTINUITY-PROTOCOL.md](docs/PROJECT-CONTINUITY-PROTOCOL.md)** — durable continuity, safety, course, lab, and Git workflow rules.
- **[Lab 01](01_Windows_Diagnostic_Toolkit/README.md)** — Windows Diagnostic Toolkit.
- **[Lab 02](02_Network_Troubleshooting_Casebook/README.md)** — Network Troubleshooting Casebook.

## Documentation principle

Public orientation documents intentionally avoid duplicating detailed live module status. This keeps the repository easier to maintain and reduces contradictions as the learning program advances.
