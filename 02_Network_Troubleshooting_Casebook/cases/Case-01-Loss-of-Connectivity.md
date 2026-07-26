# Case 01 — Loss of Connectivity

## Status
Validated controlled case. A healthy baseline and a destination-specific reachability failure were tested and documented without changing network configuration.

## User-Reported Issue
A user reports that a specific network destination cannot be reached while other network services may still be available.

## Business Impact
The user may be unable to access one required resource, but the available evidence does not support a complete endpoint or Internet outage.

## Environment
- Windows endpoint in a controlled home-lab environment.
- Native Windows PowerShell and networking utilities.
- Active network connection with a valid IPv4 configuration and default gateway.
- Public evidence intentionally excludes adapter names, IP addresses, MAC addresses, SSIDs, usernames, and device identifiers.

## Observed Facts
- Windows reported two network adapters in an operational UP state.
- One active configuration had a valid non-APIPA IPv4 address.
- One active configuration had a default gateway.
- The default gateway responded to an ICMP reachability test.
- An external public IP address responded to an ICMP reachability test.
- A public hostname resolved successfully through DNS.
- A public HTTPS service was reachable over TCP port 443.
- The controlled documentation-only destination did not respond to ICMP.
- The reference HTTPS service remained reachable after the controlled destination failed.

## Initial Hypotheses
Before testing, the reported symptom could have been caused by one or more of the following:
- The endpoint network adapter was disconnected or not operational.
- The endpoint did not have a valid IPv4 configuration.
- The default gateway was unavailable or unreachable.
- External network routing was unavailable.
- DNS resolution was failing.
- The required application port was unreachable.
- The problem was limited to the specific destination rather than the entire network connection.

No hypothesis was treated as the root cause before completing the layered diagnostic tests.

## Diagnostic Plan
1. Confirm that Windows detects at least one operational network adapter.
2. Verify that an active adapter has a valid non-APIPA IPv4 configuration.
3. Confirm that a default gateway is configured.
4. Test reachability to the default gateway.
5. Test external IP reachability without depending on DNS.
6. Test DNS resolution independently.
7. Test TCP reachability to a known HTTPS service on port 443.
8. Test the controlled destination expected to be unreachable.
9. Retest the reference HTTPS service to determine whether the failure is destination-specific or endpoint-wide.
10. Document only the conclusions supported by the observed evidence.

## Commands and Tools
- `Get-NetAdapter` — identified operational network adapters without changing their state.
- `Get-NetIPConfiguration` — reviewed active IPv4 and default-gateway configuration.
- `Test-Connection -ComputerName <default-gateway> -Count 1 -Quiet` — tested reachability to the first network hop.
- `Test-Connection -ComputerName <external-IP-test-target> -Count 1 -Quiet` — tested external reachability without depending on DNS.
- `Resolve-DnsName -Name example.com -Type A` — tested DNS name resolution.
- `Test-NetConnection -ComputerName example.com -Port 443 -InformationLevel Quiet` — tested TCP reachability to a public HTTPS service.
- `Test-Connection -ComputerName <controlled-documentation-address> -Count 1 -Quiet` — produced a controlled destination-specific failure.

### Compatibility Note
The installed Windows PowerShell version required the `-ComputerName` parameter for `Test-Connection`. The newer `-TargetName` parameter was not supported.

## Expected Results
- Windows should report at least one operational network adapter.
- At least one active adapter should have a valid non-APIPA IPv4 configuration.
- A default gateway should be present and reachable.
- An external IP test target should be reachable without using DNS.
- The selected public hostname should resolve successfully.
- The reference HTTPS service should be reachable over TCP port 443.
- The controlled documentation-only destination should be unreachable.
- The reference HTTPS service should remain reachable after the controlled failure.

These expected results would support classifying the problem as destination-specific rather than a complete endpoint network outage.

## Actual Results
- Operational network adapters detected: 2.
- Valid non-APIPA IPv4 configurations detected: 1.
- Default-gateway configurations detected: 1.
- Default gateway reachability: PASS.
- External IP reachability: PASS.
- DNS resolution: PASS.
- Reference HTTPS TCP port 443 reachability: PASS.
- Controlled destination reachability: UNREACHABLE.
- Reference HTTPS service after the controlled failure: PASS.

All results represent point-in-time observations from the controlled lab session.

## Root Cause
A definitive root cause was not established for the controlled destination because the test only proved that it did not respond to ICMP. The destination may have been unavailable, unrouted from the test environment, or configured not to respond to ICMP traffic.

The supported diagnosis is a destination-specific reachability failure. The evidence did not support an endpoint-wide network outage, DNS failure, invalid IP configuration, gateway failure, or HTTPS connectivity failure.

## Resolution
No endpoint configuration change was required. The adapter, IPv4 configuration, default gateway, DNS resolution, external reachability, and HTTPS service reachability were functioning during validation.

The appropriate support action is to avoid unnecessary resets or configuration changes and instead investigate or escalate the specific destination, required protocol, and remote service availability. If the destination belongs to another team or provider, provide the sanitized test results and the time of observation for further investigation.

## Verification
- Confirmed that Windows continued to report operational network adapters.
- Confirmed that a valid IPv4 configuration and default gateway remained present.
- Confirmed that the default gateway and an external IP remained reachable.
- Confirmed that DNS resolution remained functional.
- Confirmed that the reference HTTPS service remained reachable over TCP port 443 after the controlled destination failed.

The post-failure verification supported the conclusion that the endpoint retained normal network connectivity and that the observed failure was limited to the controlled destination.

## Rollback
No rollback was required because the diagnostic tests did not modify network adapters, IP configuration, DNS settings, routes, firewall rules, the router, or remote services.

If a future troubleshooting step requires a configuration change, the original value, expected impact, verification method, and rollback command must be documented before applying the change.

## Evidence
- Sanitized healthy-baseline results recorded in this case file.
- Sanitized controlled-failure results recorded in this case file.
- Layered troubleshooting sequence documented in `docs/Layered-Network-Troubleshooting-Method.md`.
- Commands and compatibility notes documented in `docs/Windows-Networking-Command-Reference.md`.
- Public evidence excludes real IP addresses, gateway values, adapter names, MAC addresses, SSIDs, usernames, and device identifiers.

No raw command output or screenshot containing endpoint-identifying information is required to support the public conclusions in this case.

## Ticket Closure Notes
The reported connectivity problem was isolated to a specific destination. The endpoint retained a valid IPv4 configuration, default-gateway connectivity, external IP reachability, DNS resolution, and TCP access to a reference HTTPS service.

No endpoint remediation was performed because the evidence did not support a local adapter, IP configuration, gateway, DNS, firewall, or general Internet failure. The appropriate next action is destination-specific investigation or escalation with the sanitized test results and observation time.

Ticket status: Resolved at the endpoint-support level and ready for escalation if access to the specific destination remains required.

## Lessons Learned
- A failed connection to one destination does not prove that the endpoint has lost all network connectivity.
- Layered troubleshooting helps isolate whether the issue involves the adapter, IP configuration, gateway, routing, DNS, transport port, or remote application.
- Known-good reference tests are useful for comparing a failing destination with services that remain operational.
- Troubleshooting conclusions must remain limited to what the evidence proves.
- A failed ICMP test does not confirm that a host is offline because ICMP may be blocked or unsupported.
- Avoid resetting adapters, changing DNS, modifying firewall rules, or restarting network equipment when the evidence does not support those actions.
- PowerShell command syntax can vary by version; the installed Windows PowerShell environment required `-ComputerName` instead of `-TargetName` for `Test-Connection`.
- Sanitized evidence can demonstrate technical reasoning without exposing private network information.

### Interview Talking Point
I used a layered troubleshooting process to investigate a reported connectivity failure. I verified the adapter, IPv4 configuration, default gateway, external reachability, DNS, and HTTPS port connectivity. I then reproduced a destination-specific failure and confirmed that normal network services remained available. Based on the evidence, I avoided unnecessary endpoint changes and documented the case for destination-specific escalation.

## Healthy Baseline Verification
- Network adapter status: UP.
- Active adapter count observed: 2.
- Valid IPv4 configuration detected: YES.
- Default gateway configuration detected: YES.
- Default gateway reachability: PASS.
- External IP reachability: PASS.
- DNS resolution: PASS.
- HTTPS TCP port 443 reachability: PASS.

### Supported Conclusion
At the time of testing, the endpoint had a functional local network configuration, could reach its default gateway and an external IP address, could resolve a public hostname, and could establish a TCP connection to a public HTTPS service.

### Limitation
This baseline represents a point-in-time observation and does not prove that connectivity will remain available. No failure has been simulated or diagnosed yet.

### Troubleshooting Note
The installed Windows PowerShell version required the Test-Connection parameter -ComputerName instead of -TargetName.

## Controlled Failure Results
- Controlled destination reachability: UNREACHABLE.
- Reference HTTPS service reachability: PASS.

### Observed Facts
The controlled destination did not respond to the ICMP test. A previously validated public HTTPS service remained reachable over TCP port 443.

### Supported Conclusion
The evidence supports a destination-specific reachability failure rather than a complete loss of endpoint network connectivity.

### Limitation
The failed ICMP test does not establish why the controlled destination did not respond. The destination may be unavailable, unrouted, or configured not to answer ICMP.

### Troubleshooting Decision
Do not reset the adapter, change DNS, restart the router, or modify the firewall when other validated network services remain reachable. Escalate or investigate the specific destination and required protocol instead.

