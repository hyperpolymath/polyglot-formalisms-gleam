// SPDX-License-Identifier: MPL-2.0
// (PMPL-1.0-or-later preferred; MPL-2.0 required for Hex.pm)
//
// Property-based tests for PolyglotFormalisms Gleam library.
// Simulates proptest-style invariant checking with parameterised iterations.

import gleeunit/should
import arithmetic
import comparison
import logical
import string_ops

// ===== Arithmetic properties =====

pub fn arithmetic_add_commutativity_test() {
  let pairs = [#(1.0, 2.0), #(0.0, 5.0), #(-3.0, 4.0), #(100.0, -50.0), #(0.5, 0.5)]
  pairs
  |> check_all(fn(pair) {
    let #(a, b) = pair
    arithmetic.add(a, b) |> should.equal(arithmetic.add(b, a))
  })
}

pub fn arithmetic_add_identity_test() {
  let values = [0.0, 1.0, -1.0, 42.0, 100.5, -99.9]
  values
  |> check_all(fn(a) {
    arithmetic.add(a, 0.0) |> should.equal(a)
  })
}

pub fn arithmetic_subtract_inverse_test() {
  let values = [1.0, 5.0, -3.0, 42.0, 0.5]
  values
  |> check_all(fn(a) {
    // subtract(a, a) == 0.0
    arithmetic.subtract(a, a) |> should.equal(0.0)
  })
}

pub fn arithmetic_multiply_zero_test() {
  // Note: IEEE 754 signed zero: negative * 0.0 = -0.0 (not structurally equal to 0.0)
  // Test only non-negative values to avoid signed-zero corner case.
  let values = [0.0, 1.0, 42.0, 100.5, 0.001]
  values
  |> check_all(fn(a) {
    arithmetic.multiply(a, 0.0) |> should.equal(0.0)
  })
}

pub fn arithmetic_multiply_identity_test() {
  let values = [0.0, 1.0, -1.0, 42.0, 100.5, -99.9]
  values
  |> check_all(fn(a) {
    arithmetic.multiply(a, 1.0) |> should.equal(a)
  })
}

pub fn arithmetic_modulo_positive_result_test() {
  let pairs = [#(10, 3), #(7, 4), #(100, 7), #(1, 1), #(0, 5)]
  pairs
  |> check_all(fn(pair) {
    let #(a, b) = pair
    let result = arithmetic.modulo(a, b)
    // For non-negative dividends: 0 <= result < b
    should.be_true(result >= 0)
    should.be_true(result < b)
  })
}

// ===== Comparison properties =====

pub fn comparison_reflexivity_test() {
  let values = [0.0, 1.0, -1.0, 42.0, 100.5]
  values
  |> check_all(fn(a) {
    comparison.equal(a, a) |> should.be_true
    comparison.less_equal(a, a) |> should.be_true
    comparison.greater_equal(a, a) |> should.be_true
    comparison.less_than(a, a) |> should.be_false
    comparison.not_equal(a, a) |> should.be_false
  })
}

pub fn comparison_antisymmetry_test() {
  let pairs = [#(1.0, 2.0), #(5.0, 3.0), #(0.0, 1.0), #(-1.0, 0.0), #(100.0, 99.9)]
  pairs
  |> check_all(fn(pair) {
    let #(a, b) = pair
    // If a < b then NOT b < a
    case comparison.less_than(a, b) {
      True -> comparison.less_than(b, a) |> should.be_false
      False -> Nil
    }
  })
}

pub fn comparison_not_equal_negation_test() {
  let pairs = [#(1.0, 1.0), #(2.0, 3.0), #(0.0, 0.0), #(-1.0, 1.0)]
  pairs
  |> check_all(fn(pair) {
    let #(a, b) = pair
    comparison.not_equal(a, b) |> should.equal(!comparison.equal(a, b))
  })
}

// ===== Logical properties =====

pub fn logical_double_negation_test() {
  [True, False]
  |> check_all(fn(b) {
    logical.not(logical.not(b)) |> should.equal(b)
  })
}

pub fn logical_de_morgan_test() {
  let pairs = [#(True, True), #(True, False), #(False, True), #(False, False)]
  pairs
  |> check_all(fn(pair) {
    let #(a, b) = pair
    // NOT(a AND b) == (NOT a) OR (NOT b)
    logical.not(logical.and(a, b))
    |> should.equal(logical.or(logical.not(a), logical.not(b)))
  })
}

// ===== String properties =====

pub fn string_concat_identity_test() {
  let values = ["", "hello", "world", "PolyglotFormalisms", "🌍"]
  values
  |> check_all(fn(s) {
    string_ops.concat(s, "") |> should.equal(s)
    string_ops.concat("", s) |> should.equal(s)
  })
}

pub fn string_length_concat_test() {
  let pairs = [#("hello", "world"), #("", "test"), #("a", "b"), #("abc", "")]
  pairs
  |> check_all(fn(pair) {
    let #(a, b) = pair
    string_ops.length(string_ops.concat(a, b))
    |> should.equal(string_ops.length(a) + string_ops.length(b))
  })
}

pub fn string_trim_idempotent_test() {
  let values = ["  hello  ", "no-spaces", "   ", "\n\t  "]
  values
  |> check_all(fn(s) {
    let once = string_ops.trim(s)
    let twice = string_ops.trim(once)
    twice |> should.equal(once)
  })
}

pub fn string_case_roundtrip_test() {
  // uppercase then lowercase of a lowercase string = original
  let values = ["hello", "world", "polyglot", "formalisms"]
  values
  |> check_all(fn(s) {
    s
    |> string_ops.to_uppercase
    |> string_ops.to_lowercase
    |> should.equal(s)
  })
}

// ===== Helper =====

fn check_all(values: List(a), f: fn(a) -> b) -> Nil {
  case values {
    [] -> Nil
    [h, ..t] -> {
      f(h)
      check_all(t, f)
    }
  }
}
