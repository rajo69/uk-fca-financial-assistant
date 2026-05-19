# Named Session Convention

Claude Code sessions are named per phase using the `-n` flag. Each phase gets
its own session ID; sessions resume cleanly via `claude --resume`.

## Naming pattern

`phase-{NN}-{short-slug}`

Examples:
- `claude -n phase-01-foundations`
- `claude -n phase-02-scaffolding`
- `claude -n phase-04-rubric`
- `claude -n phase-09-sft-training`

## Starting a session

```bash
# First time for a phase
claude -n phase-04-rubric

# Resuming an existing phase
claude --resume phase-04-rubric

# Listing sessions
claude --list
```

## When a session approaches context limit

1. Stop work at the next natural boundary (do not compact mid-task).
2. Update RESUMABILITY.md.
3. Run `/compact` to summarise.
4. Continue in same session.

If `/compact` doesn't free enough, end the session and start a fresh one with
the same name. The next session reads RESUMABILITY.md and resumes cleanly.

## Session hygiene

- One named session per phase.
- Do not mix phases in the same session.
- End-of-session checklist (see RESUMABILITY.md) runs before stopping.
