# Layered Network Troubleshooting Method

## Status
Completed and applied across three controlled troubleshooting cases covering endpoint connectivity, DNS resolution, and TCP application-port reachability.


## Purpose
Use a consistent, evidence-based sequence to identify where network communication begins to fail.

## Applied Lab Cases
- **Case 01 — Loss of Connectivity:** validated the network adapter, IP configuration, default gateway, external IP reachability, DNS resolution, and HTTPS connectivity before isolating a destination-specific failure.
- **Case 02 — DNS Resolution Failure:** confirmed that DNS servers were configured, compared a known-good hostname with a controlled nonresolving name, and verified that general DNS service remained available.
- **Case 03 — Application Port Reachability:** compared a known-good TCP port with a controlled unavailable port on the same hostname and isolated the issue as port-specific or service-specific.

These cases demonstrate that troubleshooting should progress from broad endpoint and network validation toward the specific hostname, protocol, port, or application service affected.

## Troubleshooting Order

### 1. Physical and Link Layer
Confirm that the network adapter is present, enabled, connected, and reporting an operational status.

### 2. IP Configuration
Confirm that the device has a valid IP address, subnet configuration, default gateway, and DNS configuration.

### 3. Local TCP/IP Stack
Verify that the local TCP/IP implementation responds before testing external devices.

### 4. Default Gateway
Verify communication with the first routing device without assuming that Internet access is available.

### 5. DNS Resolution
Determine whether hostnames can be translated into IP addresses.

### 6. Routing and Path
Investigate whether traffic can reach the expected network path or where communication stops.

### 7. Transport and Port Reachability
Determine whether the required TCP or UDP service endpoint is reachable.

### 8. Application Layer
Verify the application or service only after the lower layers have been evaluated.

## Layer-to-Tool Mapping
| Troubleshooting Layer | Primary Check | Tools Used in This Lab | Supported Conclusion |
|---|---|---|---|
| Physical and Link | Confirm that an expected adapter is operational. | `Get-NetAdapter` | Determines whether an interface is present and reporting an Up status. |
| IP Configuration | Confirm usable addressing, gateway, and DNS configuration. | `Get-NetIPConfiguration` and `Get-DnsClientServerAddress` | Determines whether the endpoint has the basic configuration required for network communication. |
| Local TCP/IP Stack | Test communication with the local loopback interface. | `Test-Connection` with the loopback address | Confirms that the local TCP/IP implementation responds internally. |
| Default Gateway and External Reachability | Compare local gateway reachability with an approved external IP test. | `Test-Connection` | Helps distinguish a local-network problem from a destination-specific or higher-layer failure. |
| DNS Resolution | Compare a known-good hostname with a controlled nonresolving name. | `Resolve-DnsName` | Determines whether DNS is generally unavailable or whether the failure is limited to one name. |
| Routing and Path Scope | Compare results across the gateway, external destination, hostname, and service tests. | Layered comparison of validated results | Narrows the affected scope without claiming a complete hop-by-hop path analysis. |
| Transport and Port Reachability | Test the required TCP service port and compare it with a known-good port. | `Test-NetConnection` and `System.Net.Sockets.TcpClient` | Determines whether the failure is limited to a specific port or service endpoint. |
| Application Layer | Confirm the required hostname, protocol, and port, then identify the correct service owner. | Documented case evidence and escalation reasoning | Determines whether application, server, or network-owner investigation is required. |

### Interpretation Note
Each test supports a limited conclusion. For example, successful ICMP reachability does not prove that DNS or an application port works, and a TCP timeout does not reveal whether a port is closed, filtered, unsupported, or associated with a stopped service.

## Decision and Escalation Guide
- **No expected adapter is Up:** investigate the endpoint, physical connection, Wi-Fi state, adapter status, or authorized link-layer controls.
- **Adapter is Up but no usable IP configuration exists:** investigate DHCP, static addressing, adapter configuration, or the local network.
- **Loopback testing fails:** investigate the local TCP/IP implementation before testing external systems.
- **Loopback succeeds but the default gateway fails:** investigate the local connection, subnet configuration, gateway availability, or nearby network infrastructure.
- **External IP connectivity succeeds but known-good DNS resolution fails:** investigate DNS client configuration, DNS server reachability, or DNS service health.
- **Known-good DNS resolution succeeds but one hostname fails:** treat the incident as name-specific and review the requested hostname or its authoritative DNS records.
- **The hostname resolves and a known-good port succeeds, but the required application port fails:** validate the application's configured protocol and port, then escalate to the authorized application, server, or network owner.
- **Multiple destinations and known-good services fail:** investigate broader endpoint, gateway, routing, Internet, VPN, or network-service availability.

### Escalation Standard
Escalate with the reported symptom, business impact, affected hostname or approved destination, required protocol and port, observation time, commands used, sanitized results, supported conclusion, unresolved limitations, and any configuration changes performed. Do not claim a server-side root cause without authorized server, service, firewall, or log evidence.

## Evidence Standard
For every test, record the reported symptom, observed facts, hypothesis, command or tool used, expected result, actual result, supported conclusion, limitations, and next step.

## Safety
Begin with read-only tests. Do not disable adapters, modify DNS, change routes, alter firewall rules, or interrupt the shared Windows computer without documenting the expected impact and rollback method first.

## Privacy
Public evidence must not expose usernames, computer names, MAC addresses, SSIDs, public IP addresses, DNS suffixes, or complete private network values.

