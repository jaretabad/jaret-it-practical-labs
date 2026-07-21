# Case Study — Windows Endpoint Baseline

## Summary

A controlled final validation was performed on a Windows 11 64-bit test endpoint using a read-only PowerShell toolkit with least privilege. The run ended safely but produced partial public evidence: DNS resolution and HTTPS port reachability recorded `PASS`, TCP/IP loopback recorded `ERROR`, and default-gateway reachability recorded `NOT RUN`. The two non-success states used fixed sanitized public messages rather than raw exceptions, validating the script’s public-output hardening. The public report did not reproduce system, network, storage, services or firewall sections, and Defender status was unavailable with a generic warning. No endpoint configuration was changed, private evidence was not opened, and no root cause was assigned.

## Environment

- One Windows 11 64-bit test endpoint in a controlled home-lab exercise
- Windows PowerShell 5.1 or later
- Non-elevated execution using least privilege
- Read-only collection and validation
- Raw evidence separated from the sanitized portfolio draft
- Identifying and network values redacted

## Problem to solve

An employer needs a consistent endpoint baseline before deployment because an undocumented starting state makes later troubleshooting slower and less reliable. A baseline provides a known, time-specific snapshot that can help a technician distinguish an existing condition from a later change, confirm basic readiness, and decide whether an observation should be resolved, monitored or escalated.

The intended task was to collect useful baseline evidence without changing the endpoint. The final public output reproduced only partial connectivity results, the stated event-sampling boundary and a generic Defender-unavailable warning. It did not reproduce the other intended baseline sections and therefore did not constitute a complete endpoint, log, security, compliance, performance or application assessment.

## Approach

1. **Verify the environment and script integrity.**  
   I confirmed the PowerShell requirement, reviewed the execution-policy context, inspected the script for read-only behavior and used SHA-256 hashes to track script revisions.

2. **Attempt a system and network baseline.**  
   The toolkit was designed to gather structured information, but the final public report omitted the system, network, storage, services and firewall sections. Those areas were recorded as unverified rather than inferred.

3. **Test local TCP/IP.**  
   The loopback check recorded `ERROR`. Its public detail was a fixed sanitized message and did not expose the underlying exception.

4. **Test the default gateway.**  
   The gateway check recorded `NOT RUN`. Its public detail was fixed and sanitized, and no gateway value was exposed.

5. **Test DNS resolution.**  
   The DNS check recorded `PASS`, supporting successful resolution of the test name during that run.

6. **Test application transport on TCP 443.**  
   The HTTPS port-reachability check recorded `PASS`. This did not retroactively establish loopback or gateway status.

7. **Review the remaining public coverage.**  
   No public storage CSV was generated. The report omitted system, network, storage, services and firewall sections. Event-log output stated only a 2-day window and 30-record maximum, without a captured count or raw messages. Defender was unavailable with a generic public warning.

8. **Document and validate.**  
   I confirmed script syntax, executed one controlled non-elevated run, reviewed only sanitized public output and distinguished current facts from hypotheses and unresolved matters.

## Script troubleshooting performed

The troubleshooting focused on the diagnostic tool itself and did not treat its initial output as proof of endpoint failure.

- An early execution path evaluated `OutputRoot` as empty. Final validated executions used an explicit output destination; the implicit default behavior was not separately claimed as validated.
- The report writer initially rejected empty lines. Its parameter handling was updated to accept empty strings, after which report generation completed successfully.
- Under StrictMode, the DNS filter attempted to access a property that was not present on every returned object. A controlled reproduction with synthetic objects confirmed the behavior. The filter was changed to verify that the property existed before reading it, and the next execution recorded DNS as `PASS`.
- The default-gateway projection had the same class of StrictMode problem. Property-safe logic was tested in memory and retained in the corrected script. A prior repeat execution recorded `PASS`, but the final controlled run recorded `NOT RUN`; therefore current gateway behavior remains unresolved.
- A storage display template added a separator to a value that already contained one. The template correction remains in the reviewed script, but the final controlled run did not generate public storage output and therefore did not revalidate that presentation path.
- One attempted validation was stopped by Execution Policy before the script began. In the controlled personal lab, the reviewed script was then run in a separate process with a temporary process-level bypass. No persistent execution policy or endpoint configuration was changed.

## Evidence

Only sanitized, reviewed evidence is represented below.

### Layered connectivity results

| Test | Layer | Final status | Evidence-supported meaning |
|---|---|---:|---|
| TCP/IP loopback | Local TCP/IP stack | `ERROR` | The public result reports an error with a fixed sanitized detail; it does not reveal the cause. |
| Default gateway reachability | Local network | `NOT RUN` | The public result reports that the test did not run, using a fixed sanitized detail. |
| DNS resolution | Name resolution | `PASS` | Hostname resolution succeeded during collection. |
| HTTPS port reachability | Application transport | `PASS` | TCP port 443 was reachable during collection. |

### Additional sanitized observations

| Area | Confirmed result |
|---|---|
| Collection mode | One controlled non-elevated run ended safely with no configuration changes |
| Storage | No public storage CSV or storage section was generated; no storage conclusion is supported |
| System, network and services | Corresponding public sections were absent; no result is inferred |
| Windows Firewall | The public firewall section was absent; no firewall status is supported |
| Microsoft Defender | Status was unavailable and the public warning was generic; no boolean or provider conclusion is supported |
| Event log | Public output stated a 2-day window and 30-record maximum without a captured count or raw messages |
| Privacy | Raw endpoint, account, network, hardware, contact and path identifiers were omitted from the portfolio evidence |

## Findings

### Confirmed observations

- The final controlled script execution ended safely without Administrator access or configuration changes.
- Loopback recorded `ERROR`; gateway recorded `NOT RUN`; DNS and HTTPS port reachability recorded `PASS`.
- Fixed sanitized details were used for the two non-success connectivity states, so raw exception text did not enter the public result.
- The public report did not reproduce system, network, storage, services or firewall sections, and no public storage CSV was generated.
- Microsoft Defender status was unavailable with a generic public warning.
- No services, firewall rules, network settings, accounts, updates or security settings were changed.
- Syntax validation, script hashing and review of the sanitized public output identified the tested revision and its partial result.

### Supported interpretations and hypotheses

- DNS and HTTPS `PASS` support only those tested functions at that point in time.
- Loopback `ERROR` and gateway `NOT RUN` do not, by themselves, prove an endpoint or network fault.
- A restricted execution context is one possible explanation for the partial coverage, but the public evidence does not confirm it.
- No root cause was assigned because private evidence was not opened and the public evidence was insufficient.

### Pending matters and limitations

- Loopback and gateway checks rely on ICMP behavior; a failed ping could reflect filtering rather than loss of service.
- Gateway reachability was not tested successfully in the final controlled run.
- Event-log messages were intentionally not opened for this document, so no event-specific cause or impact was assessed.
- Storage, system, network-baseline, services, firewall and update conclusions are unavailable from the omitted public sections.
- Antivirus-provider identity and health require a separate approved, provider-aware check; Defender unavailable does not establish either state.
- Validated executions used an explicit output destination, so this case study does not claim separate validation of the script’s implicit default output behavior.
- Results apply to one endpoint in a controlled home lab and should not be generalized to an enterprise fleet.

## Conclusion

The final controlled run supports a successful privacy-hardening check and only a partial technical validation. DNS resolution and TCP 443 reachability passed. Loopback returned a sanitized `ERROR`, gateway remained `NOT RUN`, and the other baseline sections were not reproduced publicly.

The corrected script kept raw exception text out of public connectivity details, which is the hardening behavior this run validated. The run did not establish why loopback errored, why gateway did not run or why several public sections were absent. No endpoint configuration was changed, private evidence was not opened and no root cause was assigned.

## Security and privacy decisions

I applied **least privilege**, meaning I used only the access required for read-only collection and did not run the lab as Administrator. I reviewed the script before execution and used SHA-256 hashing as an integrity control so that script changes could be identified during troubleshooting.

Raw collection data and the portfolio draft were kept separate. The public evidence excludes identifying endpoint, user, network, wireless, hardware, contact and personal-path values. Raw event messages and other private evidence were not embedded in or opened for this case study. The temporary execution-policy bypass applied only to a separate process in the controlled personal lab; it did not change persistent policy. In a managed business environment, organization policy would take precedence and a policy block would be documented and escalated instead of bypassed.

## What I would do next in a business environment

- Record the partial validation in approved ticketing or project documentation without placing sensitive identifiers in a public artifact.
- Request explicit authorization for a future interactive Windows PowerShell validation before attempting to reproduce the missing sections.
- Compare the endpoint with the organization’s approved build, network, update, firewall and antivirus policies.
- Use approved endpoint-management or remote-support tools to verify patch compliance and antivirus health rather than relying only on locally visible status.
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
