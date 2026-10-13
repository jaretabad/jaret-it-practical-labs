# Jaret IT Practical Labs — Current Project Status

Last updated: 2026-10-13

## Purpose and authority

This file is the **sole repository authority for detailed current operational state** across Jaret's IT, Cloud, Systems Administration, Identity, SaaS, Support Operations, and Cybersecurity learning portfolio.

Use the Source-of-Truth order defined in `docs/PROJECT-CONTINUITY-PROTOCOL.md`. Directly verifiable system state takes precedence when available. This file summarizes the current checkpoint after that verification.

Do **not** duplicate module-by-module current progress in `README.md` or `ROADMAP.md`. Those documents should reference this file instead.

## Canonical repository

- Repository: `jaretabad/jaret-it-practical-labs`
- Default branch: `main`
- Visibility: public
- `PROJECT-CONTEXT.md` may exist locally and is intentionally excluded from Git.
- Directly verified Git/system/platform state overrides this summary if they conflict.

## Professional direction

Primary journey:

**Jaret Cloud & Systems Administration Journey — Microsoft 365, Azure, Identity & SaaS**

Current progression remains:

IT Support foundations → Windows troubleshooting → Networking → Operating Systems → Enterprise Identity → Microsoft 365 / Entra ID → Endpoint Management → Azure → SaaS Administration → Security / Cybersecurity.

All portfolio work must remain clearly represented as hands-on learning, self-directed labs, or simulated enterprise work rather than production employment experience.

## Current learning checkpoint

### Completed

- Lab 01 — Windows Diagnostic Toolkit
- Lab 02 — Network Troubleshooting Casebook
- Google IT Support Professional Certificate — Course 1: Technical Support Fundamentals
- Google IT Support Professional Certificate — Course 2: The Bits and Bytes of Computer Networking
- Google IT Support Professional Certificate — Course 3: Operating Systems and You: Becoming a Power User
  - Module 1 — Basic Commands: **Completed**
  - Module 2 — Users and Permissions: **Completed**
  - Module 3 — Package and Software Management: **Completed**

### Active

- Google IT Support Professional Certificate
- Course 3 — Operating Systems and You: Becoming a Power User
  - Module 4 — **Ready to Start**
  - Start Module 4 in a new operational conversation as a continuation of the same course/project.
  - Confirm the exact Coursera Module 4 title from the course before recording it canonically.

### Queued / ready after current Coursera priority

- Module 01 — Enterprise Identity & Microsoft Cloud Foundations

### Planned / not started

- Lab 03 — Enterprise Identity Lifecycle & Access Control Simulation
- Mini-Module S1 — Microsoft Excel for IT Support Operations
- Lab S1 — Help Desk Ticket Lifecycle Simulation

## Course 3 checkpoint detail

### Module 1 — Basic Commands — Completed

Completion included:

- coursework / lesson study;
- graded review;
- Qwiklabs practical activities;
- glossary review; and
- final Module 1 study PDF, reviewed as a private study artifact.

Routine guided Qwiklabs were intentionally not promoted into standalone public portfolio projects.

### Module 2 — Users and Permissions — Completed

User-confirmed closeout includes:

- Windows users, administrators, groups, passwords, account lifecycle, and file permissions;
- Linux users, `root` / `sudo`, passwords, account lifecycle, file permissions, `chmod`, `chown`, and `chgrp`;
- SetUID, SetGID, and Sticky Bit;
- Mobile Users and Accounts;
- Windows ACL / DACL / SACL concepts;
- `ICACLS` practical work in Qwiklabs;
- Module 2 glossary review;
- module review / quiz work; and
- final Module 2 Study PDF created and reviewed as a private study artifact.

### Module 3 — Package and Software Management — Completed

Completion was recovered and reconciled after the final portion was accidentally finished in a separate ChatGPT conversation.

Verified study coverage includes:

- Windows software packages: EXE, MSI, APPX, Windows Installer, installer switches, Process Monitor / Sysinternals, Orca, Registry/files/process behavior, PowerShell PackageManagement, and archives/compression;
- Windows package dependencies: DLLs/shared libraries, DLL conflicts, private DLLs, .NET assemblies/GAC, manifests, side-by-side assemblies, and WinSxS concepts;
- Linux package management: `.deb`, `dpkg`, APT, repositories, dependency handling, install/remove/purge/query concepts, and Debian vs Red Hat package families;
- Linux archives: `tar`, `gzip`, `.tar`, `.tar.gz`, create/extract/list workflows, and core `tar` flag recognition;
- mobile software distribution: APK, AAB, IPA, app stores, sideloading, sandboxing, Apple/Android managed distribution, MDM/UEM, and mobile storage troubleshooting;
- Windows devices/drivers: Hardware IDs, Plug and Play, Device Manager, driver sources, update/rollback, and driver trust/signature concepts;
- Linux devices/drivers: `/dev`, character vs block devices, `udev`, `lspci`, `lsusb`, `lsscsi`, `lsmod`, `modprobe`, `dmesg`, CUPS, `lpadmin`, and PPD recognition;
- Windows operating-system updates: Windows Update Client service, update categories, security severity framing, automatic/manual updates, and cumulative updates;
- Linux operating-system updates: kernel responsibilities, Ubuntu Update Manager, `apt-get update` / `apt-get upgrade`, `apt update` / `apt upgrade`, kernel updates, and reboot/verification concepts;
- glossary review for Module 3 terminology; and
- final review / quiz concepts including APPX, `dpkg -i`, app stores, `Compress-Archive`, `Install-Package`, APT, Chocolatey source syntax, Hardware IDs, Windows device detection, Linux `/dev` character/block devices, security patches, the Linux kernel, cumulative updates, and `sudo apt update`.

Practical-reinforcement integrity:

- the APT / Suricata / tcpdump workflow is preserved only as a **course exemplar / optional practice reference**;
- it is **not** claimed as a personally executed hands-on or portfolio lab without separate execution evidence;
- no filler standalone portfolio project was created merely to satisfy a lab count.

Final Study PDF closeout:

- the initially generated Module 3 Study Guide was audited against the real completed Module 3 work;
- omissions and inconsistencies were corrected, including operating-system updates, Linux archives, package-dependency detail, Linux device/driver tooling, mobile storage, quiz anchors, glossary coverage, and the practical-lab labeling issue;
- the corrected PDF was rendered and visually QA-reviewed across all 17 pages;
- no clipped text, broken glyphs, overlap, or unresolved pagination defect remained in the final review;
- the corrected Module 3 Study Guide is a **private study artifact**, not public portfolio evidence.

Module 3 is therefore **Completed**.

## Instruction architecture checkpoint

The project uses a two-layer ChatGPT instruction model:

- **Local ChatGPT Project Instructions** — compact always-loaded bootstrap only;
- **`docs/CHATGPT-PROJECT-INSTRUCTIONS.md`** — extended version-controlled canonical ChatGPT operating policy.

The extended policy contains durable teaching, practical-reinforcement, troubleshooting, PDF, privacy, Git, device, career, and paid/cloud-resource rules so future improvements no longer need to consume the limited local Project Instruction space.

Progressive context loading is the default for meaningful ChatGPT work:

`Local bootstrap → verify current state → PROJECT-STATUS.md → extended ChatGPT policy → relevant canonical documents only`

## Current operating priority

The immediate learning priority remains the Google IT Support Professional Certificate through Course 3.

Strategic sequence:

`Course 3 active → Module 4 next → finish remaining Course 3 modules → Module 01 → Lab 03`

Complementary track:

`Mini-Module S1 → Lab S1`

The Support Operations Track may receive limited parallel study time, but it must not replace or delay the primary Course 3 / Module 01 / Lab 03 sequence unless the roadmap is intentionally changed.

## Cloud and paid-resource status

At this checkpoint:

- No Microsoft 365 tenant has been created for Module 01.
- No Azure subscription or paid Azure resource has been intentionally created for Module 01.
- No paid cloud licensing decision should be made without evaluating current price, recurring charges, practical learning value, portfolio value, safer alternatives, monitoring, and cleanup / deletion plan.

Update this section when the real account/resource state changes.

## Portfolio evidence standards

- Never publish passwords, tokens, API keys, tenant IDs, subscription IDs, personal identifiers, private network values, raw sensitive logs, or secrets.
- Keep private/raw evidence separate from reviewed public artifacts.
- Claim only skills and results that were actually performed, validated, documented, and can be explained.
- Do not present labs, Qwiklabs, simulations, or self-directed projects as production employment experience.
- Preserve completed labs and study artifacts; do not redo them unless a later task genuinely requires a targeted refresh or extension.

## Immediate next action

Start the official Course 3 Module 4 operational conversation.

**Next safe step:** confirm the exact Coursera title for Module 4, then continue from its first lesson without restarting Modules 1–3.

## Documentation update rule

Update this file when a material current-state change occurs, including:

- a course, module, lab, or meaningful study block starts or completes;
- the immediate next action changes;
- a roadmap priority materially changes;
- a paid/cloud resource is created, removed, or becomes financially relevant;
- a meaningful repository milestone is published;
- a new track is activated or retired; or
- a current safety/privacy constraint changes.

Do not update `README.md`, `ROADMAP.md`, or durable governance files merely to mirror routine current progress.
