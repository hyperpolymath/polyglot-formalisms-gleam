// SPDX-License-Identifier: PMPL-1.0-or-later
import gleeunit
import gleeunit/should
import polyglot_formalisms/arithmetic

pub fn main() {
  gleeunit.main()
}

// Add tests
pub fn add_positive_test() {
  arithmetic.add(2.0, 3.0)
  |> should.equal(5.0)
}

pub fn add_negative_test() {
  arithmetic.add(-5.0, 3.0)
  |> should.equal(-2.0)
}

pub fn add_zero_test() {
  arithmetic.add(0.0, 0.0)
  |> should.equal(0.0)
}

pub fn add_floats_test() {
  arithmetic.add(1.5, 2.5)
  |> should.equal(4.0)
}

pub fn add_commutativity_test() {
  arithmetic.add(5.0, 3.0)
  |> should.equal(arithmetic.add(3.0, 5.0))
}

pub fn add_associativity_test() {
  arithmetic.add(arithmetic.add(1.0, 2.0), 3.0)
  |> should.equal(arithmetic.add(1.0, arithmetic.add(2.0, 3.0)))
}

pub fn add_identity_test() {
  arithmetic.add(42.0, 0.0)
  |> should.equal(42.0)
}

// Subtract tests
pub fn subtract_positive_test() {
  arithmetic.subtract(10.0, 3.0)
  |> should.equal(7.0)
}

pub fn subtract_negative_result_test() {
  arithmetic.subtract(5.0, 8.0)
  |> should.equal(-3.0)
}

pub fn subtract_zero_test() {
  arithmetic.subtract(0.0, 0.0)
  |> should.equal(0.0)
}

pub fn subtract_identity_test() {
  arithmetic.subtract(42.0, 0.0)
  |> should.equal(42.0)
}

// Multiply tests
pub fn multiply_positive_test() {
  arithmetic.multiply(4.0, 5.0)
  |> should.equal(20.0)
}

pub fn multiply_negative_test() {
  arithmetic.multiply(-3.0, 7.0)
  |> should.equal(-21.0)
}

pub fn multiply_zero_test() {
  arithmetic.multiply(0.0, 100.0)
  |> should.equal(0.0)
}

pub fn multiply_floats_test() {
  arithmetic.multiply(2.5, 4.0)
  |> should.equal(10.0)
}

pub fn multiply_commutativity_test() {
  arithmetic.multiply(5.0, 3.0)
  |> should.equal(arithmetic.multiply(3.0, 5.0))
}

pub fn multiply_associativity_test() {
  arithmetic.multiply(arithmetic.multiply(2.0, 3.0), 4.0)
  |> should.equal(arithmetic.multiply(2.0, arithmetic.multiply(3.0, 4.0)))
}

pub fn multiply_identity_test() {
  arithmetic.multiply(42.0, 1.0)
  |> should.equal(42.0)
}

// Divide tests
pub fn divide_evenly_test() {
  arithmetic.divide(10.0, 2.0)
  |> should.equal(5.0)
}

pub fn divide_remainder_test() {
  arithmetic.divide(7.0, 2.0)
  |> should.equal(3.5)
}

pub fn divide_floats_test() {
  arithmetic.divide(10.5, 2.0)
  |> should.equal(5.25)
}

pub fn divide_negative_dividend_test() {
  arithmetic.divide(-10.0, 2.0)
  |> should.equal(-5.0)
}

pub fn divide_negative_divisor_test() {
  arithmetic.divide(5.0, -2.0)
  |> should.equal(-2.5)
}

pub fn divide_identity_test() {
  arithmetic.divide(42.0, 1.0)
  |> should.equal(42.0)
}

// Modulo tests
pub fn modulo_remainder_test() {
  arithmetic.modulo(10, 3)
  |> should.equal(1)
}

pub fn modulo_evenly_divisible_test() {
  arithmetic.modulo(15, 4)
  |> should.equal(3)
}

pub fn modulo_exact_division_test() {
  arithmetic.modulo(7, 7)
  |> should.equal(0)
}

pub fn modulo_negative_test() {
  arithmetic.modulo(-10, 3)
  |> should.equal(-1)
}
