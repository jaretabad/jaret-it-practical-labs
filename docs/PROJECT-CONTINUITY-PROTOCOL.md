# Project Continuity Protocol — Jaret IT Practical Labs

Last updated: 2026-10-03

## Purpose

This protocol defines the durable working method for the Jaret IT Support & Cybersecurity Career Lab so work can continue across conversations, devices, courses, labs, and future project stages without losing context, repeating completed work, or allowing documentation to drift unnecessarily.

It intentionally does **not** store detailed current module progress. Current state belongs in `PROJECT-STATUS.md`.

## 1. Source-of-Truth hierarchy

Before meaningful work, use these sources in order:

1. **Directly verifiable current state**
   - Git / GitHub state;
   - repository files and history;
   - course/platform state when accessible;
   - cloud/account/resource state;
   - technical evidence and validated lab results.
2. **`PROJECT-STATUS.md`** and, when available locally, **`PROJECT-CONTEXT.md`**
   - summarized current checkpoint;
   - active learning state;
   - immediate next work.
3. **`ROADMAP.md`**
   - sequence;
   - priorities;
   - future learning direction;
   - planned labs and tracks.
4. **This protocol**
   - durable working method, continuity, safety, privacy, Git, cost, and completion rules.
5. **`DECISIONS.md`**
   - material decisions already made and worth preserving.
6. **Relevant course, module, lab, or portfolio documentation**
   - topic-specific context and evidence.
7. **Conversation history and memory**
   - supporting context only when stronger verifiable sources exist.

When sources conflict, prefer the strongest and most current verifiable evidence. Do not silently overwrite conflicting documentation; identify which document is stale and reconcile the correct authority.

## 2. Documentation authority boundaries

Keep these concerns separate:

- `PROJECT-STATUS.md` — **sole repository authority for detailed current operational state**;
- `ROADMAP.md` — future sequence, priorities, learning phases, and planned work;
- `docs/PROJECT-CONTINUITY-PROTOCOL.md` — durable working rules;
- `DECISIONS.md` — material decisions already made;
- `README.md` — stable public portfolio orientation;
- `START-HERE.md` — human navigation and repository map;
- `AGENTS.md` — compact repository-agent entry instructions;
- lab/module documentation — scope, procedures, evidence, results, and lessons specific to that work;
- `PROJECT-CONTEXT.md` — optional local/private context intentionally excluded from Git.

Do not copy the same current-state detail into multiple documents merely for convenience.

### Documentation drift rule

Transient statements such as:

- "Module X is active";
- "the next lesson is Y";
- "this resource has not been created yet"; or
- "the immediate next action is Z"

belong in `PROJECT-STATUS.md`, not in durable or public orientation documents unless a brief generic reference is necessary.

Perform documentation reconciliation when:

- a material course/module/lab closes;
- a roadmap priority changes;
- a contradiction is detected;
- a new track is added or removed;
- a resource/cost state materially changes; or
- a repository milestone would otherwise leave documentation misleading.

Avoid elaborate documentation machinery whose maintenance cost exceeds the value it protects.

## 3. New-conversation continuity

A new conversation or device does not reset the project.

Before asking Jaret to repeat progress:

1. inspect the verifiable current state;
2. read `PROJECT-STATUS.md`;
3. reconcile with `ROADMAP.md`, this protocol, `DECISIONS.md`, and relevant module/lab documentation;
4. continue from the latest safe checkpoint.

Do not restart completed labs, modules, setup, or documentation unless a specific later task genuinely requires a targeted refresh or extension.

## 4. Course and module operating model

For structured courses such as the Google IT Support Professional Certificate, use **one operational conversation per course module by default** when the course has clear modules.

A new module conversation continues the same course and project.

Before beginning a module:

- preserve prior completed modules and unresolved weak areas;
- verify the current checkpoint;
- confirm the exact module title when available;
- wait for the lesson sequence provided by the course/user rather than pre-teaching future lessons without a reason.

### Lesson-title-driven study

The exact lesson title may be used as the sequencing source when it provides enough scope.

A transcript is optional unless needed to:

- verify exact wording;
- verify an instructor claim;
- resolve ambiguous scope;
- understand quiz-specific framing; or
- distinguish Coursera wording from outside technical knowledge.

Teaching should preserve important industry terms in English while explaining them clearly in Spanish.

When course material simplifies, uses older terminology, or differs from current practice, separate:

- **Course/Quiz Answer** — what the course expects;
- **Technical Clarification** — the more precise explanation; and
- **Production Reality** — how the concept is commonly handled in current environments.

Do not attribute external knowledge to the course unless it has been verified from course material.

### Module completion gate

Do not mark a module **Completed** merely because video lessons were viewed.

Verify the work that actually exists for that module, such as:

- coursework / lessons;
- graded review or quiz;
- Qwiklabs / practical work when applicable;
- glossary review;
- unresolved weak areas; and
- the established final Study PDF workflow when required for this course.

The final Study PDF should be generated, visually QA-reviewed, and approved before the module checkpoint is finalized when that is part of the established workflow.

## 5. Course-module closeout transaction

Use this closeout sequence for major course modules:

`Coursework → Quiz/graded review → Practical work when applicable → Glossary/weak-area review → Final Study PDF → Visual QA/review → Update PROJECT-STATUS → Verify repository state → Start next module in a new operational conversation`

Do not update `ROADMAP.md` for ordinary module progression unless sequence or strategy actually changed.

Do not update this protocol for routine progress.

## 6. Lab and troubleshooting execution model

For practical troubleshooting or configuration work, use:

`Diagnosis → Remediation → Verification`

When the result of one action determines the next, work one meaningful step at a time.

For important commands/configuration changes, explain as applicable:

- objective;
- what the command queries or modifies;
- why it is being used;
- privileges required;
- expected result;
- verification;
- risk;
- rollback / cleanup;
- sensitive data that may appear; and
- whether evidence is worth preserving.

Prefer read-only inspection first when practical.

Avoid destructive, expensive, privileged, or difficult-to-reverse actions without appropriate warning and verification.

## 7. Platform and tooling preferences

- Prefer Windows for hands-on labs when it is the appropriate environment.
- Prefer PowerShell / command line when they improve repeatability, visibility, learning, or interview value.
- Include GUI workflows when they are the realistic enterprise path or materially aid understanding.
- Chromebook/mobile may be used for study, planning, GitHub review, documentation, interviews, and tasks that do not require the local Windows environment.
- Do not assume browser access can control the local Windows machine.

## 8. Safety, privacy, and evidence

Before publishing or sharing evidence, sanitize:

- real usernames;
- computer/device names;
- email addresses;
- public/private IP addresses when identifying;
- gateway/DNS/network details when unnecessary;
- MAC addresses;
- serial numbers;
- tenant/subscription/account IDs;
- tokens, keys, credentials, secrets;
- private paths;
- sensitive logs; and
- customer/private data.

Keep raw/private evidence separate from public portfolio artifacts.

Never present simulations, Qwiklabs, home labs, or self-directed projects as production employment experience.

## 9. Cloud and paid-resource gate

Before creating or activating a tenant, subscription, paid license, sandbox, cloud resource, or consumption-based service, evaluate:

- current price;
- free/trial alternatives;
- recurring charges;
- overrun risk;
- practical learning value;
- portfolio evidence value;
- target-job relevance;
- readiness/prerequisites;
- monitoring method; and
- cleanup/deletion plan.

Do not reject a resource solely because it costs money, and do not activate it solely because it looks useful.

Material decisions in this area may also belong in `DECISIONS.md`.

## 10. Portfolio integrity

Public portfolio claims must remain strictly accurate.

Appropriate labels include:

- hands-on lab;
- self-directed project;
- simulated enterprise environment;
- support operations simulation;
- portfolio project.

Only claim results that were actually executed, validated, documented, and can be explained in an interview.

Routine guided labs should not automatically become portfolio projects. Promote them only when the work demonstrates meaningful technical skill, troubleshooting, design, analysis, automation, or documentation beyond simple guided execution.

## 11. Git workflow

Before repository changes:

1. inspect canonical `main` and relevant files;
2. verify the change is actually needed;
3. use a focused branch for multi-file or material reconciliation when practical;
4. avoid force push or history rewriting unless explicitly justified;
5. review changed files and diff;
6. check for sensitive data;
7. use clear commit/PR messaging;
8. verify the canonical remote state after integration; and
9. update `PROJECT-STATUS.md` only when the actual project state materially changed.

Do not commit private raw evidence or `PROJECT-CONTEXT.md`.

## 12. Material decisions

Record a new entry in `DECISIONS.md` when a future conversation would benefit from knowing a durable choice and its rationale.

Examples:

- changing the canonical repository or Source-of-Truth model;
- changing the primary career/learning direction;
- accepting/removing a complementary track;
- adopting a material paid platform strategy;
- changing portfolio integrity standards; or
- changing the module/lab operating model.

Do not create decision entries for ordinary lesson completion, quiz answers, temporary blockers, or routine housekeeping.

## 13. Improvement rule

When repeated friction appears — lost context, duplicated status, unnecessary manual work, contradictory documentation, unclear evidence, tool limitations, or avoidable cost — improve the system that creates the friction when a simple fix is justified.

Prefer improvements that:

- reduce repeated explanation;
- preserve user understanding and control;
- improve verification;
- lower cost or risk;
- make future conversations easier to resume; and
- keep portfolio evidence clean and professional.

Avoid overengineering. A process change should solve a real recurring problem before adding maintenance burden.
