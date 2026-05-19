#!/usr/bin/env bash
# Post-edit hook. Runs ruff on edited Python files. Non-blocking.
set -euo pipefail

FILE_PATH="${CLAUDE_TOOL_FILE_PATH:-}"

if [[ "$FILE_PATH" == *.py ]]; then
  if command -v ruff >/dev/null 2>&1; then
    ruff check "$FILE_PATH" 2>&1 || true
    ruff format --check "$FILE_PATH" 2>&1 || true
  fi
fi

exit 0
