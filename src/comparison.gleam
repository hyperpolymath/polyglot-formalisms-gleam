// SPDX-License-Identifier: PMPL-1.0-or-later

//
// Comparison Kernel — PolyglotFormalisms Common Library (Gleam).
//
// This module implements the formal comparison operations specified in 
// the common library. It ensures that ordering and equality predicates 
// behave identically across all ecosystem components.
//
// DESIGN PRINCIPLES:
// - Direct mapping to Gleam's float-specific operators (`<.`, `>.`).
// - Documentation of formal mathematical properties (e.g. Transitivity).
// - Explicit handling of boolean inversion for non-equal relations.
//

/// LESS THAN: Returns True iff `a` is strictly less than `b`.
///
/// PROPERTIES:
/// - Irreflexive: less_than(a, a) == False
/// - Transitive: less_than(a, b) && less_than(b, c) => less_than(a, c)
pub fn less_than(a: Float, b: Float) -> Bool {
  a <. b
}

/// EQUAL: Returns True iff `a` and `b` are identical.
///
/// PROPERTIES:
/// - Reflexive: equal(a, a) == True
/// - Symmetric: equal(a, b) == equal(b, a)
pub fn equal(a: Float, b: Float) -> Bool {
  a == b
}

/// LESS THAN OR EQUAL: Returns True iff `a < b` or `a == b`.
///
/// PROPERTIES:
/// - Antisymmetric: less_equal(a, b) && less_equal(b, a) => equal(a, b)
pub fn less_equal(a: Float, b: Float) -> Bool {
  a <=. b
}

/// GREATER THAN: Returns True iff `a` is strictly greater than `b`.
///
/// PROPERTIES:
/// - Dual of less_than: greater_than(a, b) == less_than(b, a)
/// - Irreflexive: greater_than(a, a) == False
pub fn greater_than(a: Float, b: Float) -> Bool {
  a >. b
}

/// GREATER THAN OR EQUAL: Returns True iff `a > b` or `a == b`.
///
/// PROPERTIES:
/// - Dual of less_equal: greater_equal(a, b) == less_equal(b, a)
pub fn greater_equal(a: Float, b: Float) -> Bool {
  a >=. b
}

/// NOT EQUAL: Returns True iff `a` and `b` are distinct.
///
/// PROPERTIES:
/// - Symmetric: not_equal(a, b) == not_equal(b, a)
/// - Negation: not_equal(a, b) == !equal(a, b)
pub fn not_equal(a: Float, b: Float) -> Bool {
  a != b
}
