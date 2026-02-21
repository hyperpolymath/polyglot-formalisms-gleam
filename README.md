# PolyglotFormalisms.gleam

Gleam implementation of the PolyglotFormalisms Common Library specification.

## Overview

This package provides Gleam implementations of fundamental operations defined in the PolyglotFormalisms specification, enabling semantic equivalence verification across multiple programming languages.

## Modules

### Arithmetic
- `add(a, b)` - Addition
- `subtract(a, b)` - Subtraction
- `multiply(a, b)` - Multiplication
- `divide(a, b)` - Division
- `modulo(a, b)` - Modulo (integer operation)

### Comparison
- `less_than(a, b)` - Strict less than
- `greater_than(a, b)` - Strict greater than
- `equal(a, b)` - Equality
- `not_equal(a, b)` - Inequality
- `less_equal(a, b)` - Less than or equal
- `greater_equal(a, b)` - Greater than or equal

### Logical
- `and(a, b)` - Logical conjunction
- `or(a, b)` - Logical disjunction
- `not(a)` - Logical negation

## Installation

Add this package to your `gleam.toml`:

```toml
[dependencies]
polyglot_formalisms = ">= 0.2.0 and < 1.0.0"
```

## Usage

```gleam
import polyglot_formalisms/arithmetic
import polyglot_formalisms/comparison
import polyglot_formalisms/logical

pub fn main() {
  // Arithmetic
  let sum = arithmetic.add(2.0, 3.0)
  let product = arithmetic.multiply(4.0, 5.0)

  // Comparison
  let is_less = comparison.less_than(2.0, 3.0)
  let is_equal = comparison.equal(5.0, 5.0)

  // Logical
  let both_true = logical.and(True, True)
  let either_true = logical.or(False, True)
  let negated = logical.not(False)
}
```

## Mathematical Properties

All implementations preserve the mathematical properties defined in the PolyglotFormalisms specification:

### Arithmetic Properties
- Commutativity (for add, multiply)
- Associativity (for add, multiply)
- Identity elements
- Distributivity

### Comparison Properties
- Transitivity
- Reflexivity
- Symmetry
- Asymmetry

### Logical Properties
- Commutativity
- Associativity
- Distributivity
- De Morgan's laws
- Excluded middle
- Non-contradiction

## Behavioral Semantics

This implementation follows BEAM/Erlang semantics for the Gleam runtime:

### Float Operations
- Division by zero returns `Infinity`
- NaN propagation follows IEEE 754
- Comparison with NaN returns `False`

### Integer Operations
- Modulo uses Erlang `rem` operator semantics
- Modulo by zero crashes (BEAM behavior)

### Boolean Operations
- Short-circuit evaluation for `and` and `or`
- Eager evaluation for wrapper functions

## Cross-Language Verification

This Gleam implementation is semantically equivalent to:
- Julia implementation (PolyglotFormalisms.jl)
- ReScript implementation (alib-for-rescript)
- Elixir implementation (polyglot_formalisms_elixir)

Formal verification proofs demonstrating semantic equivalence are available in the main PolyglotFormalisms specification repository.

## License

PMPL-1.0-or-later (Palimpsest Meta-Public License)

## Related Projects

- [PolyglotFormalisms.jl](https://github.com/hyperpolymath/PolyglotFormalisms.jl) - Julia reference implementation
- [alib-for-rescript](https://github.com/hyperpolymath/alib-for-rescript) - ReScript implementation
- [polyglot_formalisms_elixir](https://github.com/hyperpolymath/polyglot_formalisms_elixir) - Elixir implementation


## Architecture

See [TOPOLOGY.md](TOPOLOGY.md) for a visual architecture map and completion dashboard.
