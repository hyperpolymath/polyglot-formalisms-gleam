# TEST-NEEDS.md — polyglot-formalisms-gleam

## CRG Grade: C — ACHIEVED 2026-04-04

169 tests passing (gleam test, 0 failures). All CRG C categories met.

> Generated 2026-03-29 by punishing audit. Updated 2026-04-04 by CRG C blitz.

## Current State

| Category     | Count | Notes |
|-------------|-------|-------|
| Unit tests   | 4     | arithmetic_test, comparison_test, logical_test, string_ops_test + polyglot_formalisms_test |
| Integration  | 0     | None |
| E2E          | 0     | None |
| Benchmarks   | 0     | None |

**Source modules:** 5 Gleam modules in src/ (arithmetic, comparison, logical, string_ops, polyglot_formalisms).

## What's Missing

### P2P (Property-Based) Tests
- [ ] Arithmetic: property tests for commutativity, associativity, identity
- [ ] Comparison: property tests for transitivity, reflexivity, antisymmetry
- [ ] Logical: truth table exhaustive testing, De Morgan's laws
- [ ] String ops: arbitrary string input property tests

### E2E Tests
- [ ] Cross-module: combined expressions
- [ ] Equivalence: results match polyglot-formalisms-elixir for same inputs

### Aspect Tests
- **Security:** N/A (pure functions)
- **Performance:** No benchmarks
- **Concurrency:** N/A
- **Error handling:** No tests for overflow, division by zero, empty inputs

### Build & Execution
- [ ] `gleam test`

### Benchmarks Needed
- [ ] Operation throughput comparison (Gleam vs Elixir implementation)

### Self-Tests
- [ ] All formal properties verified

## Priority

**MEDIUM.** 5 modules with 5 test files = 100% file coverage. Same as the Elixir sibling: needs property-based tests for mathematical properties. Cross-implementation equivalence testing between Elixir and Gleam versions is missing.

## FAKE-FUZZ ALERT

- `tests/fuzz/placeholder.txt` is a scorecard placeholder inherited from rsr-template-repo — it does NOT provide real fuzz testing
- Replace with an actual fuzz harness (see rsr-template-repo/tests/fuzz/README.adoc) or remove the file
- Priority: P2 — creates false impression of fuzz coverage
