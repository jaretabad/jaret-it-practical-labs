# Lab 02 — Evidence Index

## Purpose
This index summarizes the sanitized evidence produced during the Network Troubleshooting Casebook. Raw command output containing endpoint or network identifiers is intentionally excluded from the public repository.

## Case 01 — Loss of Connectivity
- Active network adapter status: PASS.
- Valid non-APIPA IPv4 configuration: PASS.
- Default gateway configuration present: PASS.
- Default gateway ICMP reachability: PASS.
- Approved external IP reachability: PASS.
- Known-good DNS resolution: PASS.
- HTTPS TCP port 443 reachability: PASS.
- Controlled documentation-only destination: UNREACHABLE.
- Known-good HTTPS service after the controlled failure: PASS.
- Supported conclusion: destination-specific reachability failure rather than an endpoint-wide outage.

## Case 02 — DNS Resolution Failure
- IPv4 DNS configuration present: PASS.
- Interfaces with configured DNS servers: confirmed.
- Known-good A-record query: PASS.
- Controlled reserved name resolution: expected failure.
- Known-good DNS query after the controlled failure: PASS.
- Supported conclusion: name-specific resolution failure rather than general DNS unavailability.

## Case 03 — Application Port Reachability
- Known-good TCP port 443 before the controlled test: PASS.
- Controlled TCP port 81: UNREACHABLE within the defined timeout.
- Known-good TCP port 443 after the controlled failure: PASS.
- Supported conclusion: port-specific or service-specific reachability failure.
- Exact server-side cause: not established from client-side evidence.

## Supporting Evidence
- [Case 01 documentation](../cases/Case-01-Loss-of-Connectivity.md)
- [Case 02 documentation](../cases/Case-02-DNS-Resolution-Failure.md)
- [Case 03 documentation](../cases/Case-03-Application-Port-Reachability.md)
- [Windows Networking Command Reference](../docs/Windows-Networking-Command-Reference.md)
- [Layered Network Troubleshooting Method](../docs/Layered-Network-Troubleshooting-Method.md)
- [Layered Network Troubleshooting Flow](../diagrams/Layered-Network-Troubleshooting-Flow.md)

## Safety and Privacy
- No usernames, device names, adapter names, MAC addresses, SSIDs, public IP addresses, private network values, serial numbers, or account information are included.
- Results are represented as sanitized statuses and supported technical conclusions.
- No endpoint, DNS, firewall, service, router, or network configuration was changed during the controlled cases.

## Evidence Limitations
The evidence represents point-in-time client-side observations from a controlled home-lab. It does not establish production server configuration, firewall policy, service health, or an exact remote root cause without additional authorized evidence.

