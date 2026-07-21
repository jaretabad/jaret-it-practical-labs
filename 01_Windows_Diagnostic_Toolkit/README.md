# Lab 01 — Windows Endpoint Diagnostic Toolkit

## Overview

This project implements a read-only Windows endpoint assessment in Windows PowerShell 5.1. It collects structured diagnostic evidence, tests connectivity by layer, separates private evidence from sanitized public output, and documents the result as a support ticket and case study.

The toolkit does not change Windows, network, firewall, service, account, or security settings. It writes only its own evidence files under the project directory.

**Execution model:** least privilege; Administrator access is neither required nor recommended.
**Supported environment:** Windows PowerShell 5.1 or later on Windows 10/11.
**Operational risk:** low; the script performs local queries and its documented connectivity tests.

## Current validation status

Privacy hardening is validated, but the final technical baseline is only partial.

The final controlled, non-elevated run produced:

| Check | Public result |
|---|---|
| TCP/IP loopback | `ERROR` |
| Default gateway reachability | `NOT RUN` |
| DNS resolution | `PASS` |
| HTTPS port reachability | `PASS` |

Additional limits from that run:

- The public `Storage_Summary.csv` file was not generated.
- The public summary omitted the System baseline, Network baseline, Storage, Services, and Firewall sections.
- The event-log section described only a time- and count-limited sample: the previous two days, with a maximum of 30 records. It did not publish raw event messages.
- Microsoft Defender status was reported as unavailable. The script queries Defender-specific indicators and cannot, by itself, establish which antivirus provider Windows has registered.

The privacy controls behaved as designed: public `ERROR` and `NOT RUN` results contained fixed, sanitized descriptions rather than raw exception text. Complete exception details were restricted to `PRIVATE_DO_NOT_UPLOAD`.

No root cause has been established for the incomplete sections or the loopback and gateway results. The public evidence does not support assigning one. A later interactive validation is required to reproduce and investigate the pending checks safely.

## Public artifacts

- [Diagnostic collection script](scripts/Collect-ITDiagnostics.ps1)
- [Sanitized connectivity results](evidence/Connectivity-Tests-Sanitized.csv)
- [Endpoint baseline ticket](evidence/HD-001-Endpoint-Baseline.md)
- [Lab 01 case study](evidence/Lab-01-Case-Study.md)
- [Completed redaction checklist](evidence/Redaction-Checklist-Completed.md)
- [Script SHA-256 record](evidence/Script-SHA256.txt)
- [Evidence index](evidence/README.md)

## Business scenario

A Windows endpoint must be assessed before deployment. The technician needs to document system readiness, storage status, network configuration, layered connectivity, visible updates, services requiring review, recent system events, and available security controls without making unauthorized changes.

A reliable **baseline**—a documented reference state—reduces troubleshooting time, discourages assumptions, and creates evidence that can support resolution or escalation.

## Technical scope

| Component | Purpose |
|---|---|
| `Get-CimInstance` | Queries operating-system, hardware, storage, and service information |
| `Get-NetIPConfiguration` | Queries interface, IP, gateway, and DNS configuration for private evidence |
| `Get-NetAdapter` | Identifies adapter state and link speed |
| `Test-Connection` | Tests local TCP/IP loopback and default-gateway reachability |
| `Resolve-DnsName` | Tests name resolution |
| `Test-NetConnection` | Tests TCP reachability on HTTPS port 443 |
| `Get-HotFix` | Lists updates visible through that Windows interface; it does not replace Windows Update |
| `Get-WinEvent` | Samples recent errors and warnings within defined time and count limits |
| `Get-MpComputerStatus` | Queries Microsoft Defender-specific indicators |
| `Get-NetFirewallProfile` | Queries firewall-profile state |
| `Get-FileHash` | Creates integrity records for generated evidence |

## Key terms

| Term | Definition | Application in this lab |
|---|---|---|
| Endpoint | A user-facing device managed by IT | The Windows test system being assessed |
| Baseline | A known state used for later comparison | The documented state before any remediation |
| Cmdlet | A PowerShell command that normally follows verb-noun naming | For example, `Get-WinEvent` |
| Least privilege | Using only the access required for a task | Running the collection without Administrator access |
| Default gateway | The router used to reach other networks | The first network hop tested after local TCP/IP |
| DNS resolution | Converting a host name into an IP address | Resolving the designated public test host |
| Event log | Time-stamped records produced by Windows and applications | A limited source of evidence to correlate with reported symptoms |
| Finding | An observation that may require review | Evidence that does not automatically establish a fault |
| Validation | Evidence that a result is reproducible and correct | Repeating checks and comparing the resulting artifacts |

## Repository structure

```text
01_Windows_Diagnostic_Toolkit/
├── scripts/
│   └── Collect-ITDiagnostics.ps1
├── templates/
│   ├── CASE-STUDY-TEMPLATE.md
│   ├── REDACTION-CHECKLIST.md
│   └── TICKET-TEMPLATE.md
├── evidence/
│   ├── Connectivity-Tests-Sanitized.csv
│   ├── HD-001-Endpoint-Baseline.md
│   ├── Lab-01-Case-Study.md
│   ├── Redaction-Checklist-Completed.md
│   └── Script-SHA256.txt
└── README.md
```

Runtime output is written to `output`, which is excluded from version control. Each run separates:

- `PRIVATE_DO_NOT_UPLOAD`: raw diagnostic evidence and full exception details.
- `PORTFOLIO_DRAFT`: reduced output that still requires privacy review before publication.

## Safe execution workflow

### 1. Open a non-elevated PowerShell session

Open **Windows PowerShell** normally. Do not select **Run as administrator**. The title bar should not include `Administrator`.

Using a non-elevated session demonstrates **least privilege** and avoids granting permissions that a read-only assessment does not need.

### 2. Enter the lab directory

From the repository root:

```powershell
Set-Location .\01_Windows_Diagnostic_Toolkit
```

Confirm the working directory and expected files:

```powershell
Get-Location
```

```powershell
Get-ChildItem
```

The expected top-level lab folders are `scripts`, `templates`, and `evidence`.

### 3. Confirm the PowerShell version

```powershell
$PSVersionTable.PSVersion
```

The script declares Windows PowerShell 5.1 as its minimum version. Confirming prerequisites before execution prevents avoidable compatibility errors.

### 4. Review the current execution-policy scopes

```powershell
Get-ExecutionPolicy -List
```

**Execution Policy** defines conditions under which PowerShell loads configuration files and runs scripts. This workflow does not require a persistent policy change.

### 5. Inspect the script before execution

```powershell
notepad .\scripts\Collect-ITDiagnostics.ps1
```

The review should confirm:

1. `#requires -Version 5.1` declares the minimum version.
2. Collection cmdlets query endpoint state; `New-Item`, `Out-File`, and `Export-Csv` write only evidence artifacts.
3. `PRIVATE_DO_NOT_UPLOAD` receives raw evidence.
4. `PORTFOLIO_DRAFT` receives reduced output.
5. `try/catch` paths retain complete exception details privately and expose only fixed, sanitized public descriptions.

### 6. Calculate the pre-execution hash

```powershell
Get-FileHash .\scripts\Collect-ITDiagnostics.ps1 -Algorithm SHA256
```

A **SHA-256 hash** is a repeatable file fingerprint. A changed file produces a different value, supporting integrity checks and change tracking.

### 7. Remove the downloaded-file mark only if required

After inspecting the script:

```powershell
Unblock-File -Path .\scripts\Collect-ITDiagnostics.ps1
```

`Unblock-File` removes the downloaded-file mark from this reviewed file. It does not change the system-wide execution policy.

### 8. Run the toolkit

```powershell
& .\scripts\Collect-ITDiagnostics.ps1
```

The `&` character is PowerShell's **call operator**; it executes the specified script.

Expected completion indicator:

```text
Diagnostic collection completed.
```

The script then reports the local private-evidence and portfolio-draft directories for that run.

If a personal, unmanaged system reports an execution-policy error, the following command starts a separate process with a process-scoped policy:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".\scripts\Collect-ITDiagnostics.ps1"
```

`-NoProfile` prevents profile customizations from affecting the run. `-ExecutionPolicy Bypass` applies only to that new process and ends with it; it does not call `Set-ExecutionPolicy` or persistently change Windows. Do not attempt to bypass an organizational policy—record and escalate the restriction instead.

## Reviewing a run

### Identify the most recent run

```powershell
$LatestRun = Get-ChildItem .\output -Directory | Sort-Object LastWriteTime -Descending | Select-Object -First 1
$LatestRun.FullName
```

Each run has a timestamped directory. Selecting the newest one reduces the risk of reviewing stale evidence.

### Review private evidence locally

```powershell
notepad "$($LatestRun.FullName)\PRIVATE_DO_NOT_UPLOAD\Diagnostics_Report_PRIVATE.md"
```

Private evidence must remain local and must not be copied into issues, commits, screenshots, or portfolio documents. A warning, stopped automatic service, or event entry is only an observation; it does not prove a fault without symptom and timestamp correlation.

### Review structured public connectivity output

```powershell
Import-Csv "$($LatestRun.FullName)\PORTFOLIO_DRAFT\Connectivity_Tests.csv" | Format-Table -AutoSize
```

Interpret the checks in layers:

- A loopback `PASS` supports that the local TCP/IP stack responded during the test.
- A default-gateway `PASS` supports basic reachability to the first network hop during the test.
- A DNS `PASS` supports successful resolution of the designated test name.
- An HTTPS TCP 443 `PASS` supports reachability to that service port during the test.

A `FAIL`, `ERROR`, or `NOT RUN` result does not independently establish a root cause. Document the observed layer and continue with a separately authorized diagnostic step.

### Review the portfolio draft

```powershell
notepad "$($LatestRun.FullName)\PORTFOLIO_DRAFT\Portfolio_Summary_DRAFT.md"
```

The public draft is designed to omit hostnames, user names, personal paths, IP configuration, MAC addresses, SSIDs, serial numbers, and raw event messages. It must still pass the [redaction checklist](templates/REDACTION-CHECKLIST.md) before any material is moved into the public evidence directory.

## Documentation workflow

### Create the endpoint baseline ticket

```powershell
Copy-Item .\templates\TICKET-TEMPLATE.md .\evidence\HD-001-Endpoint-Baseline.md
notepad .\evidence\HD-001-Endpoint-Baseline.md
```

The ticket should document business impact, scope, actions, evidence-supported findings, resolution or escalation, and validation. A healthy result is valid professional work; no fault should be invented merely to make the scenario appear more complex.

### Create the case study

```powershell
Copy-Item .\templates\CASE-STUDY-TEMPLATE.md .\evidence\Lab-01-Case-Study.md
notepad .\evidence\Lab-01-Case-Study.md
```

The case study should explain the business problem, scope and limitations, diagnostic sequence, evidence, conclusion, privacy controls, and the next appropriate step in an enterprise environment.

## Privacy and evidence controls

Public evidence may include only reviewed, necessary technical conclusions. Do not publish:

- `PRIVATE_DO_NOT_UPLOAD` or any raw diagnostic export.
- Raw event messages or full exception text.
- Hostnames, user names, personal paths, IP addresses, gateways, DNS servers, MAC addresses, SSIDs, serial numbers, email addresses, credentials, tokens, or keys.
- Unreviewed screenshots.

The current public evidence set includes the validated script, sanitized connectivity table, baseline ticket, case study, completed redaction checklist, and script hash. `Portfolio_Summary_DRAFT.md` remains local runtime output and is not a public artifact.

## Validation criteria

The following items are supported by the repository evidence:

- [x] The toolkit was run without Administrator access.
- [x] Public connectivity output was reviewed and the partial result was documented.
- [x] The endpoint baseline ticket uses sanitized, evidence-supported statements.
- [x] The case study distinguishes observations, limitations, and unsupported causes.
- [x] The redaction checklist documents the privacy review.
- [x] Synthetic exception testing verified that raw sensitive text does not reach the public connectivity projection.
- [ ] A later interactive run reproduces the missing baseline sections safely.
- [ ] A later interactive run completes the loopback and default-gateway validation.

Lab 01 therefore demonstrates validated privacy hardening and a partial technical baseline—not a complete endpoint validation.

## Career relevance

The lab demonstrates transferable practices applicable to technical support, NOC and networking, data-center operations, systems administration, infrastructure and cloud operations, identity operations, and entry-level security:

- least-privilege execution;
- structured evidence collection;
- layered network troubleshooting;
- separation of private and public data;
- integrity verification;
- accurate documentation of uncertainty and escalation boundaries.

## Official references

- [Get-NetIPConfiguration](https://learn.microsoft.com/en-us/powershell/module/nettcpip/get-netipconfiguration?view=windowsserver2025-ps)
- [Test-NetConnection](https://learn.microsoft.com/en-us/powershell/module/nettcpip/test-netconnection)
- [Get-WinEvent](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.diagnostics/get-winevent)
- [Get-MpComputerStatus](https://learn.microsoft.com/en-us/powershell/module/defender/get-mpcomputerstatus)
- [Set-ExecutionPolicy and Process scope](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy)
