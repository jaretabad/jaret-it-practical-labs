# Lab 02 — Network Troubleshooting Casebook

## Status

Completed and verified. Three controlled Windows networking cases were investigated using layered, evidence-based troubleshooting without changing endpoint, firewall, DNS, service, router, or network configuration.

## Scenario

A Help Desk technician must investigate controlled Windows networking problems involving connectivity, DNS resolution, and application-port reachability.

## Objective

Use a layered troubleshooting method to separate link, IP addressing, default gateway, DNS, transport, and application symptoms.

## Completed Cases

1. [Case 01 — Loss of Connectivity](cases/Case-01-Loss-of-Connectivity.md) — validated the adapter, IP configuration, default gateway, external reachability, DNS resolution, and HTTPS connectivity before isolating a destination-specific failure.
2. [Case 02 — DNS Resolution Failure](cases/Case-02-DNS-Resolution-Failure.md) — compared a known-good DNS lookup with a controlled nonresolving name and confirmed that general DNS service remained available.
3. [Case 03 — Application Port Reachability](cases/Case-03-Application-Port-Reachability.md) — compared two TCP ports on the same hostname and isolated a port-specific or service-specific failure.

## Tools

- Windows PowerShell
- `Get-NetAdapter`
- `Get-NetIPConfiguration`
- `Get-DnsClientServerAddress`
- `Test-Connection`
- `Resolve-DnsName`
- `Test-NetConnection`
- `System.Net.Sockets.TcpClient`
- Markdown documentation
- Git and GitHub for version-controlled portfolio documentation

## Project Structure

`	ext
02_Network_Troubleshooting_Casebook/
|-- README.md
|-- cases/
|   |-- Case-01-Loss-of-Connectivity.md
|   |-- Case-02-DNS-Resolution-Failure.md
|   -- Case-03-Application-Port-Reachability.md
|-- docs/
|   |-- Windows-Networking-Command-Reference.md
|   -- Layered-Network-Troubleshooting-Method.md
|-- diagrams/
-- evidence/
` 

The `cases` directory contains the completed troubleshooting tickets. The `docs` directory contains reusable technical references. The `diagrams` and `evidence` directories are reserved for sanitized visual and supporting artifacts that are safe for public publication.

## Supporting Documentation

- [Windows Networking Command Reference](docs/Windows-Networking-Command-Reference.md) — explains the purpose, safety, privacy considerations, expected results, verification methods, and practical use of every networking tool exercised in this lab.
- [Layered Network Troubleshooting Method](docs/Layered-Network-Troubleshooting-Method.md) — connects each troubleshooting layer with the tests, supported conclusions, limitations, and escalation decisions demonstrated across the three cases.

## Skills Demonstrated

- Layered network troubleshooting and scope isolation.
- Windows network-adapter and IP-configuration assessment.
- Default-gateway, external-IP, DNS, HTTPS, and TCP-port reachability testing.
- Comparison of known-good and controlled failing results.
- Separation of observed facts, hypotheses, supported conclusions, and unverified causes.
- Safe use of read-only PowerShell and native Windows networking tools.
- Controlled TCP testing with a bounded timeout.
- Technical ticket documentation, verification, rollback planning, and escalation reasoning.
- Sanitization of endpoint and network information for a public GitHub portfolio.
- Honest documentation of laboratory limitations and production considerations.

## Production Considerations

- Confirm the affected user, device, application, business impact, and incident scope before testing.
- Use approved destinations and limit repeated network requests against production services.
- Obtain authorization before changing adapters, DNS settings, routes, firewall rules, services, VPN configuration, or network equipment.
- Record the original configuration, expected impact, validation method, and rollback procedure before applying a change.
- Coordinate with application, server, security, or network owners when client-side evidence cannot establish the exact cause.
- Preserve timestamps, ticket references, sanitized command results, and relevant logs according to organizational policy.
- Use packet capture, firewall logs, server logs, or service-status information only when authorized and necessary.
- Communicate user impact, temporary workarounds, escalation status, and final verification clearly.

## Interview Talking Points

### How I Approached the Lab
I used a layered troubleshooting method that began with adapter and IP configuration checks, then progressed through the local TCP/IP stack, default gateway, external connectivity, DNS resolution, and application-port reachability. I compared known-good results with controlled failures to isolate the affected scope before considering remediation.

### How I Avoided Unnecessary Changes
I began with read-only diagnostic tools and did not reset adapters, replace DNS settings, open firewall ports, restart services, or modify routing without evidence identifying the responsible component. Each case documented verification, rollback status, privacy considerations, and the appropriate escalation path.

### What the Lab Demonstrates
The project demonstrates practical Windows networking diagnostics, PowerShell usage, technical ticket documentation, evidence-based reasoning, privacy-conscious documentation, and the ability to distinguish endpoint-wide failures from destination-specific, hostname-specific, and port-specific problems.

### Honest Experience Statement
This was a controlled home-lab project rather than production employment experience. I personally executed the tests, interpreted the results, sanitized the evidence, and created the public documentation.

- [Layered Network Troubleshooting Flow](diagrams/Layered-Network-Troubleshooting-Flow.md) — provides a Mermaid decision flow for progressing from endpoint checks to application-service investigation.
- [Evidence Index](evidence/Evidence-Index.md) — summarizes the sanitized results and supported conclusions from all three troubleshooting cases.

## Safety and Privacy

- Use controlled and reversible tests.
- Do not publish usernames, device names, SSIDs, MAC addresses, public IP addresses, or raw network configuration.
- Separate observed facts, hypotheses, tests, and conclusions.
- Document any required configuration change and rollback method before applying it.

## Results and Limitations

### Results

- Completed three controlled networking troubleshooting cases.
- Validated adapter status, IP configuration, default-gateway reachability, external IP connectivity, DNS resolution, HTTPS connectivity, and TCP port reachability.
- Distinguished destination-specific, name-specific, and port-specific failures from broader endpoint or network outages.
- Documented expected results, actual results, supported conclusions, verification, rollback status, privacy controls, and escalation paths.
- Completed a Windows networking command reference and a layered troubleshooting methodology.
- Performed all tests without changing endpoint, DNS, firewall, service, router, or network configuration.

### Limitations

- The cases use controlled public test destinations rather than production corporate infrastructure.
- Client-side testing cannot establish an exact server-side cause without authorized service status, firewall logs, packet captures, or server configuration evidence.
- The laboratory does not claim administration of production networks, servers, firewalls, or enterprise applications.
- Results are point-in-time observations and may vary if external test services change.

