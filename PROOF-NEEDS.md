# PROOF-NEEDS.md — polyglot-formalisms-gleam

## Current State

- **src/abi/*.idr**: NO
- **Dangerous patterns**: 0
- **LOC**: ~2,100 (Gleam)
- **ABI layer**: Missing

## What Needs Proving

| Component | What | Why |
|-----------|------|-----|
| Arithmetic operations | Operations satisfy algebraic laws | Same as Elixir sibling — shared spec must be correct |
| Comparison operations | Total order properties | Broken comparisons propagate to all consumers |
| Logical operations | Boolean algebra laws | Shared library correctness requirement |
| Dragonfly supervisor | Supervisor restart strategy is correct | Incorrect restart can cause cascading failures |

## Recommended Prover

**Idris2** — Create `src/abi/` with algebraic law proofs matching the Elixir sibling. The Dragonfly supervisor correctness could use **Gleam** property-based testing as a first step.

## Priority

**LOW** — Small common library, same rationale as the Elixir sibling. The Dragonfly supervisor adds a small additional concern.
