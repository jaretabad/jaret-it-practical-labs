# Case Study — Windows Endpoint Baseline

## Summary

A controlled validation was completed on a Windows 11 64-bit test endpoint using a read-only PowerShell toolkit with least privilege. TCP/IP loopback, default-gateway reachability, DNS resolution and HTTPS port reachability all recorded `PASS`. The public report generated the intended baseline sections, storage remained above the defined free-space threshold and all three Windows Firewall profiles were enabled. Eleven automatic services were observed not running, but this was documented as an inventory observation rather than proof of failure. The event-log review was intentionally limited by time and quantity. Microsoft Defender reported `SxS Passive Mode`, and a separate visual check confirmed Bitdefender active. No endpoint configuration was changed, private evidence was not opened and no cause was assigned to non-success results from earlier executions.

## Environment

- One Windows 11 64-bit test endpoint in a controlled home-lab exercise
- Windows PowerShell 5.1 or later
- Non-elevated execution using least privilege
- Read-only collection and validation
- Raw evidence separated from the sanitized portfolio draft
- Identifying and network values redacted

## Problem to solve

An employer needs a consistent endpoint baseline because an undocumented starting state makes later troubleshooting slower and less reliable. A baseline provides a known, time-specific snapshot that can help a technician distinguish an existing condition from a later change, confirm basic readiness and decide whether an observation should be resolved, monitored or escalated.

The task was to collect useful baseline evidence without changing the endpoint. The validated scope covered system and network summaries, layered connectivity, storage threshold status, automatic-service observations, a bounded event-log sample and basic security-control visibility. It was not a complete security, compliance, performance, update, application or enterprise-readiness assessment.

## Approach

1. **Verify the environment and script integrity.**  
   I confirmed the PowerShell requirement, reviewed the execution-policy context, inspected the script for read-only behavior and used a SHA-256 hash to identify the validated script revision.

2. **Collect a system and network baseline.**  
   The toolkit generated sanitized system and network summaries while omitting identifying endpoint and network values.

3. **Validate layered connectivity.**  
   TCP/IP loopback, default-gateway reachability, DNS resolution and HTTPS port reachability all recorded `PASS` in the latest controlled execution.

4. **Review storage.**  
   The public result preserved only the threshold-based conclusion that storage remained above the defined free-space threshold.

5. **Review automatic services.**  
   Eleven automatic services were observed not running. The report explicitly treated the count as an observation rather than evidence of failure, and no services were changed.

6. **Bound the event-log review.**  
   The report described a sample limited to the preceding 2 days and a maximum of 30 events. Raw event messages were omitted from public evidence.

7. **Review basic security-control visibility.**  
   All three Windows Firewall profiles were enabled. Microsoft Defender reported `SxS Passive Mode`, while a separate visual check confirmed Bitdefender active.

8. **Document and validate.**  
   I reviewed only sanitized public output, separated facts from limitations and confirmed that no endpoint configuration changes were made.

## Script troubleshooting performed

The troubleshooting focused on the diagnostic tool itself and did not treat an earlier tool result as proof of endpoint failure.

- An early execution path evaluated `OutputRoot` as empty. Validated executions used an explicit output destination; the implicit default behavior is not separately claimed as validated.
- The report writer initially rejected empty lines. Its parameter handling was updated to accept empty strings, after which report generation completed successfully.
- Under StrictMode, a DNS filter attempted to access a property that was not present on every returned object. Property-safe logic was tested with synthetic objects and retained in the corrected script. The latest controlled execution recorded DNS `PASS`.
- The default-gateway projection required the same property-safe approach. The latest controlled execution recorded gateway `PASS`. This later result does not establish the cause of an earlier `NOT RUN` result.
- A storage display template added a separator to a value that already contained one. The template was corrected, and the latest public report recorded only the sanitized threshold conclusion.
- One attempted validation was stopped by Execution Policy before the script began. In the controlled personal lab, the reviewed script was then run in a separate process with a temporary process-level bypass. No persistent execution policy or endpoint configuration was changed.

## Evidence

Only sanitized, reviewed evidence is represented below.

### Layered connectivity results

| Test | Layer | Final status | Evidence-supported meaning |
|---|---|---:|---|
| TCP/IP loopback | Local TCP/IP stack | `PASS` | The local TCP/IP loopback test responded during collection. |
| Default gateway reachability | Local network | `PASS` | The configured gateway responded to the test during collection. |
| DNS resolution | Name resolution | `PASS` | Hostname resolution succeeded during collection. |
| HTTPS port reachability | Application transport | `PASS` | TCP port 443 was reachable during collection. |

### Additional sanitized observations

| Area | Confirmed result |
|---|---|
| Collection mode | One controlled non-elevated run completed with no configuration changes |
| Report coverage | The intended system, network, connectivity, storage, services, event-log and security-control sections were generated |
| Storage | Storage remained above the defined free-space threshold |
| Services | Eleven automatic services were observed not running; this count was not treated as proof of failure and no services were changed |
| Windows Firewall | Domain, Private and Public profiles were enabled |
| Antivirus visibility | Microsoft Defender reported `SxS Passive Mode`; a separate visual check confirmed Bitdefender active |
| Event log | The public sample covered the preceding 2 days and was limited to a maximum of 30 events; raw messages were omitted |
| Privacy | Raw endpoint, account, network, hardware, contact and path identifiers were omitted from the portfolio evidence |

## Findings

### Confirmed observations

- The latest controlled script execution completed without Administrator access or endpoint configuration changes.
- Loopback, gateway, DNS and HTTPS port reachability recorded `PASS`.
- The intended public baseline sections were generated.
- Storage remained above the defined free-space threshold.
- Eleven automatic services were observed not running; no symptoms or supporting evidence established that this represented a failure.
- The event-log review was limited to 2 days and a maximum of 30 events.
- All three Windows Firewall profiles were enabled.
- Microsoft Defender reported `SxS Passive Mode`; a separate visual check confirmed Bitdefender active.
- No services, firewall rules, network settings, accounts, updates or security settings were changed.
- The sanitized public evidence excluded raw identifying values and event messages.

### Supported interpretations

- The four `PASS` results support those specific connectivity functions at collection time.
- Defender passive mode is consistent with another antivirus provider being active, and Bitdefender was separately confirmed active at that time.
- The automatic-service count is an observation that would require symptoms, dependency analysis and approved comparison criteria before it could support a fault diagnosis.
- Enabled Firewall profiles demonstrate their reported state at collection time, not the suitability of every rule or compliance with an enterprise standard.
- The latest successful execution supersedes the earlier results for the current baseline, but it does not prove why earlier executions produced different tool output.

### Limitations

- The results are a point-in-time baseline for one test endpoint and should not be generalized to an enterprise fleet.
- Connectivity `PASS` does not guarantee continuous network availability.
- The event-log review was intentionally limited by time and record count and was not a complete review of all Windows logs.
- Raw event messages were not opened for this case study, so no event-specific cause or impact was assessed.
- Bitdefender being active does not by itself establish signature currency, alert status, licensing or organizational compliance.
- Update compliance, enterprise-policy alignment, application health and performance were outside the validated scope.
- Validated executions used an explicit output destination, so this case study does not claim separate validation of the script’s implicit default output behavior.

## Conclusion

The final controlled run supports successful technical validation within the defined Lab 01 scope and confirms the toolkit’s privacy-conscious public output. All four layered connectivity tests passed, storage remained above the defined threshold, the expected baseline sections were generated and the visible Firewall profiles were enabled. Service and event data were reported with explicit limitations rather than overstated as failures or a complete audit.

Microsoft Defender operated in passive mode, and Bitdefender was confirmed active through a separate visual check. No endpoint configuration was changed, private evidence was not opened and no endpoint or network root cause was assigned to earlier tool results. This evidence establishes a reproducible point-in-time baseline, not a guarantee of continued endpoint health or enterprise compliance.

## Security and privacy decisions

I applied **least privilege**, meaning I used only the access required for read-only collection and did not run the lab as Administrator. I reviewed the script before execution and used SHA-256 hashing as an integrity control so that script changes could be identified during troubleshooting.

Raw collection data and the portfolio draft were kept separate. The public evidence excludes identifying endpoint, user, network, wireless, hardware, contact and personal-path values. Raw event messages and other private evidence were not embedded in or opened for this case study. The temporary execution-policy bypass applied only to a separate process in the controlled personal lab; it did not change persistent policy. In a managed business environment, organization policy would take precedence and a policy block would be documented and escalated instead of bypassed.

## What I would do next in a business environment

- Record the validated baseline in approved ticketing or project documentation without placing sensitive identifiers in a public artifact.
- Compare the endpoint with the organization’s approved build, network, update, firewall and antivirus policies.
- Use approved endpoint-management or security tools to verify patch compliance, signature currency and antivirus alerts rather than relying only on locally visible status.
- Confirm readiness with the endpoint owner or assigned user and document any reported symptoms.
- If a symptom exists, correlate it with service state and event timestamps through an authorized private review.
- Escalate any confirmed policy deviation, recurring connectivity failure, security alert or unsupported condition to the appropriate support, network, endpoint-management or security team.
- Obtain change authorization before modifying services, security controls, network settings, software or policy.
- Retain raw evidence under appropriate access controls and publish only artifacts that have passed privacy and redaction review.

## Skills demonstrated

- Windows PowerShell
- Endpoint baseline collection
- Layered network troubleshooting
- StrictMode-compatible script troubleshooting
- Time- and count-limited event-log sampling
- Basic security-control visibility
- Technical documentation
- Evidence validation and integrity checking
- Evidence handling, privacy and redaction
