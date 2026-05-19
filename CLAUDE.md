# UK FCA Financial Information Assistant — Project Brief

This file is loaded into context at the start of every Claude Code session in
this repo. Read it. Then read RESUMABILITY.md to find where we are in the
project.

## What this project is

A fine-tuned open-weight LLM that answers UK retail financial questions
(pensions, ISAs, mortgages, credit, insurance) while correctly navigating the
FCA advice/guidance boundary as expanded by the Targeted Support regime (in
effect from 6 April 2026). The deliverable is a portfolio project demonstrating
production-grade AI engineering for UK financial services roles.

This is NOT an FCA-authorised service. It is a research project demonstrating
engagement with the regulatory framework. Every artefact says so.

## Tech stack

- Python 3.11, managed with `uv`
- Base model: Qwen3-8B (Apache 2.0) — confirmed at Phase 9 against current
  Unsloth notebook support
- Training: Unsloth + TRL (SFTTrainer, DPOTrainer) with QLoRA, on Kaggle P100
- Experiment tracking: Weights & Biases
- Eval: custom harness in `src/ukfca/eval/`, LLM-as-judge via Claude API
- RAG: bge-small-en-v1.5 embeddings, Qdrant local, cross-encoder reranker
- Serving: FastAPI + vLLM, deployed to Modal
- Observability: Langfuse
- CI: GitHub Actions

## Project shape

13 phases across 4 stages. Phased and gated — each phase has a hard checkpoint
at the end. See `docs/IMPLEMENTATION_PLAN.md` for the full plan. See
`RESUMABILITY.md` for current phase and next action.

## Workflow rules

1. **Read RESUMABILITY.md at the start of every session.** It tells you where
   we are. Do not infer from chat history.
2. **Update RESUMABILITY.md at the end of every session.** Even if just to say
   "no progress this session, blocked on X". The next session depends on it.
3. **Decision points pause work.** When you reach a D-number decision point
   (e.g. D4.1), write the proposed decision into DECISION_LOG.md with status
   "PENDING — awaiting user input", then stop and ask the user. Do not proceed.
4. **Commit frequently.** Conventional Commits format: `feat:`, `fix:`,
   `docs:`, `chore:`, `test:`, `refactor:`. One logical change per commit.
5. **Never push to main without tests green.** Hooks enforce this. If a hook
   blocks you, stop and ask.
6. **`data/eval/test_set.jsonl` is sacred** once Phase 8 is complete. Never
   train on it. Never modify it casually. Hooks block writes after Phase 8.
7. **Free-running inside a phase, hard gate between phases.** Inside a phase,
   work to the phase plan in IMPLEMENTATION_PLAN.md without asking permission
   for every step. At the phase boundary, stop, update docs, ask for review.
8. **Plan mode for any task with 3+ steps.** Sketch the plan, then execute.
9. **`/compact` at phase boundaries, not mid-phase.** Mid-phase compaction
   risks losing reasoning thread.

## Code style

- Type hints on all public functions
- Pydantic models for every data shape that crosses a module boundary
- `ruff` formatted, `ruff` linted, `mypy --strict` clean
- Tests in `tests/unit/` and `tests/integration/`, run via `make test`
- No notebooks in the import path. Notebooks live in `notebooks/` for
  exploration only.
- Configs in YAML under `configs/`, loaded via Pydantic models, never
  hardcoded in scripts.
- Scripts in `scripts/` are thin CLI wrappers. All logic lives in `src/ukfca/`.

## What this project ISN'T

- Not legal advice
- Not financial advice
- Not FCA-authorised
- Not for production use
- Not a wrapper on a closed API — the fine-tune must be on open weights

## Important: the lessons file

`lessons.md` is the self-improvement log. When you make a mistake and the user
corrects you, add a one-line rule to `lessons.md` that prevents the same
mistake. Read `lessons.md` after this file, every session.

## Decision points — when to stop and ask

The full list of named decision points is in `docs/IMPLEMENTATION_PLAN.md`,
labelled D1.1, D1.2 etc through D13.3. At each one:

1. Write the decision into DECISION_LOG.md with options and recommendation,
   status PENDING.
2. Stop work.
3. Ask the user with options laid out clearly.
4. When the user responds, update DECISION_LOG.md status to DECIDED with
   reasoning.
5. Continue.

## Permission posture (balanced)

Hooks auto-allow: read operations, lint/test/format commands, file writes
inside the project tree, git operations except push-to-main.

Hooks block or prompt: destructive commands (`rm -rf`, force ops), writes to
`data/eval/test_set.jsonl` after Phase 8, pushes to main, commits containing
secret patterns, anything that spends money (Kaggle CLI runs, bulk API calls).

## Anti-patterns — do not do these

- Do not fine-tune for facts. Fine-tune for form. Facts go through RAG.
- Do not use Mistral 7B unless Qwen3 Unsloth support is broken — see D9.1.
- Do not generate the eval test set. The user hand-writes it. Phase 8.
- Do not train on `data/eval/test_set.jsonl`. Ever.
- Do not claim regulatory compliance. The README's exact language: "research
  project demonstrating engagement with the FCA framework".
- Do not bulk-import HuggingFace "UK finance Q&A" datasets. Most are
  US-shaped or low quality. The hand-curated dataset is the project's value.
- Do not write the regulatory framing in the README. That is the user's voice.
  You can draft technical sections; the regulatory framing is theirs.
- Do not commit secrets. `.env` is gitignored. Pre-commit hooks scan for
  obvious patterns.

## When in doubt

Stop and ask. A 30-second user check is cheaper than a 4-hour rollback.
