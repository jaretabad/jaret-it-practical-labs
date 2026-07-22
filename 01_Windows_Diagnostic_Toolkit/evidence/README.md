# Lab 01 Evidence

Only reviewed and sanitized portfolio artifacts belong here. Raw evidence remains outside this public folder.

Reviewed public artifacts currently present:

- `HD-001-Endpoint-Baseline.md`
- `Lab-01-Case-Study.md`
- `Connectivity-Tests-Sanitized.csv`
- `Script-SHA256.txt`
- `Redaction-Checklist-Completed.md`

Together, this set provides the sanitized support record, case study, reproducible connectivity results, script-integrity hash and completed privacy review.

The final controlled execution recorded `PASS` for TCP/IP loopback, default-gateway reachability, DNS resolution and HTTPS port reachability. The intended public baseline sections were generated, storage remained above the defined free-space threshold and all three Windows Firewall profiles were enabled. Eleven automatic services were observed not running, but this was documented as an observation rather than proof of failure. The event-log review remained limited by both time and quantity.

Microsoft Defender reported `SxS Passive Mode`, while a separate visual check confirmed Bitdefender active. These artifacts represent a sanitized point-in-time baseline within the defined Lab 01 scope; they do not guarantee continued endpoint health, establish enterprise-policy compliance or assign a root cause to different results from earlier executions.

Never copy the `PRIVATE_DO_NOT_UPLOAD` directory into this folder.
