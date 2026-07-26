# Case 02 — DNS Resolution Failure

## Status
Validated controlled case. A healthy DNS baseline and a name-specific resolution failure were tested and documented without changing DNS or network configuration.

## User-Reported Issue
A user reports that a specific hostname cannot be resolved or accessed, while other known websites and network services remain available.

## Business Impact
The user may be unable to access one required website, server, or application by name. The available evidence does not support a complete DNS service or Internet outage.

## Environment
- Windows endpoint in a controlled home-lab environment.
- Native Windows PowerShell DNS and networking utilities.
- Active network connectivity previously validated in Case 01.
- IPv4 DNS server configuration detected on two interfaces.
- Public documentation excludes DNS server addresses, IP addresses, adapter names, DNS suffixes, usernames, and device identifiers.

## Observed Facts
- IPv4 DNS server configuration was present on two interfaces.
- The known hostname example.com resolved successfully during the healthy baseline.
- The baseline DNS query returned two IPv4 A records.
- The controlled hostname using the reserved .invalid domain did not resolve, as expected.
- The known hostname example.com resolved successfully again after the controlled failure.
- No DNS server, DNS cache, network adapter, firewall, or router configuration was changed.

## Initial Hypotheses
Before testing, the reported symptom could have been caused by one or more of the following:
- The hostname was misspelled or did not exist in DNS.
- The required DNS record type was missing or incorrect.
- The endpoint did not have DNS servers configured.
- The configured DNS server was unavailable or not responding.
- The problem affected only one hostname rather than all DNS queries.
- General network connectivity was unavailable, preventing access to DNS services.
- A stale or incorrect cached DNS response was influencing the result.

No hypothesis was treated as the root cause before comparing a known-good hostname with the controlled invalid hostname.

## Diagnostic Plan
1. Confirm that IPv4 DNS servers are configured on the Windows endpoint.
2. Query a known-good public hostname to establish a healthy DNS baseline.
3. Record whether valid IPv4 A records are returned.
4. Query a controlled hostname in the reserved .invalid domain.
5. Confirm that the controlled hostname fails to resolve as expected.
6. Query the known-good hostname again after the controlled failure.
7. Compare the successful and unsuccessful results to determine whether the problem affects one hostname or DNS generally.
8. Avoid changing DNS servers or clearing the DNS cache unless the evidence supports those actions.
9. Document the supported conclusion, limitations, verification, and escalation path.

## Commands and Tools
- `Get-DnsClientServerAddress -AddressFamily IPv4` — verified that IPv4 DNS servers were configured without displaying their addresses in public evidence.
- `Resolve-DnsName -Name example.com -Type A -DnsOnly` — established a healthy DNS baseline and confirmed that IPv4 A records were returned.
- `Resolve-DnsName -Name <controlled-invalid-hostname> -Type A -DnsOnly` — produced a controlled name-specific resolution failure using the reserved .invalid domain.
- A second `Resolve-DnsName` query for the known-good hostname verified that DNS resolution remained functional after the controlled failure.

### Privacy Note
The public case records only sanitized statuses and record counts. DNS server addresses, DNS suffixes, adapter names, IP addresses, usernames, and device identifiers are not published.

## Expected Results
- At least one Windows interface should have IPv4 DNS servers configured.
- The known-good hostname should resolve successfully through DNS.
- One or more IPv4 A records should be returned for the known-good hostname.
- The controlled hostname in the reserved .invalid domain should not resolve.
- The known-good hostname should continue to resolve after the controlled failure.
- No DNS or network configuration change should be required.

These results would support classifying the issue as a name-specific resolution failure rather than a general DNS outage.

## Actual Results
- IPv4 DNS configuration: PRESENT.
- Interfaces with configured IPv4 DNS servers: 2.
- Known-good DNS query baseline: PASS.
- IPv4 A records returned for the known-good hostname: 2.
- Controlled hostname in the reserved .invalid domain: EXPECTED NAME NOT RESOLVED.
- Known-good DNS query after the controlled failure: PASS.
- DNS or network configuration changes performed: NONE.

All results represent point-in-time observations from the controlled lab session.

## Root Cause
The controlled hostname did not resolve because it used the reserved .invalid top-level domain, which is intentionally designed not to produce a valid public DNS result.

The supported diagnosis is a name-specific resolution failure. The evidence did not support a general DNS client failure, unavailable DNS server, missing DNS configuration, or endpoint-wide connectivity outage because the known-good hostname resolved successfully before and after the controlled failure.

## Resolution
No DNS or endpoint configuration change was required. The known-good hostname resolved successfully before and after the controlled failure, confirming that DNS service remained functional.

For a real user-reported incident, the appropriate action would be to verify the hostname spelling, confirm that the domain and required DNS record exist, compare the result from another authorized client, and escalate to the DNS or application owner if the record is missing or incorrect.

Changing DNS servers, clearing the DNS cache, resetting the network adapter, or restarting network equipment would not be justified without additional evidence.

## Verification
- Confirmed that IPv4 DNS server configuration remained present.
- Confirmed that the known-good hostname resolved successfully during the baseline.
- Confirmed that the controlled hostname in the reserved .invalid domain did not resolve, as expected.
- Confirmed that the known-good hostname resolved successfully again after the controlled failure.
- Confirmed that no DNS server, DNS cache, adapter, firewall, or router configuration was changed.

The verification supports the conclusion that DNS resolution remained functional and that the observed failure was limited to the controlled hostname.

## Rollback
No rollback was required because the diagnostic process did not modify DNS server assignments, the DNS cache, network adapters, IP configuration, firewall rules, the router, or remote DNS records.

If a future DNS troubleshooting step requires a configuration change, the original settings, expected impact, verification method, and rollback procedure must be recorded before applying it.

## Evidence
- Sanitized IPv4 DNS configuration status recorded in this case file.
- Sanitized known-good DNS baseline results recorded in this case file.
- Controlled .invalid hostname failure and successful reference-hostname retest recorded in this case file.
- DNS troubleshooting sequence documented in `docs/Layered-Network-Troubleshooting-Method.md`.
- DNS commands and privacy considerations documented in `docs/Windows-Networking-Command-Reference.md`.
- Public evidence excludes DNS server addresses, DNS suffixes, adapter names, IP addresses, usernames, and device identifiers.

No raw DNS output or screenshot containing endpoint-identifying information is required to support the public conclusions in this controlled case.

## Ticket Closure Notes
The reported DNS issue was isolated to a specific hostname. Windows had IPv4 DNS servers configured, and the known-good hostname resolved successfully before and after the controlled failure.

No endpoint remediation was performed because the evidence did not support a general DNS client, DNS server, cache, network adapter, or Internet connectivity failure. In a real incident, the next action would be to verify the requested hostname and escalate to the DNS or application owner if the required record is missing or incorrect.

Ticket status: Resolved at the endpoint-support level and ready for DNS or application-owner escalation if the specific hostname remains required.

## Lessons Learned
- A failure to resolve one hostname does not prove that DNS is unavailable for the entire endpoint.
- A known-good hostname provides a useful comparison when determining whether a DNS problem is general or name-specific.
- DNS server configuration only proves that server addresses are assigned; it does not prove that queries will succeed.
- Successful resolution before and after a controlled failure helps isolate the problem to the requested hostname.
- Hostname spelling, domain existence, and required DNS record types should be checked before changing client DNS settings.
- Clearing the DNS cache or changing DNS servers should not be the first response when known names continue to resolve.
- Troubleshooting conclusions must distinguish DNS configuration, DNS service availability, DNS records, and general network connectivity.
- Sanitized status results can demonstrate DNS troubleshooting without publishing private DNS server addresses or network details.

### Interview Talking Point
I investigated a simulated DNS resolution issue by first confirming that Windows had DNS servers configured. I established a healthy baseline with a known-good hostname, reproduced a controlled name-specific failure using the reserved .invalid domain, and then verified that the known-good hostname still resolved. This allowed me to isolate the issue to the requested name and avoid unnecessary DNS or network configuration changes.

## DNS Baseline and Controlled Failure Results
- IPv4 DNS configuration: PRESENT.
- Interfaces with configured IPv4 DNS servers: 2.
- Reference DNS query baseline: PASS.
- DNS A records received during baseline: 2.
- Controlled invalid hostname: EXPECTED NAME NOT RESOLVED.
- Reference DNS query after controlled failure: PASS.

### Observed Facts
Windows had IPv4 DNS servers configured. A known public hostname resolved successfully before and after the controlled invalid hostname failed to resolve.

### Supported Conclusion
The available evidence supports a name-specific DNS resolution failure rather than a general DNS client, DNS server, or endpoint connectivity failure.

### Limitation
The controlled hostname used the reserved .invalid domain and was intentionally expected not to resolve. This test demonstrates diagnostic isolation but does not reproduce an unexpected production DNS outage.

### Troubleshooting Decision
Do not change DNS servers, flush the DNS cache, reset the network adapter, or restart network equipment when known hostnames continue to resolve. First verify the spelling, domain existence, required DNS record type, and whether the problem affects one name or all names.

