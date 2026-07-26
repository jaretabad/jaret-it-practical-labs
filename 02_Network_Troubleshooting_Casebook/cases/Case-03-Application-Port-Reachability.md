# Case 03 — Application-Port Reachability

## Status
Validated controlled case. A known-good TCP service and a port-specific reachability failure were tested and documented without changing firewall, service, or network configuration.

## User-Reported Issue
A user reports that a specific application or service cannot connect, although the hostname is reachable and other network services remain available.

## Business Impact
The user may be unable to use one required application or service. The available evidence does not support a complete server, DNS, Internet, or endpoint connectivity outage.

## Environment
- Windows endpoint in a controlled home-lab environment.
- Native Windows PowerShell and TCP connectivity tools.
- General network connectivity previously validated in Case 01.
- DNS resolution previously validated in Case 02.
- A known-good public HTTPS service was used as the reference TCP endpoint.
- Public documentation excludes IP addresses, adapter names, DNS server addresses, usernames, and device identifiers.

## Observed Facts
- The known-good hostname accepted a TCP connection on port 443.
- The same hostname did not complete a TCP connection on port 81 within the controlled three-second timeout.
- The known-good TCP port 443 remained reachable after the controlled port-81 failure.
- DNS resolution and general network connectivity had already been validated in the preceding cases.
- No firewall rule, listening service, DNS setting, network adapter, router, or port configuration was changed.
- The available client-side evidence did not reveal whether port 81 was closed, filtered, unsupported, or associated with an unavailable service.

## Initial Hypotheses
Before testing, the reported application-connectivity problem could have been caused by one or more of the following:
- The hostname could not be resolved through DNS.
- General network routing to the destination was unavailable.
- The application was configured to use the wrong hostname or TCP port.
- No service was listening on the required destination port.
- A client-side, network, or server-side firewall was blocking the port.
- The remote application service was stopped or unavailable.
- The failure was limited to one application port rather than the complete destination or network connection.

No hypothesis was treated as the root cause before comparing a known-good TCP port with the controlled port-specific failure.

## Diagnostic Plan
1. Reuse the validated network-connectivity and DNS results from Cases 01 and 02.
2. Test a known-good TCP service on the selected hostname to establish a working application-port baseline.
3. Record whether TCP port 443 accepts the connection.
4. Test the controlled comparison port on the same hostname with a limited timeout.
5. Record whether the controlled port accepts or completes the TCP connection.
6. Retest the known-good TCP service after the controlled failure.
7. Compare the results to determine whether the issue affects one port, the complete destination, or general endpoint connectivity.
8. Avoid changing firewall rules, restarting services, or resetting network equipment without evidence identifying the responsible control.
9. Document the supported conclusion, limitations, verification, and appropriate escalation path.

## Commands and Tools
- `Test-NetConnection -ComputerName example.com -Port 443 -InformationLevel Quiet` — established and later revalidated a known-good HTTPS TCP endpoint.
- `System.Net.Sockets.TcpClient` — attempted a controlled TCP connection to the comparison port with a three-second timeout.
- `BeginConnect()` — started the TCP connection attempt without allowing the terminal to wait indefinitely.
- `AsyncWaitHandle.WaitOne(3000)` — limited the connection attempt to approximately three seconds.
- `TcpClient.Close()` — closed the temporary client object after the test.

### Privacy and Safety Note
The public case records only the hostname used for the public reference service, sanitized reachability statuses, port numbers, and the controlled timeout. No local IP addresses, adapter names, routes, usernames, or device identifiers are published.

## Expected Results
- The known-good hostname should accept a TCP connection on port 443.
- The controlled comparison port should not complete a TCP connection within the defined timeout.
- TCP port 443 should remain reachable after the controlled port-specific failure.
- DNS resolution and general network connectivity should remain available.
- No firewall, service, port, DNS, adapter, or router configuration change should be required.

These results would support classifying the issue as port-specific or service-specific rather than a complete hostname, DNS, routing, or endpoint connectivity failure.

## Actual Results
- Known-good TCP port 443 reachability: PASS.
- Controlled TCP port 81 reachability: UNREACHABLE within the three-second timeout.
- Reference TCP port 443 after the controlled failure: PASS.
- General network connectivity previously validated: YES.
- DNS resolution previously validated: YES.
- Firewall, service, port, DNS, adapter, or router configuration changes performed: NONE.

All results represent point-in-time observations from the controlled lab session.

## Root Cause
A definitive server-side root cause was not established. The client-side test confirmed that the selected hostname accepted TCP connections on port 443 but did not complete a TCP connection on port 81 within the controlled timeout.

The supported diagnosis is a port-specific or service-specific reachability failure. The evidence did not determine whether port 81 was closed, filtered by a firewall, unsupported, or associated with a service that was not listening or unavailable.

Additional authorized server-side evidence, such as listening-port status, service health, and firewall logs, would be required to identify the exact root cause.

## Resolution
No endpoint, firewall, DNS, service, or network configuration change was required. The known-good TCP service on port 443 remained reachable, demonstrating that the hostname and general network path were available.

For a real incident, the appropriate next action would be to verify the application's configured destination port and confirm with the authorized service owner whether a server process should be listening on that port. The case should be escalated with the hostname, required protocol, port number, observation time, timeout behavior, and sanitized comparison results.

Broadly opening firewall ports, disabling security controls, restarting unrelated services, or resetting network equipment would not be justified without evidence identifying the responsible system or control.

## Verification
- Confirmed that the known-good TCP port 443 was reachable before the controlled test.
- Confirmed that TCP port 81 did not complete a connection within the defined three-second timeout.
- Confirmed that TCP port 443 remained reachable after the controlled port-specific failure.
- Confirmed that previously validated DNS resolution and general network connectivity remained available.
- Confirmed that no firewall, service, DNS, adapter, router, or port configuration was changed.

The verification supports the conclusion that the observed failure was limited to the controlled port or its associated service endpoint, rather than the complete hostname or endpoint network connection.

## Rollback
No rollback was required because the investigation did not modify firewall rules, services, DNS settings, network adapters, router configuration, or application ports.

If a future authorized remediation changes a firewall rule, service state, listening port, or application configuration, the original setting should be recorded before the change and restored if verification fails or creates unintended impact.

## Evidence
- Sanitized result showing that the known-good TCP port 443 was reachable.
- Sanitized result showing that the controlled TCP port 81 was unreachable within the three-second timeout.
- Sanitized result confirming that TCP port 443 remained reachable after the controlled failure.
- Documented comparison of two TCP ports on the same hostname.
- Documented diagnostic reasoning, supported conclusion, limitations, resolution, verification, and rollback status.

Raw command output containing local IP addresses, adapter details, routes, usernames, device names, or other endpoint identifiers was not included in the public repository.

## Ticket Closure Notes
The reported connectivity issue was isolated to a specific TCP port or its associated application service. The destination hostname resolved successfully, general connectivity remained available, and the known-good TCP port 443 was reachable before and after the controlled failure on port 81.

No endpoint remediation was performed because the evidence did not identify a local configuration fault. If access to the affected application port is required, the ticket should be escalated to the authorized application, server, or network owner to verify the expected listening service and applicable firewall or access-control rules.

Ticket disposition: endpoint connectivity validated; port-specific or service-specific investigation requires service-owner review.

## Lessons Learned
- A reachable hostname does not guarantee that every application service or TCP port is available.
- Testing a known-good port and the reported application port on the same hostname helps isolate the scope of the failure.
- A client-side timeout does not prove whether a port is closed, filtered, unsupported, or associated with a stopped service.
- General firewall changes should not be made without evidence identifying the affected control and required business service.
- Bounded timeouts prevent troubleshooting commands from waiting indefinitely.
- Server-side service status, listening-port information, and firewall logs may be required to establish the exact root cause.
- Sanitized documentation can preserve useful technical evidence without exposing endpoint identifiers or private network details.

### Interview Talking Point
I investigated a simulated application-connectivity issue by comparing two TCP ports on the same hostname. The known-good HTTPS port 443 was reachable before and after the test, while the controlled comparison port did not complete a connection within the defined timeout. This allowed me to isolate the issue as port-specific or service-specific, avoid unnecessary endpoint or firewall changes, and document the correct escalation path without claiming an unsupported server-side root cause.

## TCP Port Baseline and Controlled Failure Results
- Known-good TCP port 443 reachability: PASS.
- Controlled TCP port 81 reachability: UNREACHABLE.
- Reference TCP port 443 after the controlled failure: PASS.

### Observed Facts
The selected hostname accepted a TCP connection on port 443 before and after the controlled port-81 failure. The same hostname did not accept or complete a TCP connection on port 81 within the controlled timeout.

### Supported Conclusion
The evidence supports a port-specific or service-specific reachability failure rather than a hostname, DNS, routing, or endpoint-wide connectivity failure.

### Limitation
The failed TCP connection does not establish whether the port was closed, filtered, unsupported, or associated with an unavailable service. Server-side access or additional authorized evidence would be required to determine the exact cause.

### Troubleshooting Decision
Do not reset the network adapter, change DNS, restart the router, or broadly modify firewall rules when the hostname and known-good application port remain reachable. Verify the application-required port, server-side listening service, firewall path, and service ownership before remediation or escalation.

