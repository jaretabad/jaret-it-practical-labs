# Jaret IT Practical Labs

Hands-on IT portfolio documenting self-directed projects across IT support, Windows troubleshooting, networking, Microsoft 365, Microsoft Entra ID, endpoint management, Microsoft Azure, SaaS administration, PowerShell automation, security, and enterprise operations.

The repository follows a progressive learning path: it begins with validated Windows and network troubleshooting projects and develops toward cloud, systems, identity, endpoint, and SaaS administration. Each project emphasizes safe execution, evidence-based conclusions, professional documentation, and privacy-aware portfolio artifacts.

## Professional Overview

This portfolio began with practical Windows diagnostics and layered network troubleshooting. It is now evolving toward:

- Cloud and Systems Administration
- Identity and Access Management
- Microsoft 365 administration
- Endpoint Management
- Azure administration
- SaaS operations

The work is designed to build practical, explainable, and transferable skills for relevant entry-level and early-career IT roles. Projects are documented as hands-on learning and simulated enterprise work, not as production employment experience.

## Current Learning Status

| Area | Status |
|---|---|
| Lab 01 — Windows Diagnostic Toolkit | **Completed** |
| Lab 02 — Network Troubleshooting Casebook | **Completed** |
| Google IT Support Professional Certificate | **In Progress** |
| Course 2 — The Bits and Bytes of Computer Networking | **In Progress** |
| Module 01 — Enterprise Identity & Microsoft Cloud Foundations | **Next** |
| Lab 03 — Enterprise Identity Lifecycle & Access Control Simulation | **Planned / Not Started** |

## Completed Projects

### Lab 01 — Windows Diagnostic Toolkit

**Status:** Completed

Lab 01 uses a non-elevated PowerShell toolkit to collect endpoint diagnostic evidence without changing Windows configuration. The project separates private raw evidence from reviewed portfolio artifacts and uses fixed public messages to prevent raw exceptions from appearing in published connectivity results.

**Skills demonstrated:**

- Windows endpoint diagnostics
- PowerShell scripting and troubleshooting
- TCP/IP, DNS, default-gateway, and HTTPS port-reachability testing
- Least-privilege execution
- SHA-256 evidence validation
- Technical ticket and case-study documentation
- Privacy review and evidence sanitization

[Open Lab 01 — Windows Diagnostic Toolkit](01_Windows_Diagnostic_Toolkit/README.md)

#### Reviewed Lab 01 artifacts

- [Diagnostic toolkit script](01_Windows_Diagnostic_Toolkit/scripts/Collect-ITDiagnostics.ps1)
- [Sanitized support ticket](01_Windows_Diagnostic_Toolkit/evidence/HD-001-Endpoint-Baseline.md)
- [Case study](01_Windows_Diagnostic_Toolkit/evidence/Lab-01-Case-Study.md)
- [Sanitized connectivity results](01_Windows_Diagnostic_Toolkit/evidence/Connectivity-Tests-Sanitized.csv)
- [Script SHA-256 record](01_Windows_Diagnostic_Toolkit/evidence/Script-SHA256.txt)
- [Completed redaction checklist](01_Windows_Diagnostic_Toolkit/evidence/Redaction-Checklist-Completed.md)

### Lab 02 — Network Troubleshooting Casebook

**Status:** Completed

Lab 02 applies a structured, layered troubleshooting method to controlled network scenarios. It separates observed symptoms, hypotheses, tests, conclusions, and escalation considerations across local configuration, TCP/IP, DHCP, default-gateway reachability, DNS, routing, and application-port connectivity.

**Skills demonstrated:**

- TCP/IP and DHCP troubleshooting
- DNS resolution testing
- Default-gateway and routing analysis
- Port-reachability validation
- Layered fault isolation
- Evidence-based technical documentation
- Safe, privacy-aware troubleshooting

[Open Lab 02 — Network Troubleshooting Casebook](02_Network_Troubleshooting_Casebook/README.md)

## Current Professional Direction

Upcoming projects will progressively focus on:

- Microsoft 365
- Microsoft Entra ID
- Microsoft Intune
- Microsoft Defender
- Microsoft Azure
- SaaS integrations
- Microsoft Graph PowerShell
- Enterprise IT operations
- Security and compliance foundations

Future projects will be selected and implemented according to current learning progress, tool availability, cost and licensing, professional relevance, and safety and privacy requirements. Planned technologies are learning objectives and are not presented as already mastered.

## Technologies and Skills

### Currently demonstrated

- Windows 11
- PowerShell
- Windows diagnostics
- TCP/IP
- DNS
- Gateway troubleshooting
- Port reachability
- Layered troubleshooting
- Git and GitHub
- Technical documentation

### Planned learning

- Microsoft 365
- Microsoft Entra ID
- Microsoft Intune
- Microsoft Defender
- Microsoft Azure
- SaaS administration
- Microsoft Graph PowerShell
- Role-based access control (RBAC)
- Identity lifecycle
- Enterprise operations

## Roadmap

The [Cloud, Systems, Identity & SaaS Roadmap](ROADMAP.md) is the primary planning source for the repository. It contains the current lab sequence, learning phases, professional direction, investment policy, and safety standards.

## Portfolio Standards

- All public evidence is sanitized before publication.
- No passwords, tokens, tenant IDs, subscription IDs, personal identifiers, or other sensitive values are intentionally published.
- Projects are described accurately as **hands-on labs**, **self-directed projects**, or **simulated enterprise environments**.
- Labs are not presented as production employment experience.
- Procedures emphasize safety, verification, documentation, least privilege, and rollback planning.
- Private diagnostic evidence remains separate from reviewed public portfolio artifacts.

## Repository Guide

- [Start here](START-HERE.md) for the learning method and project structure.
- Review the [current roadmap](ROADMAP.md) for the lab sequence and learning phases.
- Open the [Lab 01 guide](01_Windows_Diagnostic_Toolkit/README.md) for the Windows diagnostic workflow.
- Open the [Lab 02 guide](02_Network_Troubleshooting_Casebook/README.md) for the network troubleshooting casebook.
- Use the [Lab 01 evidence index](01_Windows_Diagnostic_Toolkit/evidence/README.md) to navigate reviewed portfolio artifacts.
