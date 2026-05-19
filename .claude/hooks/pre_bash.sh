#!/usr/bin/env bash
# Pre-bash hook. Blocks dangerous patterns the settings.json deny list
# might miss due to expansion, and prompts on money-spending operations.
set -euo pipefail

CMD="${CLAUDE_TOOL_INPUT:-$(cat || true)}"

BLOCK_PATTERNS=(
  'rm[[:space:]]+-rf[[:space:]]+/'
  'rm[[:space:]]+-rf[[:space:]]+~'
  'rm[[:space:]]+-rf[[:space:]]+\$HOME'
  'git[[:space:]]+push.*--force'
  'git[[:space:]]+push.*[[:space:]]-f([[:space:]]|$)'
  'git[[:space:]]+reset[[:space:]]+--hard[[:space:]]+(origin/)?main'
  '>[[:space:]]*\.env'
  'curl[[:space:]]+[^|]*\|[[:space:]]*(ba)?sh'
)

for pat in "${BLOCK_PATTERNS[@]}"; do
  if echo "$CMD" | grep -Eq "$pat"; then
    echo "BLOCKED by pre_bash.sh: command matches dangerous pattern: $pat"
    echo "If this is genuinely needed, ask the user to run it manually."
    exit 2
  fi
done

MONEY_PATTERNS=(
  'kaggle[[:space:]]+kernels[[:space:]]+push'
  'kaggle[[:space:]]+kernels[[:space:]]+run'
  'modal[[:space:]]+deploy'
  'modal[[:space:]]+run'
)

for pat in "${MONEY_PATTERNS[@]}"; do
  if echo "$CMD" | grep -Eq "$pat"; then
    echo "NOTE: money-spending command detected ($pat). Confirm budget."
  fi
done

exit 0
