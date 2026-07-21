# Portfolio Redaction Checklist

Review every text file and screenshot manually before publishing.

## Remove or replace

- [ ] Real computer name / hostname
- [ ] Windows username or full user-profile path
- [ ] Local/private IP address
- [ ] Public IP address
- [ ] Default gateway address
- [ ] DNS server addresses
- [ ] MAC address / physical address
- [ ] Wi-Fi SSID or nearby network names
- [ ] Device serial number, service tag or product key
- [ ] Email address, phone number or physical address
- [ ] Tokens, passwords, API keys or credentials
- [ ] Event-log messages containing filenames, usernames or personal paths
- [ ] Browser tabs, notifications or background windows visible in screenshots

## Preserve useful evidence

- [ ] Test name and layer
- [ ] PASS / FAIL / ERROR / NOT RUN status
- [ ] General OS family and architecture
- [ ] Storage threshold conclusion without exact capacity or percentage
- [ ] Command names and reasoning
- [ ] Ticket chronology
- [ ] Resolution and validation
- [ ] Limitations and next steps

## Screenshot rule

Crop first, cover sensitive values with solid opaque rectangles, save a flattened copy, close and reopen it, and inspect at full size. Blurring alone may leave text recognizable.

## Final check

- [ ] A second review was performed on the sanitized copy, not on the private original.
- [ ] The public project does not contain the `PRIVATE_DO_NOT_UPLOAD` directory.
- [ ] The public narrative identifies the work as a home lab or simulated support environment.
