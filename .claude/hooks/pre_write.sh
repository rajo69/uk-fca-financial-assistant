#!/usr/bin/env bash
# Pre-write hook. Blocks writes to sacred paths and screens for secrets.
set -euo pipefail

FILE_PATH="${CLAUDE_TOOL_FILE_PATH:-}"
FILE_CONTENT="${CLAUDE_TOOL_FILE_CONTENT:-}"

if [[ "$FILE_PATH" == *"data/eval/test_set.jsonl"* ]]; then
  if grep -q '\[x\] Phase 8' RESUMABILITY.md 2>/dev/null; then
    echo "BLOCKED: data/eval/test_set.jsonl is sacred after Phase 8."
    echo "If the user truly wants to modify it, they must do so manually."
    exit 2
  fi
fi

SECRET_PATTERNS=(
  'sk-[a-zA-Z0-9]{20,}'
  'sk-ant-[a-zA-Z0-9_-]{20,}'
  'hf_[a-zA-Z0-9]{20,}'
  'AKIA[0-9A-Z]{16}'
  'wandb_api_key[[:space:]]*=[[:space:]]*[a-f0-9]{32,}'
)

if [[ -n "$FILE_CONTENT" ]]; then
  for pat in "${SECRET_PATTERNS[@]}"; do
    if echo "$FILE_CONTENT" | grep -Eq "$pat"; then
      echo "BLOCKED: secret-like pattern detected in file content."
      echo "Use environment variables and .env (gitignored) instead."
      exit 2
    fi
  done
fi

exit 0
