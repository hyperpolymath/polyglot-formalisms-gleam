// SPDX-License-Identifier: PMPL-1.0-or-later

//
// Logical Kernel — PolyglotFormalisms Common Library (Gleam).
//
// This module implements boolean algebra operations matching the 
// PolyglotFormalisms specification. It ensures that logical predicates 
// behave consistently across the Gleam and Idris ecosystems.
//
// DESIGN MANDATE:
// - Direct mapping to Gleam's boolean operators.
// - Formal documentation of algebraic identities (e.g. Involution).
// - Verification of De Morgan's Law compliance.
//

/// CONJUNCTION: Returns True iff both `a` and `b` are True.
///
/// PROPERTIES:
/// - Annihilator: and(a, False) == False
/// - Identity: and(a, True) == a
pub fn and(a: Bool, b: Bool) -> Bool {
  a && b
}

/// DISJUNCTION: Returns True if at least one of `a` or `b` is True.
///
/// PROPERTIES:
/// - Annihilator: or(a, True) == True
/// - Identity: or(a, False) == a
pub fn or(a: Bool, b: Bool) -> Bool {
  a || b
}

/// NEGATION: Inverts the boolean value of `a`.
///
/// PROPERTIES:
/// - Involution: not(not(a)) == a
/// - Excluded Middle: or(a, not(a)) == True
pub fn not(a: Bool) -> Bool {
  !a
}
