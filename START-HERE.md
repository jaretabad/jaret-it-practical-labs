# Jaret Abad - IT Infrastructure Practical Labs

This portfolio documents hands-on technical labs that turn formal IT training into reproducible, privacy-conscious work. It focuses on observing systems, testing hypotheses, documenting results, and communicating technical findings without exposing endpoint or network identifiers.

## Professional direction

The portfolio is designed to demonstrate transferable skills relevant to realistic entry-level opportunities across:

- IT support and technical support;
- NOC and network operations;
- data center operations;
- systems administration;
- infrastructure and cloud operations;
- identity and access management; and
- entry-level security.

Role fit should be evaluated against demonstrated capabilities, learning potential, mentorship, compensation, benefits, and long-term growth rather than a single job title.

## Portfolio navigation

- [Portfolio overview](README.md)
- [Project roadmap](ROADMAP.md)
- [Lab 01 guide](01_Windows_Diagnostic_Toolkit/README.md)
- [Lab 01 case study](01_Windows_Diagnostic_Toolkit/evidence/Lab-01-Case-Study.md)
- [Sanitized endpoint-baseline ticket](01_Windows_Diagnostic_Toolkit/evidence/HD-001-Endpoint-Baseline.md)
- [Sanitized connectivity results](01_Windows_Diagnostic_Toolkit/evidence/Connectivity-Tests-Sanitized.csv)
- [Completed redaction checklist](01_Windows_Diagnostic_Toolkit/evidence/Redaction-Checklist-Completed.md)
- [Script SHA-256 record](01_Windows_Diagnostic_Toolkit/evidence/Script-SHA256.txt)

## Current verified status

Lab 01 produced and executed a PowerShell diagnostic toolkit against a Windows 11 64-bit test endpoint without changing Windows configuration. Its privacy hardening was validated: public connectivity output uses fixed, sanitized messages, while complete exception details are restricted to private evidence.

The technical baseline remains partial:

- DNS resolution: `PASS`
- HTTPS connectivity: `PASS`
- Loopback test: `ERROR`
- Default gateway test: `NOT RUN`

No root cause has been confirmed for the loopback or gateway results. Lab 01 should therefore be presented as validated privacy hardening with a partial technical baseline, not as a fully successful endpoint or network baseline.

## What Lab 01 demonstrates

- PowerShell scripting for structured diagnostic collection.
- Layered connectivity testing and separation of observed facts from hypotheses.
- Threshold-based storage review without publishing unnecessary device metrics.
- A time- and count-limited sample of system events rather than a complete event-log review.
- A Microsoft Defender status query whose result does not, by itself, identify the registered antivirus provider.
- Separation of private evidence from sanitized, employer-facing documentation.
- Creation of a support ticket, case study, redaction record, public connectivity dataset, and reproducible script hash.

## How to review this portfolio

1. Begin with the [project roadmap](ROADMAP.md) for the broader progression.
2. Read the [Lab 01 guide](01_Windows_Diagnostic_Toolkit/README.md) for scope, safety, and reproduction instructions.
3. Review the [case study](01_Windows_Diagnostic_Toolkit/evidence/Lab-01-Case-Study.md) for the investigation narrative.
4. Compare the narrative with the sanitized ticket, connectivity dataset, completed redaction checklist, and script hash linked above.
5. Treat unresolved results as open technical questions unless later evidence establishes a cause.

## Publication standard

Public evidence should show the problem, observations, hypotheses, commands or methods, relevant results, conclusion, and next verification. It must not expose personal paths, account or device names, private IP addresses, gateway or DNS server values, MAC addresses, SSIDs, serial numbers, email addresses, credentials, tokens, private keys, or unreviewed log messages.

Private source evidence and personal study material are intentionally excluded from the employer-facing portfolio.
