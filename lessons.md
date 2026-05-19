# Lessons

When Claude Code makes a mistake during the project and the user corrects it,
add a one-line rule below. CLAUDE.md imports this file by reference.

Format: `- YYYY-MM-DD: rule that prevents the mistake from recurring.`

Keep entries short. If a lesson is complex, write a longer note and link from
here.

## Rules

<!-- Append new lessons below this line. Newest at bottom. -->

- 2026-05-19: On Windows hosts, set up .gitattributes before committing any
  shell scripts — core.autocrlf will rewrite working-tree copies to CRLF and
  break bash hooks at next checkout.
- 2026-05-19: `--dangerously-skip-permissions` is acceptable for well-bounded
  mechanical phases (scaffolding, fixed file creation). Never for phases
  that spend money, modify trained models, or touch sacred files. Diff
  review post-phase is non-negotiable when permissions are skipped.
- 2026-05-19: When a directory is gitignored (`checkpoints/`, `data/raw/`)
  but a `.gitkeep` marker must still be tracked, use the
  `dir/*` + `!dir/.gitkeep` pattern. The simple negation `!dir/.gitkeep`
  alone does NOT work because git never descends into an ignored directory.
