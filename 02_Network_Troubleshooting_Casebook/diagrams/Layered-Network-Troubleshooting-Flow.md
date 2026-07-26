# Layered Network Troubleshooting Flow

## Purpose
This diagram summarizes the evidence-based troubleshooting sequence applied across the three controlled cases in this lab.

```mermaid
flowchart TD
    A[User reports a network or application problem] --> B{Expected network adapter Up?}
    B -- No --> B1[Investigate endpoint, physical connection, Wi-Fi, or adapter state]
    B -- Yes --> C{Valid IP, gateway, and DNS configuration?}
    C -- No --> C1[Investigate DHCP, static configuration, or local network settings]
    C -- Yes --> D{Local TCP/IP loopback responds?}
    D -- No --> D1[Investigate the local TCP/IP implementation]
    D -- Yes --> E{Default gateway reachable?}
    E -- No --> E1[Investigate local subnet, link, gateway, or nearby infrastructure]
    E -- Yes --> F{Known-good external IP reachable?}
    F -- No --> F1[Investigate routing, Internet, VPN, or upstream availability]
    F -- Yes --> G{Known-good DNS lookup succeeds?}
    G -- No --> G1[Investigate DNS client configuration, server reachability, or DNS service]
    G -- Yes --> H{Requested hostname resolves?}
    H -- No --> H1[Classify as hostname-specific and review DNS records or spelling]
    H -- Yes --> I{Required TCP port reachable?}
    I -- No --> I1[Classify as port-specific or service-specific and escalate with evidence]
    I -- Yes --> J[Validate the application and its configuration]
```

## Interpretation
Each successful test validates only its own layer. ICMP success does not prove that DNS or an application port works, and a TCP timeout does not identify whether a port is closed, filtered, unsupported, or associated with an unavailable service.

## Safety and Privacy
The flow uses generic decisions and contains no endpoint names, usernames, IP addresses, MAC addresses, SSIDs, or private network details.

