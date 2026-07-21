# Case Study — Windows Endpoint Baseline

## Summary

In 3–4 sentences, explain the business request, what you built, what you tested and the final result.

## Environment

- Windows endpoint in a controlled home-lab exercise
- Windows PowerShell 5.1+
- Read-only collection using least privilege
- Identifying values redacted

## Problem to solve

Why would an employer want a consistent endpoint baseline before deployment or deeper troubleshooting?

## Approach

Explain the order and why it mattered:

1. Verify environment and script integrity
2. Collect system/network baseline
3. Test local TCP/IP
4. Test default gateway
5. Test DNS resolution
6. Test application transport on TCP 443
7. Review storage, services, event logs and basic security controls
8. Document and validate

## Evidence

Include only sanitized tables or screenshots. Never embed the raw private report.

## Findings

### Confirmed observations

-

### Limitations

- A ping can fail when ICMP is blocked.
- A stopped automatic service is not automatically a broken service.
- Event logs require correlation with symptoms and time.
- `Get-HotFix` is not a complete compliance assessment.

## Conclusion

State what the evidence supports. Do not invent a root cause.

## Security and privacy decisions

Explain least privilege, script review, SHA-256 hashing, private/public evidence separation and redaction.

## What I would do next in a business environment

Mention asset-management records, approved remote tools, organization policy, user confirmation, ticket escalation and change authorization where relevant.

## Skills demonstrated

- Windows PowerShell
- Endpoint baseline collection
- Layered network troubleshooting
- Event-log review
- Basic security-control visibility
- Technical documentation
- Evidence handling and privacy

