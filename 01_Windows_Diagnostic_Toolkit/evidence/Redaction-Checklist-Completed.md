# Completed Portfolio Redaction Checklist

**Review date:** 2026-07-21  
**Scope:** Lab 01 public portfolio candidates and the sanitized public output used to document the final controlled validation.

## Remove or replace

- [x] Real computer name / hostname
- [x] Windows username or full user-profile path
- [x] Local or public IP address
- [x] Default gateway address
- [x] DNS server addresses
- [x] MAC address / physical address
- [x] Wi-Fi SSID or nearby network names
- [x] Device serial number, service tag or product key
- [x] Email address, phone number or physical address
- [x] Tokens, passwords, API keys or credentials
- [x] Event-log messages containing filenames, usernames or personal paths
- [x] Unnecessary exact endpoint capacity, memory, uptime or storage-percentage values
- [x] Unapproved personal names; the approved professional identity is `Jaret Abad`

## Preserve useful evidence

- [x] Connectivity test name and layer
- [x] `PASS`, `FAIL`, `ERROR` and `NOT RUN` status vocabulary
- [x] General endpoint description: `Windows 11 64-bit test endpoint`
- [x] Fixed public result messages without raw diagnostic values
- [x] Command names, reasoning and least-privilege boundary
- [x] Ticket chronology, validation steps and unresolved matters
- [x] Evidence-supported conclusions and limitations
- [x] Storage was represented only by the sanitized conclusion that it remained above the defined free-space threshold

## Screenshot review

- [x] No screenshots are included in this publication set; screenshot-specific cropping and flattening are not applicable.

## Automated hardening validation

- [x] Public connectivity `Details` uses fixed messages for `PASS`, `FAIL`, `ERROR` and `NOT RUN`.
- [x] Synthetic sensitive markers were absent from the public connectivity projection.
- [x] Full synthetic exception text remained in the source/private test object and was not copied to the public object.
- [x] The public storage projection exposes only `Test`, `Status` and `Details`; synthetic drive and capacity values were absent.
- [x] Event-log wording describes a time- and quantity-limited sample rather than a complete log review.
- [x] Microsoft Defender wording is limited to Defender-specific status; `SxS Passive Mode` came from a separate read-only query and Bitdefender activity was confirmed through a separate visual check.
- [x] The SHA-256 hash of the script used for the controlled execution is recorded in `Script-SHA256.txt`.
- [x] The controlled execution was non-administrator, ended with exit code 0 and reported no Windows configuration changes.
- [x] The connectivity evidence preserves the final result: four `PASS` statuses.
- [x] The intended public baseline sections were generated.
- [x] The 11 automatic services observed not running are presented as an observation, not proof of failure.
- [x] The event-log review is presented as a time- and quantity-limited sample, not a complete log audit.
- [x] Enabled Firewall profiles are presented as point-in-time states, not proof of enterprise-policy compliance.

## Final check

- [x] A second automated and manual review was performed on public candidates, not on private evidence.
- [x] `PRIVATE_DO_NOT_UPLOAD` content was not opened, copied or embedded in the public evidence.
- [x] The narrative identifies the work as a controlled home lab or simulated support scenario.
- [x] Facts, interpretations, hypotheses and pending work are separated.
- [x] Public artifact references match the files present in the evidence folder.

## Result

The publication set passed the privacy and redaction review. Technical validation was completed within the defined Lab 01 scope: all four connectivity tests passed and the intended baseline sections were generated. The evidence remains a point-in-time observation and does not claim continuous endpoint health, complete log review or enterprise-policy compliance.
