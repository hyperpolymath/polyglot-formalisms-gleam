// SPDX-License-Identifier: PMPL-1.0-or-later

// Arithmetic Kernel — PolyglotFormalisms Common Library (Gleam).
//
// This module implements the arithmetic section of the PolyglotFormalisms 
// specification for the Gleam language. It ensures consistent numerical 
// behavior across the BEAM (Erlang) ecosystem.
//
// DESIGN PRINCIPLES:
// - Direct mapping to aggregate-library behavioral semantics.
// - Documentation of formal mathematical properties (e.g. Identity, Inverse).
// - Explicit handling of BEAM-specific floating-point edge cases.

/// SUMMATION: Computes the arithmetic sum of two floats.
///
/// PROPERTIES:
/// - Commutativity: add(a, b) == add(b, a)
/// - Identity: add(a, 0.0) == a
pub fn add(a: Float, b: Float) -> Float {
  a +. b
}

/// MULTIPLICATION: Computes the product of two floats.
///
/// PROPERTIES:
/// - Zero Element: multiply(a, 0.0) == 0.0
/// - Distributivity: multiply(a, add(b, c)) == add(multiply(a, b), multiply(a, c))
pub fn multiply(a: Float, b: Float) -> Float {
  a//. b
}

/// DIVISION: Computes the quotient a / b.
/// 
/// BEHAVIOR: Follows BEAM floating-point division semantics. 
/// Division by zero returns Infinity.
pub fn divide(a: Float, b: Float) -> Float {
  a /. b
}

/// REMAINDER: Computes the integer modulo.
///
/// NOTE: Follows Erlang 'rem' semantics where the result takes 
/// the sign of the dividend (a).
pub fn modulo(a: Int, b: Int) -> Int {
  a % b
}
