# Practical IT Infrastructure Roadmap

**Professional name:** Jaret Abad
**Current foundation:** Google IT Support Certificate — Course 1 completed; Course 2, *The Bits and Bytes of Computer Networking*, in progress.
**Portfolio approach:** guided hands-on labs, reproducible evidence, privacy-first documentation, and clear separation between verified results and planned work.

## Purpose

This roadmap builds practical experience for several realistic entry-level paths rather than targeting a single job title. Each project is designed to produce evidence that can be reviewed, explained, and reproduced without exposing personal or endpoint-identifying information.

The portfolio supports progression across these professional areas:

- **Technical support:** endpoint diagnostics, structured troubleshooting, documentation, and escalation.
- **NOC and networking:** TCP/IP, DNS, routing, service reachability, packet analysis, and layered fault isolation.
- **Data center and infrastructure operations:** system health, monitoring, recovery, capacity awareness, and operational runbooks.
- **Systems administration:** Windows and Linux administration, services, permissions, automation, patching, and backup validation.
- **Identity:** local accounts, group-based access, Active Directory, Group Policy, and least-privilege administration.
- **Infrastructure and cloud:** repeatable configuration, virtualization, automation, observability, and mapping on-premises controls to cloud concepts.
- **Entry-level security:** hardening, evidence handling, logging, access control, security baselines, and introductory incident response.

## Portfolio standards

Every completed lab should:

1. State its scope and limitations.
2. Separate facts, hypotheses, and unresolved questions.
3. Use least privilege and document any required elevation.
4. Preserve private evidence locally while publishing only sanitized artifacts.
5. Include a repeatable validation method.
6. Avoid claiming a root cause, fix, or result that the evidence does not establish.
7. Produce material that can be explained naturally in a technical interview.

## Planned project sequence

| Order | Lab or mini-project | Primary competencies | Planned portfolio evidence |
|---:|---|---|---|
| 1 | Windows Endpoint Diagnostic Toolkit | Windows, PowerShell, endpoint support, networking, privacy hardening | Script, sanitized connectivity evidence, ticket, case study, checksum, and redaction review |
| 2 | Network Troubleshooting Casebook | TCP/IP, DHCP, DNS, routing, ports, NOC workflows | Layered troubleshooting records and network diagram |
| 3 | Windows Identity, Permissions, and Service Recovery | Accounts, access control, NTFS permissions, Windows services | Access matrix, recovery runbook, and sanitized support cases |
| 4 | Linux Support Workstation with WSL 2 | Linux administration, permissions, packages, processes, services, and logs | Linux runbook and health-check script |
| 5 | PowerShell Onboarding and Inventory Automation | Automation, validation, idempotency, error handling, and rollback | Scripts, fictional input data, test results, and workflow diagram |
| 6 | Packet Analysis with Wireshark | ARP, DNS, TCP, TLS, packet filtering, and escalation evidence | Sanitized packet analysis and protocol diagrams |
| 7 | Active Directory and Identity Operations Homelab | AD DS, DNS, users, groups, Group Policy, and identity troubleshooting | Isolated domain design, access matrix, and validated identity cases |
| 8 | Infrastructure Operations, Backup, and Recovery | Monitoring, capacity, scheduled operations, backup, restore, and integrity validation | Operations runbook, change record, and recovery evidence |
| 9 | Security Baseline and Introductory Incident Response | Endpoint hardening, security controls, limited log analysis, evidence integrity, and incident timelines | Baseline, findings register, sanitized timeline, and incident report |
| 10 | Small-Business Infrastructure Capstone | Windows, Linux, networking, identity, automation, recovery, security, and cloud-aligned operations | Architecture, runbooks, scripts, support cases, risk register, and executive summary |

---

## Lab 01 — Windows Endpoint Diagnostic Toolkit

### Objective

Build and harden a PowerShell diagnostic toolkit that gathers endpoint health information while separating private diagnostic evidence from a reduced public portfolio view. The project demonstrates structured collection, least-privilege execution, validation, documentation, and responsible handling of sensitive system and network data.

### Employer relevance

The workflow is relevant to technical support, desktop support, NOC escalation, junior systems administration, infrastructure operations, and entry-level security because it shows how to:

- collect consistent diagnostic data before changing a system;
- distinguish observation from remediation;
- test connectivity by layer;
- preserve detailed evidence locally;
- sanitize public-facing results; and
- document uncertainty without overstating a conclusion.

### Validated status

**Privacy hardening is validated. The technical baseline is partial.**

The final controlled, non-elevated validation produced these public connectivity results:

| Test | Result | Supported conclusion |
|---|---|---|
| DNS resolution | `PASS` | The selected public hostname resolved during the controlled run. |
| HTTPS reachability | `PASS` | A TCP connection to the selected public HTTPS endpoint succeeded during the controlled run. |
| TCP/IP loopback | `ERROR` | The test encountered an error; the public output intentionally exposes no raw exception details. |
| Default gateway | `NOT RUN` | The toolkit did not run this test because no usable gateway candidate was available to the test logic. |

These results do **not** establish a root cause for the loopback error or the gateway result. They also do not constitute a complete technical baseline because several endpoint sections were not reproduced in the final controlled environment.

The public projection uses fixed, sanitized messages for `PASS`, `FAIL`, `ERROR`, and `NOT RUN`. Synthetic exception testing confirmed that fictitious sensitive values did not pass into the public connectivity object. Full diagnostic exceptions are reserved for the locally stored private evidence area.

### Public artifacts

- [Lab guide](01_Windows_Diagnostic_Toolkit/README.md)
- [PowerShell diagnostic script](01_Windows_Diagnostic_Toolkit/scripts/Collect-ITDiagnostics.ps1)
- [Evidence index](01_Windows_Diagnostic_Toolkit/evidence/README.md)
- [Sanitized support ticket](01_Windows_Diagnostic_Toolkit/evidence/HD-001-Endpoint-Baseline.md)
- [Case study](01_Windows_Diagnostic_Toolkit/evidence/Lab-01-Case-Study.md)
- [Sanitized connectivity results](01_Windows_Diagnostic_Toolkit/evidence/Connectivity-Tests-Sanitized.csv)
- [Script SHA-256 checksum](01_Windows_Diagnostic_Toolkit/evidence/Script-SHA256.txt)
- [Completed redaction checklist](01_Windows_Diagnostic_Toolkit/evidence/Redaction-Checklist-Completed.md)

### Remaining technical work

A future interactive validation may investigate why loopback returned `ERROR` and why the gateway test returned `NOT RUN`. That work must begin with fresh observation and must not assume that the controlled execution environment caused either result.

---

## Lab 02 — Network Troubleshooting Casebook

### Planned objective

Build three controlled troubleshooting cases around loss of connectivity, DNS resolution failure, and application-port reachability. Use a layered method to separate link, addressing, default gateway, name resolution, transport, and application symptoms.

### Planned evidence

- A sanitized network diagram.
- Three troubleshooting records that separate facts, hypotheses, tests, and conclusions.
- A command reference for native Windows networking tools.
- Validation and rollback notes for each controlled scenario.

### Career relevance

This project supports technical support, NOC, network support, data center operations, and infrastructure escalation roles.

---

## Lab 03 — Windows Identity, Permissions, and Service Recovery

### Planned objective

Use isolated test accounts and resources to investigate access denial, group membership, NTFS permissions, and a controlled Windows service issue. Apply the minimum change required and verify the result under the affected test context.

### Planned evidence

- A user–group–permission matrix.
- Sanitized access and service-recovery cases.
- A least-privilege troubleshooting runbook.
- Before-and-after validation that does not expose personal account data.

### Career relevance

This project supports technical support, systems administration, identity operations, and access-management roles.

---

## Lab 04 — Linux Support Workstation with WSL 2

### Planned objective

Build an Ubuntu learning environment in WSL 2 and practice filesystem navigation, users, groups, ownership, permissions, package management, processes, services, and log inspection.

Installation or configuration that requires Administrator access will be treated as a separate approved step and verified before the lab continues.

### Planned evidence

- A Linux operations runbook.
- A Bash health-check script.
- A permissions matrix.
- A controlled service-recovery case.

### Career relevance

This project supports technical support, Linux support, NOC, data center, infrastructure, cloud operations, and junior systems administration roles.

---

## Lab 05 — PowerShell Onboarding and Inventory Automation

### Planned objective

Automate a fictional onboarding and asset-inventory workflow with input validation, safe preview behavior, structured error handling, idempotency checks, logging, and rollback.

### Planned evidence

- Commented PowerShell scripts.
- Fictional input data with no real identities.
- Test cases for success, failure, repeated execution, and rollback.
- An input–validation–action–log workflow diagram.

### Career relevance

This project supports technical support automation, systems administration, identity operations, infrastructure operations, and cloud-aligned administration.

---

## Lab 06 — Packet Analysis with Wireshark

### Planned objective

Capture only lab-generated traffic and trace ARP, DNS, the TCP three-way handshake, and TLS setup. Use display filters to isolate transactions and identify what each protocol layer proves.

### Planned evidence

- A minimal sanitized capture or redacted screenshots when a packet capture cannot be published safely.
- A packet-number–layer–interpretation table.
- DNS and TCP sequence diagrams.
- A concise escalation analysis.

### Career relevance

This project supports NOC, network support, data center, infrastructure, technical support, and entry-level security roles.

---

## Lab 07 — Active Directory and Identity Operations Homelab

### Planned objective

Build an isolated Active Directory environment with AD DS, DNS, organizational units, users, security groups, a domain-joined client, and Group Policy. Practice common identity and policy troubleshooting with fictional accounts.

Virtualization, Windows Server evaluation software, and any Administrator-level changes will be reviewed and approved before installation.

### Planned evidence

- Logical and network architecture diagrams.
- A sanitized domain build sheet.
- An organizational-unit and group-access matrix.
- Identity and Group Policy troubleshooting cases.

### Career relevance

This project supports technical support, systems administration, identity and access management, infrastructure operations, and entry-level security roles.

---

## Lab 08 — Infrastructure Operations, Backup, and Recovery

### Planned objective

Practice endpoint and small-infrastructure operations through health monitoring, capacity review, scheduled tasks, backup, controlled loss, restore, and integrity validation. Map the operational controls to comparable on-premises and cloud concepts without claiming production cloud experience.

### Planned evidence

- An operations and recovery runbook.
- A sanitized scheduled-task definition.
- Pre-recovery and post-recovery integrity checks.
- A change record with validation and rollback criteria.

### Career relevance

This project supports data center operations, infrastructure support, systems administration, cloud operations, and technical support roles.

---

## Lab 09 — Security Baseline and Introductory Incident Response

### Planned objective

Compare a lab endpoint against a defined security baseline, prioritize findings by risk and impact, validate a reversible hardening change, and build a limited incident timeline from known benign test events.

The project will not use malware, evasion techniques, unauthorized targets, or unrestricted log publication.

### Planned evidence

- A security-baseline checklist.
- A findings register with severity, evidence, and recommended remediation.
- Before-and-after control validation.
- A sanitized timeline and introductory incident report.

### Career relevance

This project supports endpoint security, entry-level security operations, systems administration, identity, and infrastructure roles.

---

## Lab 10 — Small-Business Infrastructure Capstone

### Planned objective

Design and operate a fictional small-business lab that combines Windows, Linux, networking, identity, automation, backup, recovery, monitoring, and security. Where practical, map components to cloud service models while clearly separating lab work from production experience.

### Planned evidence

- A sanitized architecture diagram and fictional asset inventory.
- Build, operations, escalation, and recovery runbooks.
- Reproducible troubleshooting cases.
- Automation scripts with validation and rollback.
- A risk register and concise executive summary.

### Career relevance

This capstone is intended to demonstrate transferable thinking across technical support, NOC/networking, data center, systems administration, infrastructure/cloud, identity, and entry-level security opportunities.

---

## Career-readiness milestones

### After Labs 01–03

The portfolio should provide honest project evidence for endpoint diagnostics, structured troubleshooting, PowerShell, networking fundamentals, permissions, identity, and technical documentation.

### After Labs 04–06

The portfolio should add Linux operations, automation, protocol analysis, and stronger network-escalation evidence.

### After Lab 07

The portfolio should include direct homelab practice with Active Directory, DNS, group-based access, and Group Policy.

### After Labs 08–10

The portfolio should demonstrate an integrated operations narrative across infrastructure health, recovery, security, identity, networking, automation, and cloud-aligned concepts.

## Credibility rules

- Describe this work as a **home lab**, **technical project**, or **simulated support environment**, not as paid production experience.
- Preserve enough sanitized evidence to reproduce each public claim.
- Never publish credentials, secrets, raw logs, personal network values, or endpoint-identifying data.
- State whether a result is observed, inferred, unresolved, or planned.
- Claim only work that has been performed and can be explained without relying on a prepared script.
