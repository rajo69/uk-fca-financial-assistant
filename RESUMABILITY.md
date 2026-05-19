# Resumability — Where We Are

**Read this at the start of every Claude Code session. Update at the end.**

## Current phase

**Phase 1 — Workflow foundations & Claude Code best practices**

Status: in progress.

## Last session

- Date: [to be filled by first session]
- Session name: [e.g. `phase-01-foundations`]
- What was done: [bullets]
- What's pending: [bullets]
- Last-known-good git SHA: [SHA]

## Next action

Phase 1 file review by user. After user approves:
1. Move to Phase 2 (repo scaffolding & dependency management)
2. Start new named session: `claude -n phase-02-scaffolding`
3. Read this file again before doing anything

## Blockers

None yet.

## Open decisions awaiting user input

See DECISION_LOG.md for any entries with status PENDING.

Currently pending:
- (none — D1.1, D1.2, D1.3 already decided as part of plan negotiation)

## Phase tracker

- [x] Phase 0 — Master plan agreed (off-repo)
- [ ] Phase 1 — Workflow foundations  *(current)*
- [ ] Phase 2 — Repo scaffolding
- [ ] Phase 3 — Domain immersion (user-only reading)
- [ ] Phase 4 — Annotation rubric & data schema
- [ ] Phase 5 — Data ingestion (RAG sources)
- [ ] Phase 6 — SFT seed examples (user-heavy)
- [ ] Phase 7 — Synthetic expansion & review tooling
- [ ] Phase 8 — Eval test set (user-heavy)
- [ ] Phase 9 — SFT training pipeline
- [ ] Phase 10 — Eval harness & LLM-as-judge
- [ ] Phase 11 — DPO pipeline
- [ ] Phase 12 — RAG layer
- [ ] Phase 13 — Serving, deployment, README

## End-of-session checklist (Claude Code must run before stopping)

1. [ ] All staged changes committed with conventional commit messages
2. [ ] DECISION_LOG.md updated if any decisions were made
3. [ ] lessons.md updated if any mistakes were made and corrected
4. [ ] This file (RESUMABILITY.md) updated:
       - Date
       - What was done
       - Next action
       - Blockers
       - Pending decisions
5. [ ] git push (if on a feature branch or with user approval if main)
6. [ ] Print a 3-line session summary to the user
