# Jaret IT Practical Labs

Hands-on IT infrastructure portfolio focused on transferable skills across technical support, networking, systems administration, automation, infrastructure/cloud foundations, identity, and security.

This repository documents realistic IT labs from problem definition through validation. Each project emphasizes safe execution, evidence-based troubleshooting, professional documentation, and privacy-aware portfolio artifacts.

## Current progress

| Lab | Focus | Status |
|---|---|---|
| [Lab 01 — Windows Diagnostic Toolkit](01_Windows_Diagnostic_Toolkit/README.md) | Windows, PowerShell, layered connectivity testing, documentation, and privacy hardening | Privacy hardening and point-in-time technical baseline validated |
| [Lab 02 — Network Troubleshooting Casebook](ROADMAP.md#lab-02--network-troubleshooting-casebook) | TCP/IP, DHCP, DNS, routing, and ports | Planned next |

The complete sequence is available in the [practical roadmap](ROADMAP.md).

## Featured project: Windows Diagnostic Toolkit

Lab 01 uses a non-elevated PowerShell toolkit to collect endpoint diagnostic evidence without changing Windows configuration. The project separates private raw evidence from reviewed portfolio artifacts and uses fixed public messages so raw exceptions cannot leak into published connectivity results.

The controlled, non-elevated run completed on July 21, 2026 and supported a successful point-in-time technical baseline:

- TCP/IP loopback: **PASS**
- Default gateway reachability: **PASS**
- DNS resolution: **PASS**
- HTTPS port reachability: **PASS**
- All planned public summary sections were generated
- No Windows configuration changes were made

Storage remained above the defined free-space threshold, all three Windows Firewall profiles were enabled, and Windows Security was visually checked to confirm that Bitdefender was active. Microsoft Defender separately reported `SxS Passive Mode`. Eleven automatic services were observed not running, but that count is an observation rather than proof of failure. The event-log review remained intentionally limited by time and record count.

This result establishes a documented point-in-time baseline, not a guarantee of continued endpoint health.

### Reviewed Lab 01 artifacts

- [Diagnostic toolkit script](01_Windows_Diagnostic_Toolkit/scripts/Collect-ITDiagnostics.ps1)
- [Sanitized support ticket](01_Windows_Diagnostic_Toolkit/evidence/HD-001-Endpoint-Baseline.md)
- [Case study](01_Windows_Diagnostic_Toolkit/evidence/Lab-01-Case-Study.md)
- [Sanitized connectivity results](01_Windows_Diagnostic_Toolkit/evidence/Connectivity-Tests-Sanitized.csv)
- [Script SHA-256 record](01_Windows_Diagnostic_Toolkit/evidence/Script-SHA256.txt)
- [Completed redaction checklist](01_Windows_Diagnostic_Toolkit/evidence/Redaction-Checklist-Completed.md)

## Skills demonstrated so far

- Windows endpoint diagnostics
- PowerShell scripting and troubleshooting
- Layered network troubleshooting
- Least-privilege execution
- Evidence validation with SHA-256
- Technical ticket and case-study documentation
- Separation of private and public evidence
- Privacy review and output sanitization
- Git version-control workflow

## Repository guide

- [Start here](START-HERE.md) for the learning method and project structure.
- Review the [roadmap](ROADMAP.md) for all planned labs.
- Open the [Lab 01 guide](01_Windows_Diagnostic_Toolkit/README.md) for the complete guided workflow.
- Use the [evidence index](01_Windows_Diagnostic_Toolkit/evidence/README.md) to navigate reviewed portfolio artifacts.

## Privacy and evidence handling

Raw endpoint evidence, diagnostic exports, personal identifiers, credentials, logs, and temporary files are excluded from version control. Published artifacts are reviewed to remove personal paths, hostnames, account identifiers, network values, hardware identifiers, secrets, and unreviewed event messages.

## Professional direction

I am building practical, explainable IT experience while completing the Google IT Support Certificate. My goal is not limited to one job title or industry: I am developing transferable foundations for technical support, NOC and networking, data center, systems administration, infrastructure/cloud, identity, and entry-level security opportunities.

— **Jaret Abad**
