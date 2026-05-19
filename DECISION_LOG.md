# Decision Log

Append-only. Every named decision point (D-number) from the implementation plan
gets an entry here with date, options considered, the chosen option, and
reasoning. This becomes interview prep — every entry is a "why did you make
that choice" answer pre-written.

## Format
D{phase}.{number} — {short title}
Date: YYYY-MM-DD
Status: PENDING | DECIDED | REVISITED
Options considered:

A: ...
B: ...
C: ...
Recommendation: {with reasoning}
Decision: {chosen option}
Reasoning: {why}
Revisit if: {trigger}


---

### D1.1 — Permission posture for Claude Code hooks
**Date:** 2026-05-19
**Status:** DECIDED
**Options considered:**
- A — Strict: every bash command and most file writes prompt for approval
- B — Balanced: auto-allow safe ops, hard-block destructive ops, prompt for
  middle (money-spending, sacred files, push-to-main)
- C — Permissive: auto-allow most, prompt only on rm -rf and force-push

**Recommendation:** B (Balanced). Matches the agreed workflow of free-running
inside phases with hard gates between phases. Strict eats Pro quota on
confirmations; permissive risks expensive mistakes.

**Decision:** B (Balanced).
**Reasoning:** Aligns with the stated phased-and-gated workflow. Auto-allow
covers ~90% of intra-phase work; prompts protect the things that actually
matter (sacred files, money, irreversible git ops).
**Revisit if:** hooks block work too often, or auto-allowed actions cause
unexpected damage.

---

### D1.2 — Repository visibility
**Date:** 2026-05-19
**Status:** DECIDED
**Options considered:**
- A — Public from day one (Kaggle Pattern B clones from public GitHub repo)
- B — Private now, flip public at Phase 9 (training start)
- C — Private throughout (Kaggle Pattern A via dataset uploads)

**Recommendation:** A.
**Decision:** A.
**Reasoning:** Simplest plumbing. Half-built repo with clean commits is itself
a portfolio signal — recruiters can watch project evolve in real time.
**Revisit if:** something sensitive needs to live in the repo (it shouldn't —
secrets via .env, large data via Kaggle datasets).

---

### D1.3 — `lessons.md` self-improvement file
**Date:** 2026-05-19
**Status:** DECIDED
**Options considered:**
- A — Yes, maintain lessons.md per Boris Cherny / Anthropic pattern
- B — No, rely only on CLAUDE.md updates for corrections

**Recommendation:** A.
**Decision:** A.
**Reasoning:** Compound engineering effect. Costs nothing. CLAUDE.md is
strategic; lessons.md is tactical. Separation keeps CLAUDE.md under the
~150-line readable limit.
**Revisit if:** lessons.md grows past ~50 lines and starts repeating CLAUDE.md.

---

<!-- Future decisions append below this line -->
