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
