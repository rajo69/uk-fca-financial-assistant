# Implementation Plan

This file is the authoritative reference for the phased build of this
project. Each phase has a goal, entry/exit conditions, work split, and named
decision points. Decisions are tracked in DECISION_LOG.md.

## Project shape

13 phases across 4 stages. Phased and gated. Each phase ends with a hard
checkpoint and a RESUMABILITY.md update. Free-running inside a phase; ask the
user at named decision points (D{phase}.{n}) and at phase boundaries.

## Stage 0 — Foundations

### Phase 1 — Workflow foundations
Goal: CLAUDE.md, hooks, decision log, lessons file, resumability doc.
Decisions: D1.1 permission posture, D1.2 repo visibility, D1.3 lessons.md.
Status: COMPLETE.

### Phase 2 — Repo scaffolding & dependency management
Goal: directory tree, pyproject.toml with uv, pre-commit, Makefile, CI.
Decisions: D2.1 experiment tracking tool (W&B), D2.2 permission posture for
this phase (skip-permissions for mechanical work, never for money-spending).
Status: IN PROGRESS.

### Phase 3 — Domain immersion
Goal: user reads FCA PS25/22, Consumer Duty, AGBR, MoneyHelper, vulnerability
guidance, PS7/24 model risk. Notes into docs/REGULATORY_NOTES.md in user's
own words. Mostly NOT Claude Code work.
Decisions: D3.1 scope (pensions only / investments only / both).

## Stage 1 — Data

### Phase 4 — Annotation rubric & data schema
Goal: ANNOTATION_RUBRIC.md, schemas.py with Pydantic models, validation
utilities. 20 hand-written examples walked through to confirm rubric works.
Decisions: D4.1 number of primary categories (5 recommended), D4.2 metadata
sub-tags, D4.3 ordinal vs pass/fail scoring.

### Phase 5 — Data ingestion pipeline (RAG sources)
Goal: scripts that fetch FCA Handbook, MoneyHelper, gov.uk into data/sources.
Manifest with hashes + dates. Politeness, robots.txt.
Decisions: D5.1 handbook source format (HTML recommended), D5.2 include
Citizens Advice (yes recommended).

### Phase 6 — SFT seed examples (user-heavy)
Goal: ~100 hand-written SFT seeds in data/sft/seeds/seeds.jsonl, distributed
per rubric. ~15-18 hours of user work.
Decisions: D6.1 include ambiguous-boundary examples (yes ~15%),
D6.2 negative examples in seeds (no — those become DPO rejected).

### Phase 7 — Synthetic expansion & review tooling
Goal: ~2,500 final SFT examples + Streamlit review UI for manual accept/reject.
Decisions: D7.1 generator model (Sonnet recommended), D7.2 expansion ratio
(10x recommended), D7.3 publish to HuggingFace Hub (yes recommended).

## Stage 2 — Training & evaluation

### Phase 8 — Eval test set (user-heavy)
Goal: ~300 hand-crafted held-out test examples in data/eval/test_set.jsonl.
Sacred from this point on — hook blocks writes after this phase completes.
Decisions: D8.1 source-isolate (partially yes), D8.2 publish redacted (no).

### Phase 9 — SFT training pipeline
Goal: Working Unsloth + TRL pipeline on Kaggle, trained adapter pushed to HF
Hub. Local-to-Kaggle plumbing via kaggle CLI.
Decisions: D9.1 base model final pick (Qwen3-8B if Unsloth notebook stable),
D9.2 LoRA rank (16), D9.3 Kaggle GPU (P100), D9.4 reasoning ratio risk
(accept, document).

### Phase 10 — Eval harness & LLM-as-judge
Goal: Multi-criteria judges in src/ukfca/eval/, baseline numbers, kappa
calibration against user's own scoring on 40 examples.
Decisions: D10.1 judge model split (Opus boundary, Sonnet tone),
D10.2 kappa threshold (0.6 floor, 0.7 target), D10.3 position-bias test
(yes for DPO).

### Phase 11 — DPO pipeline
Goal: ~1,500 preference pairs, DPO training, DPO adapter on Hub, headline
metrics table populated.
Decisions: D11.1 DPO beta (0.1), D11.2 completions per prompt (4).

## Stage 3 — RAG, deployment, packaging

### Phase 12 — RAG layer
Goal: RAG over FCA Handbook + MoneyHelper + gov.uk, RAGAS-evaluated.
Decisions: D12.1 embedding model (bge-small-en-v1.5), D12.2 reranker (yes).

### Phase 13 — Serving, deployment, README & writeups
Goal: Public demo URL, full README, dataset/model cards, blog post, eval CI.
Decisions: D13.1 deployment target (Modal recommended), D13.2 failure case
separate doc (yes), D13.3 blog hosting (GitHub Pages).

## Cross-cutting commitments

See CLAUDE.md "Workflow rules". Every session begins by reading
RESUMABILITY.md; every session ends by updating it.
