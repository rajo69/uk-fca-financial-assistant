#!/usr/bin/env bash
# Runs once at session start. Prints orientation reminder.
set -euo pipefail

cat <<'EOF'
─────────────────────────────────────────────────────────────────
  uk-fca-financial-assistant — session start
─────────────────────────────────────────────────────────────────
  1. Read CLAUDE.md (if not already in context)
  2. Read RESUMABILITY.md to find current phase and next action
  3. Read lessons.md
  4. Read DECISION_LOG.md for any PENDING decisions
  5. Sketch a plan before executing (plan mode for 3+ steps)

  At end of session:
  - Commit changes with conventional commit messages
  - Update RESUMABILITY.md (date, what done, next action)
  - Update DECISION_LOG.md if decisions made
  - Update lessons.md if mistakes corrected
─────────────────────────────────────────────────────────────────
EOF
