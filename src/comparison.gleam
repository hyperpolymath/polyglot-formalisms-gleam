// SPDX-License-Identifier: PMPL-1.0-or-later
////
//// Comparison operations from the PolyglotFormalisms Common Library specification.
////
//// Gleam implementation matching aggregate-library behavioral semantics.
////

/// less_than(a, b) -> Bool
///
/// Checks if the first value is strictly less than the second value.
///
/// # Behavioral Semantics
/// - Parameters: a (first value), b (second value)
/// - Returns: True if a < b, otherwise False
///
/// # Mathematical Properties
/// - Transitivity: less_than(a, b) && less_than(b, c) => less_than(a, c)
/// - Irreflexivity: !less_than(a, a)
/// - Asymmetry: less_than(a, b) => !less_than(b, a)
///
/// # Examples
/// ```gleam
/// less_than(2.0, 3.0)       // Returns True
/// less_than(5.0, 5.0)       // Returns False
/// less_than(10.0, 3.0)      // Returns False
/// less_than(-5.0, 0.0)      // Returns True
/// less_than(1.5, 2.5)       // Returns True
/// ```
pub fn less_than(a: Float, b: Float) -> Bool {
  a <. b
}

/// greater_than(a, b) -> Bool
///
/// Checks if the first value is strictly greater than the second value.
///
/// # Behavioral Semantics
/// - Parameters: a (first value), b (second value)
/// - Returns: True if a > b, otherwise False
///
/// # Mathematical Properties
/// - Transitivity: greater_than(a, b) && greater_than(b, c) => greater_than(a, c)
/// - Irreflexivity: !greater_than(a, a)
/// - Relation to less_than: greater_than(a, b) == less_than(b, a)
///
/// # Examples
/// ```gleam
/// greater_than(5.0, 3.0)       // Returns True
/// greater_than(2.0, 2.0)       // Returns False
/// greater_than(1.0, 10.0)      // Returns False
/// greater_than(0.0, -5.0)      // Returns True
/// greater_than(3.5, 1.2)       // Returns True
/// ```
pub fn greater_than(a: Float, b: Float) -> Bool {
  a >. b
}

/// equal(a, b) -> Bool
///
/// Checks if two values are equal.
///
/// # Behavioral Semantics
/// - Parameters: a (first value), b (second value)
/// - Returns: True if a == b, otherwise False
///
/// # Mathematical Properties
/// - Reflexivity: equal(a, a)
/// - Symmetry: equal(a, b) => equal(b, a)
/// - Transitivity: equal(a, b) && equal(b, c) => equal(a, c)
///
/// # Examples
/// ```gleam
/// equal(5.0, 5.0)          // Returns True
/// equal(3.0, 7.0)          // Returns False
/// equal(0.0, 0.0)          // Returns True
/// equal(2.5, 2.5)          // Returns True
/// ```
pub fn equal(a: Float, b: Float) -> Bool {
  a == b
}

/// not_equal(a, b) -> Bool
///
/// Checks if two values are not equal.
///
/// # Behavioral Semantics
/// - Parameters: a (first value), b (second value)
/// - Returns: True if a != b, otherwise False
///
/// # Mathematical Properties
/// - Negation of equal: not_equal(a, b) == !equal(a, b)
/// - Symmetry: not_equal(a, b) => not_equal(b, a)
///
/// # Examples
/// ```gleam
/// not_equal(5.0, 3.0)       // Returns True
/// not_equal(7.0, 7.0)       // Returns False
/// not_equal(0.0, 1.0)       // Returns True
/// not_equal(-5.0, -5.0)     // Returns False
/// not_equal(2.5, 2.6)       // Returns True
/// ```
pub fn not_equal(a: Float, b: Float) -> Bool {
  a != b
}

/// less_equal(a, b) -> Bool
///
/// Checks if the first value is less than or equal to the second value.
///
/// # Behavioral Semantics
/// - Parameters: a (first value), b (second value)
/// - Returns: True if a <= b, otherwise False
///
/// # Mathematical Properties
/// - Reflexivity: less_equal(a, a)
/// - Transitivity: less_equal(a, b) && less_equal(b, c) => less_equal(a, c)
/// - Antisymmetry: less_equal(a, b) && less_equal(b, a) => equal(a, b)
/// - Relation to less_than: less_equal(a, b) == (less_than(a, b) || equal(a, b))
///
/// # Examples
/// ```gleam
/// less_equal(2.0, 3.0)       // Returns True
/// less_equal(5.0, 5.0)       // Returns True
/// less_equal(10.0, 3.0)      // Returns False
/// less_equal(-5.0, 0.0)      // Returns True
/// less_equal(1.5, 1.5)       // Returns True
/// ```
pub fn less_equal(a: Float, b: Float) -> Bool {
  a <=. b
}

/// greater_equal(a, b) -> Bool
///
/// Checks if the first value is greater than or equal to the second value.
///
/// # Behavioral Semantics
/// - Parameters: a (first value), b (second value)
/// - Returns: True if a >= b, otherwise False
///
/// # Mathematical Properties
/// - Reflexivity: greater_equal(a, a)
/// - Transitivity: greater_equal(a, b) && greater_equal(b, c) => greater_equal(a, c)
/// - Antisymmetry: greater_equal(a, b) && greater_equal(b, a) => equal(a, b)
/// - Relation to less_equal: greater_equal(a, b) == less_equal(b, a)
///
/// # Examples
/// ```gleam
/// greater_equal(5.0, 3.0)       // Returns True
/// greater_equal(7.0, 7.0)       // Returns True
/// greater_equal(2.0, 10.0)      // Returns False
/// greater_equal(0.0, -5.0)      // Returns True
/// greater_equal(3.5, 3.5)       // Returns True
/// ```
pub fn greater_equal(a: Float, b: Float) -> Bool {
  a >=. b
}
