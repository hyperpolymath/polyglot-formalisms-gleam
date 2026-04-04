// SPDX-License-Identifier: MPL-2.0
// (PMPL-1.0-or-later preferred; MPL-2.0 required for Hex.pm)
//
// E2E, reflexive, contract, and aspect tests for PolyglotFormalisms Gleam.

import gleeunit/should
import arithmetic
import comparison
import string_ops
import logical

// ===== Smoke tests =====

pub fn smoke_arithmetic_add_test() {
  arithmetic.add(1.0, 2.0) |> should.equal(3.0)
}

pub fn smoke_string_concat_test() {
  string_ops.concat("hello", " world") |> should.equal("hello world")
}

pub fn smoke_logical_and_test() {
  logical.and(True, True) |> should.be_true
  logical.and(True, False) |> should.be_false
}

// ===== E2E: full pipeline tests =====

pub fn e2e_arithmetic_pipeline_test() {
  // Full arithmetic pipeline: add, subtract, multiply, divide
  let a = 10.0
  let b = 3.0
  let sum = arithmetic.add(a, b)        // 13.0
  let diff = arithmetic.subtract(a, b)   // 7.0
  let product = arithmetic.multiply(sum, diff)  // 91.0
  let quotient = arithmetic.divide(product, a)  // 9.1

  sum |> should.equal(13.0)
  diff |> should.equal(7.0)
  product |> should.equal(91.0)
  quotient |> should.equal(9.1)
}

pub fn e2e_string_pipeline_test() {
  // Full string pipeline: concat, trim, uppercase, split, join
  let raw = "  hello world  "
  let trimmed = string_ops.trim(raw)
  let upper = string_ops.to_uppercase(trimmed)
  let parts = string_ops.split(upper, " ")
  let rejoined = string_ops.join(parts, "-")

  trimmed |> should.equal("hello world")
  upper |> should.equal("HELLO WORLD")
  rejoined |> should.equal("HELLO-WORLD")
}

pub fn e2e_comparison_pipeline_test() {
  // Ordering consistency: if a < b then NOT (a > b)
  let a = 5.0
  let b = 10.0

  comparison.less_than(a, b) |> should.be_true
  comparison.less_equal(a, b) |> should.be_true
  comparison.equal(a, b) |> should.be_false
  comparison.not_equal(a, b) |> should.be_true
  comparison.greater_than(b, a) |> should.be_true
  comparison.greater_equal(b, a) |> should.be_true
}

// ===== Reflexive: round-trip tests =====

pub fn reflexive_string_split_join_test() {
  // join(split(s, sep), sep) == s
  let s = "a,b,c,d"
  let parts = string_ops.split(s, ",")
  string_ops.join(parts, ",") |> should.equal(s)
}

pub fn reflexive_string_case_test() {
  // A string that is already uppercase should be unchanged by to_uppercase
  let s = "HELLO WORLD"
  string_ops.to_uppercase(s) |> should.equal(s)
}

pub fn reflexive_arithmetic_subtract_add_test() {
  // (a + b) - b == a
  let a = 42.0
  let b = 17.0
  arithmetic.subtract(arithmetic.add(a, b), b) |> should.equal(a)
}

// ===== Contract: API invariant tests =====

pub fn contract_divide_by_one_test() {
  // Dividing by 1.0 returns the original value
  let values = [0.0, 1.0, -1.0, 42.0, 100.5]
  values
  |> list_each(fn(a) {
    arithmetic.divide(a, 1.0) |> should.equal(a)
  })
}

pub fn contract_comparison_total_order_test() {
  // For any two values: exactly one of less_than, equal, greater_than holds
  let pairs = [
    #(1.0, 2.0), #(2.0, 1.0), #(1.0, 1.0),
    #(0.0, -1.0), #(-5.0, 5.0),
  ]
  pairs
  |> list_each(fn(pair) {
    let #(a, b) = pair
    let lt = comparison.less_than(a, b)
    let eq = comparison.equal(a, b)
    let gt = comparison.greater_than(a, b)
    // Exactly one must be true
    let count = count_true([lt, eq, gt])
    count |> should.equal(1)
  })
}

pub fn contract_string_contains_transitivity_test() {
  // If s contains sub1 and sub1 contains sub2, then s contains sub2
  let s = "Hello, World!"
  let sub1 = "World!"
  let sub2 = "!"
  string_ops.contains(s, sub1) |> should.be_true
  string_ops.contains(sub1, sub2) |> should.be_true
  string_ops.contains(s, sub2) |> should.be_true
}

// ===== Aspect: security and correctness =====

pub fn aspect_no_panic_on_empty_inputs_test() {
  // Core operations on empty inputs must not crash
  arithmetic.add(0.0, 0.0) |> should.equal(0.0)
  arithmetic.multiply(0.0, 0.0) |> should.equal(0.0)
  string_ops.length("") |> should.equal(0)
  string_ops.concat("", "") |> should.equal("")
  string_ops.trim("") |> should.equal("")
  string_ops.split("", ",") |> should.equal([""])
  string_ops.index_of("", "") |> should.equal(0)
  string_ops.index_of("", "x") |> should.equal(-1)
}

pub fn aspect_no_panic_on_edge_cases_test() {
  // Modulo must not crash on standard inputs
  arithmetic.modulo(0, 1) |> should.equal(0)
  arithmetic.modulo(7, 3) |> should.equal(1)
  // Substring out of bounds returns empty
  string_ops.substring("hi", 5, 10) |> should.equal("")
  // Replace with empty pattern keeps original
  string_ops.replace("hello", "z", "X") |> should.equal("hello")
}

pub fn aspect_no_mutation_of_inputs_test() {
  // String operations must be pure (no side effects)
  let original = "hello"
  let _upper = string_ops.to_uppercase(original)
  let _lower = string_ops.to_lowercase(original)
  let _trimmed = string_ops.trim(original)
  // original is unchanged (Gleam is immutable, but this documents the intent)
  original |> should.equal("hello")
}

// ===== Helpers =====

fn list_each(values: List(a), f: fn(a) -> b) -> Nil {
  case values {
    [] -> Nil
    [h, ..t] -> {
      f(h)
      list_each(t, f)
    }
  }
}

fn count_true(bools: List(Bool)) -> Int {
  case bools {
    [] -> 0
    [True, ..rest] -> 1 + count_true(rest)
    [False, ..rest] -> count_true(rest)
  }
}
