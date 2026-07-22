# Help Desk Ticket — Endpoint Baseline

## Ticket metadata

- **Ticket ID:** HD-001
- **Date opened:** Omitted from the sanitized public record
- **Date resolved:** 2026-07-21
- **Technician:** Jaret Abad
- **User/department:** New employee / General Operations — simulated scenario
- **Asset:** Windows 11 64-bit test endpoint — identifying details redacted
- **Category:** Endpoint / Baseline / Connectivity
- **Priority:** Low — a proactive review of one endpoint with no demonstrated active outage
- **Status:** Resolved — scoped validation completed with no endpoint configuration changes

## User-reported issue or service request

A Windows 11 64-bit test endpoint required controlled validation of a read-only diagnostic toolkit. The request was to determine whether the toolkit could generate a useful, sanitized baseline without changing endpoint configuration or exposing private values.

No active malfunction was reported in the sanitized evidence.

## Business impact

A trustworthy baseline gives support and infrastructure teams a point-in-time reference for later troubleshooting. Clear scope and limitations help prevent an observation from being treated as a failure, a security state from being overstated or a tool result from being reported as an endpoint root cause.

## Scope

- **Users/endpoints affected:** One simulated lab user and one Windows 11 64-bit test endpoint
- **First observed:** Not applicable; this was a proactive service request rather than a reported incident
- **Reproducible:** The latest controlled execution reproduced the intended public baseline within the tested scope
- **Known recent endpoint changes:** No endpoint configuration changes were documented; troubleshooting changes were limited to the diagnostic script before final validation
- **Authorization boundary:** Read-only collection using least privilege; no configuration or remediation changes authorized

## Initial hypothesis

**Hypothesis:** A controlled non-elevated run could generate sanitized public evidence, exercise the intended baseline sections and validate layered connectivity without changing the endpoint.

The latest execution supported this hypothesis within the defined lab scope. It does not establish long-term endpoint health, enterprise-policy compliance or the cause of any result from an earlier execution.

## Actions and evidence

| Order | Action or command family | Why | Relevant result |
|---:|---|---|---|
| 1 | Reviewed the PowerShell requirement, execution-policy context, script behavior and SHA-256 hash | Confirm compatibility, intended scope and evidence integrity before execution | The script required Windows PowerShell 5.1 or later and was designed to collect information without changing endpoint settings |
| 2 | Validated script syntax and executed the collection without Administrator access | Apply least privilege and avoid endpoint configuration changes | The controlled run completed successfully and reported that no configuration changes were made |
| 3 | Reviewed the sanitized public connectivity result | Validate each tested network layer without opening private evidence | TCP/IP loopback, default-gateway reachability, DNS resolution and HTTPS port reachability all recorded `PASS` |
| 4 | Reviewed public report coverage | Confirm that the intended baseline sections were generated | System, network, connectivity, storage, services, event-log and security-control sections were present |
| 5 | Reviewed storage and service observations | Record useful status without exposing unnecessary metrics or inferring failures | Storage remained above the defined free-space threshold; 11 automatic services were observed not running, which was documented as an observation rather than proof of failure |
| 6 | Reviewed event-log scope | Avoid representing a bounded sample as a complete log review | The public report described a sample limited to the preceding 2 days and a maximum of 30 events; raw messages were omitted |
| 7 | Reviewed security-control visibility | Distinguish tool output from a separate provider check | All three Windows Firewall profiles were enabled; Microsoft Defender reported `SxS Passive Mode`; a separate visual check confirmed Bitdefender active |
| 8 | Reviewed public redaction behavior | Confirm that the portfolio output remained sanitized | Identifying network and endpoint values and raw event messages were excluded from the public evidence |

## Findings

### Confirmed facts

- The latest controlled run executed without Administrator access and without changing endpoint configuration.
- The reviewed system was a Windows 11 64-bit test endpoint.
- TCP/IP loopback, default-gateway reachability, DNS resolution and HTTPS port reachability recorded `PASS`.
- The intended public system, network, connectivity, storage, services, event-log and security-control sections were generated.
- Storage remained above the defined free-space threshold.
- Eleven automatic services were observed not running; no service was changed and the count was not treated as proof of failure.
- The event-log review was limited to the preceding 2 days and a maximum of 30 events; raw messages were not published.
- Microsoft Defender reported `SxS Passive Mode`.
- A separate visual check confirmed that Bitdefender was active. The diagnostic script did not independently identify the active provider.
- Windows Firewall Domain, Private and Public profiles were enabled.
- The public evidence omitted identifying endpoint, account, network and path values.
- Earlier non-success connectivity states were retained only as troubleshooting history; no endpoint or network root cause was assigned to them.

### Supported interpretation

- The four connectivity results support successful operation of those specific tests at collection time.
- Defender operating in passive mode is consistent with another antivirus provider being active, and the separate visual check confirmed Bitdefender active at that time.
- The service count is an inventory observation and does not demonstrate an outage or misconfiguration without symptoms, dependency analysis and approved comparison criteria.
- Enabled Firewall profiles establish their reported state at collection time but do not prove that every rule meets organizational policy.

### Limitations and future review

- This is a point-in-time baseline for one test endpoint, not continuous monitoring or a guarantee of future availability.
- The event review was intentionally limited by both time and quantity; it was not a complete review of all Windows logs.
- Bitdefender being active does not by itself establish signature currency, alert status, licensing or organizational compliance.
- Update compliance, enterprise policy alignment, application health and performance were outside the validated scope.
- Any deeper investigation involving private evidence requires separate, specific authorization.

## Resolution or escalation

Scoped validation completed; no configuration changes were made.

The latest controlled execution generated the intended public baseline and recorded `PASS` for all four layered connectivity tests. Storage remained above the defined threshold, service status was documented without treating observations as failures, the event sample was bounded accurately and the visible security-control states were recorded. No escalation was required because no active incident or confirmed policy deviation was established.

## Validation

The resolved state was validated by:

1. Validating script syntax before execution.
2. Executing once without Administrator access and without changing Windows configuration.
3. Confirming `PASS` for loopback, default gateway, DNS resolution and HTTPS port reachability.
4. Confirming that the intended public report sections were generated.
5. Confirming that storage remained above the defined free-space threshold.
6. Treating the 11 automatic services observed not running as an observation, not a demonstrated fault.
7. Recording the event-log boundary as 2 days and a maximum of 30 events.
8. Confirming all three Windows Firewall profiles enabled, Defender in passive mode and Bitdefender active through a separate visual check.
9. Reviewing sanitized public output without opening private evidence.

The service request was satisfied as a scoped, point-in-time endpoint baseline and privacy-conscious documentation exercise.

## User communication

The controlled review completed without changing the computer’s configuration. All four connectivity tests passed, storage remained above the defined threshold and all Firewall profiles were enabled. Eleven automatic services were observed not running, but no evidence established that this represented a problem. Microsoft Defender was in passive mode, while a separate visual check confirmed Bitdefender active. The results are a point-in-time baseline rather than a guarantee of continued endpoint health.

## Internal notes / lessons learned

Earlier executions produced non-success connectivity states and incomplete public coverage. Those outputs were treated as tool results rather than proof of endpoint failure. Script property-safety, output formatting and public-message handling were reviewed and corrected during troubleshooting, and the latest controlled execution produced four connectivity `PASS` results and the intended baseline sections. The later successful result does not establish the cause of the earlier states, so no endpoint or network root cause was assigned.

In a managed business environment, further work would require approved policy baselines, authorized management tools and private evidence handling procedures. Any remediation would require its own change authorization.
