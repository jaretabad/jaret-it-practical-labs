# Windows Networking Command Reference

## Status
Completed and verified. This reference documents only the networking commands and tools that were used during the three troubleshooting cases.

## Documentation Standard
For each command, record its purpose, data queried, system changes, risk, required privileges, expected result, verification method, privacy considerations, and useful evidence.

## Get-NetAdapter

### Purpose
Lists the network adapters detected by Windows and shows their operational state.

### Data Queried
- Adapter name and interface description.
- Operational status, such as Up or Disconnected.
- Link speed.
- Interface index and hardware address when the full output is displayed.

### System Changes
None. This is a read-only diagnostic command.

### Risk and Impact
Very low. The command does not enable, disable, restart, or reconfigure a network adapter.

### Required Privileges
Administrator privileges are not normally required to view adapter information.

### Expected Result
At least one active physical or virtual adapter should normally appear with a status of Up when the endpoint has an available network connection.

### Verification Method
Review the Status column and confirm that the adapter expected to provide connectivity appears as Up. Compare the result with Get-NetIPConfiguration before concluding that the adapter has valid IP configuration.

### Privacy Considerations
The output may reveal adapter names, hardware models, interface indexes, link speeds, and MAC addresses. Raw output should be sanitized before being added to a public repository.

### Useful Evidence
- Sanitized count of active adapters.
- Sanitized PASS or FAIL result confirming whether an adapter is Up.
- A written observation identifying whether the expected network interface is active without publishing its name or MAC address.

### Interview Definition
Get-NetAdapter is a PowerShell cmdlet used to view Windows network interfaces and their current operational status.

### IT Support Example
A technician can use Get-NetAdapter as an early troubleshooting step to determine whether Wi-Fi or Ethernet is disabled, disconnected, or operational before investigating IP addressing, DNS, or Internet access.

## Get-NetIPConfiguration

### Purpose
Displays the IP configuration associated with Windows network interfaces, including addressing, default gateway, and DNS information.

### Data Queried
- Network interface and connection profile information.
- IPv4 and IPv6 addresses.
- Default gateway.
- Configured DNS servers.
- Adapter operational details associated with the IP configuration.

### System Changes
None. This is a read-only diagnostic command.

### Risk and Impact
Very low. The command does not renew addresses, reset adapters, change DNS servers, or modify routing.

### Required Privileges
Administrator privileges are not normally required to view the configuration.

### Expected Result
An active interface should normally show a valid IP address and, when access beyond the local network is required, a default gateway. DNS server information should be present when hostname resolution is expected.

### Verification Method
Confirm that the active interface has a valid non-APIPA address, an appropriate default gateway, and DNS configuration. Compare these results with connectivity and DNS tests before identifying the source of a failure.

### Privacy Considerations
The output may reveal private IP addresses, gateway addresses, DNS server addresses, interface names, connection profiles, and other local network details. Raw output should not be published without sanitization.

### Useful Evidence
- Sanitized PASS or FAIL result for valid IP configuration.
- Sanitized confirmation that a default gateway is present.
- Sanitized count of interfaces with usable IPv4 configuration.
- Written confirmation that DNS configuration exists without publishing server addresses.

### Interview Definition
Get-NetIPConfiguration is a PowerShell cmdlet used to view an interface's IP address, default gateway, and DNS configuration.

### IT Support Example
A technician can use Get-NetIPConfiguration to determine whether an endpoint received a usable IP address, whether it has a route outside its local subnet, and whether DNS servers are configured before running connectivity tests.

## Test-Connection

### Purpose
Tests IP reachability by sending ICMP echo requests to a destination. It is the PowerShell equivalent of a basic ping test.

### Data Queried
- Whether the destination responds to ICMP echo requests.
- Response time when detailed output is requested.
- Success or failure of each request.
- Destination information associated with the test.

### System Changes
None. The command sends diagnostic network traffic but does not change IP, DNS, routing, firewall, or adapter configuration.

### Risk and Impact
Low. A small number of ICMP packets are sent to the selected destination. Repeated or excessive testing should be avoided on production systems.

### Required Privileges
Administrator privileges are not normally required.

### Syntax Used in This Lab
`Test-Connection -ComputerName <destination> -Count <number> -Quiet`

The `-ComputerName` parameter was used for compatibility with Windows PowerShell. The `-Quiet` parameter returned a Boolean result instead of detailed endpoint information.

### Expected Result
A result of True or a sanitized PASS indicates that the destination responded to the ICMP requests. False or FAIL indicates that no response was received during the test.

### Verification Method
Compare the result with other layers of testing. A successful response confirms ICMP reachability, but it does not prove that DNS, HTTPS, or a specific application port is working. A failed response also does not always prove that the destination is offline because ICMP may be blocked.

### Privacy Considerations
Detailed output may expose hostnames, destination addresses, source interface details, and response timing. Public evidence should use sanitized PASS or FAIL results when those details are unnecessary.

### Useful Evidence
- Sanitized loopback PASS or FAIL result.
- Sanitized default-gateway reachability status.
- Sanitized external-IP reachability status.
- Documentation explaining that ICMP failure alone is not definitive proof of an outage.

### Interview Definition
Test-Connection is a PowerShell cmdlet that sends ICMP echo requests to test IP reachability.

### IT Support Example
A technician can test the loopback address to validate the local TCP/IP stack, then test the default gateway to check local-network reachability, and finally compare the result with DNS and application-port tests to isolate the affected layer.

## Resolve-DnsName

### Purpose
Queries the Domain Name System to resolve a hostname or retrieve a specific type of DNS record.

### Data Queried
- DNS records associated with the requested name.
- Record types such as A, AAAA, CNAME, MX, or TXT.
- Resolved IP addresses when address records are requested.
- DNS response status and server-related details when detailed output is displayed.

### System Changes
None. The command performs a DNS query but does not change DNS servers, network settings, the local hosts file, or DNS records.

### Risk and Impact
Low. It generates a normal DNS lookup request. Excessive repeated queries should be avoided, especially against production DNS infrastructure.

### Required Privileges
Administrator privileges are not normally required.

### Syntax Used in This Lab
`Resolve-DnsName -Name example.com -Type A -DnsOnly -ErrorAction Stop`

The `-Type A` parameter requested IPv4 address records. The `-DnsOnly` parameter limited resolution to DNS instead of using other name-resolution mechanisms. The `-ErrorAction Stop` parameter allowed PowerShell to treat a failed query as a catchable error during the controlled test.

### Expected Result
A valid hostname should return one or more matching DNS records. A reserved or nonexistent test name should fail to resolve, while a repeated known-good lookup should continue to succeed if general DNS service remains available.

### Verification Method
First query a known-good hostname and confirm that the expected record type is returned. Then compare it with the reported or controlled failing name. Retest the known-good hostname afterward to determine whether the failure affects one name or DNS resolution generally.

### Privacy Considerations
The output may expose queried internal hostnames, resolved IP addresses, DNS server information, aliases, and internal domain structure. Public evidence should use approved public hostnames and sanitized PASS, FAIL, record-count, or name-specific results.

### Useful Evidence
- Sanitized confirmation that a known-good hostname resolved successfully.
- Sanitized count of returned address records.
- Controlled result showing that a reserved test name did not resolve.
- A successful known-good retest demonstrating that DNS remained functional after the name-specific failure.

### Interview Definition
Resolve-DnsName is a PowerShell cmdlet used to query DNS records and verify hostname resolution.

### IT Support Example
A technician can use Resolve-DnsName to determine whether an application failure is caused by general DNS unavailability or by a problem limited to one hostname. Comparing a failing name with a known-good lookup prevents unnecessary DNS resets or network changes.

## Test-NetConnection

### Purpose
Tests network connectivity to a destination and can verify whether a specific TCP port accepts a connection.

### Data Queried
- DNS resolution for the destination hostname.
- Destination IP address.
- TCP connection status for the requested port.
- Network route and interface information when detailed output is displayed.
- ICMP reachability when used without a port-specific test.

### System Changes
None. The command sends diagnostic traffic but does not open firewall ports, start services, change DNS, or modify network configuration.

### Risk and Impact
Low. It creates a normal diagnostic connection attempt to the selected destination and port. Testing should be limited to authorized systems and ports.

### Required Privileges
Administrator privileges are not normally required.

### Syntax Used in This Lab
`Test-NetConnection -ComputerName example.com -Port 443 -InformationLevel Quiet`

The `-ComputerName` parameter selected the destination. The `-Port` parameter specified the TCP service port. The `-InformationLevel Quiet` option returned a Boolean result instead of detailed endpoint and routing information.

### Expected Result
True or a sanitized PASS indicates that the TCP connection was completed successfully. False or FAIL indicates that the connection was not completed during the test.

### Verification Method
Test the required application port and compare it with a known-good port on the same hostname when possible. Retest the known-good port afterward to determine whether the problem is port-specific or affects the complete destination.

### Interpretation Limitation
A failed TCP connection does not by itself prove whether the port is closed, filtered by a firewall, unsupported, or associated with a stopped service. Server-side service status and firewall evidence may be required to establish the exact cause.

### Privacy Considerations
Detailed output may reveal destination IP addresses, source interfaces, local addresses, routes, and computer-specific network details. Public evidence should use approved hostnames and sanitized PASS or FAIL results when detailed output is unnecessary.

### Useful Evidence
- Sanitized PASS or FAIL result for a required TCP port.
- Comparison between a known-good port and the reported application port.
- Successful known-good retest after a controlled port failure.
- Written explanation of the limits of client-side port testing.

### Interview Definition
Test-NetConnection is a PowerShell cmdlet used to test network reachability and verify connectivity to a specific TCP port.

### IT Support Example
A technician can verify that a website responds on TCP port 443 while a separate application port fails. This helps isolate the incident to one service without assuming that DNS, Internet access, or the complete server is unavailable.

## Get-DnsClientServerAddress

### Purpose
Displays the DNS server addresses configured for Windows network interfaces.

### Data Queried
- Network interface index and alias.
- Address family, such as IPv4 or IPv6.
- DNS server addresses assigned to each interface.

### System Changes
None. This is a read-only diagnostic command and does not change the endpoint's DNS configuration.

### Risk and Impact
Very low. The command only reads existing DNS client settings.

### Required Privileges
Administrator privileges are not normally required to view DNS server configuration.

### Syntax Used in This Lab
`Get-DnsClientServerAddress -AddressFamily IPv4`

The `-AddressFamily IPv4` parameter limited the output to DNS servers configured for IPv4.

### Expected Result
Interfaces that use DNS should normally display one or more configured server addresses. An empty result may indicate missing DNS configuration, an inactive interface, or a configuration that must be investigated further.

### Verification Method
Confirm that the active network interface has DNS server information, then use Resolve-DnsName to verify that hostname resolution actually works. Having a configured DNS address does not by itself prove that the server is reachable or responding correctly.

### Privacy Considerations
The output may reveal interface aliases, interface indexes, private DNS server addresses, and internal network design. Public evidence should record only sanitized confirmation that DNS configuration is present unless the addresses are approved for publication.

### Useful Evidence
- Sanitized count of interfaces with configured DNS servers.
- PASS or FAIL confirmation that IPv4 DNS configuration is present.
- Comparison with a successful Resolve-DnsName test.

### Interview Definition
Get-DnsClientServerAddress is a PowerShell cmdlet used to view the DNS servers configured on Windows network interfaces.

### IT Support Example
A technician can use Get-DnsClientServerAddress to confirm that an endpoint has DNS servers assigned before testing whether a hostname resolves. This helps distinguish missing client configuration from a name-specific DNS failure.

## System.Net.Sockets.TcpClient

### Purpose
Creates a TCP client connection attempt with programmatic control over the destination port, timeout, and cleanup process.

### Tool Type
System.Net.Sockets.TcpClient is a .NET networking class rather than a native PowerShell cmdlet. PowerShell can create and control the object directly.

### Data Queried
- Whether a TCP connection can be completed to the selected hostname and port.
- Whether the connection completes within the defined timeout.
- Connection success, failure, or timeout status produced by the controlled script.

### System Changes
None. The temporary object sends a TCP connection request but does not open local firewall ports, change services, or modify network configuration.

### Risk and Impact
Low when used against authorized destinations. It generates a normal TCP connection attempt and should not be used for broad or repeated port scanning.

### Required Privileges
Administrator privileges are not normally required.

### Components Used in This Lab
- `New-Object System.Net.Sockets.TcpClient` created the temporary TCP client object.
- `BeginConnect()` started the connection attempt asynchronously.
- `AsyncWaitHandle.WaitOne(3000)` limited the wait to approximately three seconds.
- `EndConnect()` would complete processing after a successful connection.
- `Close()` released the temporary client object and network resources.

### Expected Result
A completed connection indicates that the selected TCP service accepted the request. A timeout or failed connection indicates that the service was not reachable during the controlled test.

### Verification Method
Compare the controlled-port result with a known-good TCP port on the same hostname. Retest the known-good port afterward to confirm that the failure remains limited to the selected port or service.

### Interpretation Limitation
A timeout does not identify whether the port is closed, filtered, unsupported, or associated with a service that is stopped. Authorized server-side evidence is required to determine the exact cause.

### Privacy Considerations
Scripts and raw errors may expose hostnames, IP addresses, exception details, or internal service information. Public evidence should use approved destinations and sanitized status messages.

### Useful Evidence
- Sanitized connection status for the selected port.
- Documented timeout value.
- Comparison with a known-good service on the same hostname.
- Confirmation that the TcpClient object was closed after testing.

### Interview Definition
TcpClient is a .NET class used to create and manage TCP network connections with application-controlled behavior such as timeouts.

### IT Support Example
A technician can use TcpClient when a standard connectivity command waits too long or does not provide the required timeout control. The result can help isolate an application-port failure while avoiding unnecessary firewall or endpoint changes.

## Additional Commands
Additional tools will be included only when required by a troubleshooting case.

## Safety and Privacy
Do not publish real usernames, device names, interface identifiers, MAC addresses, SSIDs, public IP addresses, DNS suffixes, or complete private network configurations.

