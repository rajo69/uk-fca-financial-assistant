# UK FCA Financial Information Assistant

A fine-tuned open-weight LLM for UK retail financial questions, demonstrating
engagement with the FCA advice/guidance boundary as expanded by the Targeted
Support regime (in effect from 6 April 2026).

**Status: in development.** This is a portfolio project, not an FCA-authorised
service. See [CLAUDE.md](./CLAUDE.md) for the project brief and
[`docs/IMPLEMENTATION_PLAN.md`](./docs/IMPLEMENTATION_PLAN.md) for the full
plan.

## Quick start

```bash
make install-dev    # install dev environment
make test           # run unit tests
make lint           # lint + type-check
```

## Project structure

```
src/ukfca/        — package source
tests/            — unit + integration tests
configs/          — YAML configs for training, eval, RAG, serving
data/             — datasets (raw, sources, sft, dpo, eval)
docs/             — architecture, plan, regulatory notes
scripts/          — thin CLI entry points
```

## Documentation

- [CLAUDE.md](./CLAUDE.md) — project brief and workflow rules
- [RESUMABILITY.md](./RESUMABILITY.md) — current phase status
- [DECISION_LOG.md](./DECISION_LOG.md) — every named decision with reasoning
- [docs/IMPLEMENTATION_PLAN.md](./docs/IMPLEMENTATION_PLAN.md) — full plan

## Licence

Apache-2.0.
