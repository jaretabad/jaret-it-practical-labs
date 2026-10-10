# Repository agent instructions

This repository uses a Project Continuity System. A new conversation, device, or executor does not reset the project.

Before meaningful work:

1. Inspect directly verifiable current state first: Git/GitHub, repository files/history, platforms/accounts/resources when accessible, and relevant technical evidence.
2. Read `PROJECT-STATUS.md` for the detailed current operational checkpoint and immediate next action.
3. Read `docs/CHATGPT-PROJECT-INSTRUCTIONS.md` for the extended canonical ChatGPT operating policy when ChatGPT is coordinating or executing meaningful project work.
4. Load only the additional canonical documents relevant to the task:
   - `ROADMAP.md` for sequence, priorities, future direction, and planned labs/tracks;
   - `docs/PROJECT-CONTINUITY-PROTOCOL.md` for durable continuity, Source-of-Truth, closeout, safety, privacy, Git, cost, and documentation-drift rules;
   - `DECISIONS.md` for material decisions already made;
   - relevant course/module/lab documentation and evidence when applicable.
5. Use conversation history and memory only as supporting context when stronger verifiable sources exist.

## Instruction architecture

ChatGPT uses a two-layer instruction model:

- local ChatGPT Project Instructions — compact always-loaded bootstrap;
- `docs/CHATGPT-PROJECT-INSTRUCTIONS.md` — extended version-controlled policy.

New durable ChatGPT operating rules normally belong in the GitHub policy rather than expanding the local bootstrap. The local bootstrap changes only when a rule must be available before repository access or when the instruction/authority architecture itself changes.

Do not store transient current status in either instruction layer.

## Authority boundaries

- `PROJECT-STATUS.md` — sole repository authority for detailed current state.
- `ROADMAP.md` — future sequence and priorities; do not duplicate routine module progress here.
- `docs/PROJECT-CONTINUITY-PROTOCOL.md` — durable project continuity and working rules.
- `docs/CHATGPT-PROJECT-INSTRUCTIONS.md` — extended ChatGPT teaching/execution/career-support policy.
- `DECISIONS.md` — material decisions, not transient status.
- `README.md` — stable public portfolio orientation.
- `START-HERE.md` — human navigation map.
- `PROJECT-CONTEXT.md` — optional local/private context and must remain uncommitted.

## Execution standards

- Preserve completed labs, modules, and reviewed evidence unless a requested change intentionally extends them.
- Prefer one safe, verifiable step at a time when results determine the next action.
- Begin read-only for troubleshooting/configuration when practical.
- Explain purpose, privileges, expected result, verification, risk, and rollback for meaningful system changes.
- Use least privilege.
- Never publish raw private evidence, credentials, identifiers, secrets, tenant/subscription IDs, or sensitive logs.
- Do not present guided labs, simulations, or self-directed work as production employment experience.
- Evaluate current cost, recurring charges, learning value, alternatives, monitoring, and cleanup before activating paid/cloud resources.
- Do not force-push or rewrite shared history without a specific justified reason.

## Documentation updates

Update `PROJECT-STATUS.md` when the verified current project state materially changes.

Update `ROADMAP.md` only when sequence, priorities, planned tracks/labs, or long-term direction materially change.

Update `DECISIONS.md` only for material decisions worth preserving after current status changes.

Update `docs/PROJECT-CONTINUITY-PROTOCOL.md` only when the continuity/working method itself changes.

Update `docs/CHATGPT-PROJECT-INSTRUCTIONS.md` when the durable ChatGPT operating policy changes.

When documentation conflicts with stronger verified evidence, identify the stale source and reconcile it rather than silently propagating the contradiction.
