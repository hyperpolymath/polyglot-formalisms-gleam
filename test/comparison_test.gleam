// SPDX-License-Identifier: PMPL-1.0-or-later
import gleeunit/should
import polyglot_formalisms/comparison

// Less than tests
pub fn less_than_true_test() {
  comparison.less_than(2.0, 3.0)
  |> should.be_true()
}

pub fn less_than_equal_test() {
  comparison.less_than(5.0, 5.0)
  |> should.be_false()
}

pub fn less_than_false_test() {
  comparison.less_than(10.0, 3.0)
  |> should.be_false()
}

pub fn less_than_negative_test() {
  comparison.less_than(-5.0, 0.0)
  |> should.be_true()
}

pub fn less_than_transitivity_test() {
  let a = 1.0
  let b = 2.0
  let c = 3.0
  let ab = comparison.less_than(a, b)
  let bc = comparison.less_than(b, c)
  let ac = comparison.less_than(a, c)

  case ab && bc {
    True -> should.be_true(ac)
    False -> should.be_true(True)
  }
}

pub fn less_than_irreflexivity_test() {
  comparison.less_than(5.0, 5.0)
  |> should.be_false()
}

pub fn less_than_asymmetry_test() {
  let a = 2.0
  let b = 3.0
  case comparison.less_than(a, b) {
    True -> should.be_false(comparison.less_than(b, a))
    False -> should.be_true(True)
  }
}

// Greater than tests
pub fn greater_than_true_test() {
  comparison.greater_than(5.0, 3.0)
  |> should.be_true()
}

pub fn greater_than_equal_test() {
  comparison.greater_than(2.0, 2.0)
  |> should.be_false()
}

pub fn greater_than_false_test() {
  comparison.greater_than(1.0, 10.0)
  |> should.be_false()
}

pub fn greater_than_transitivity_test() {
  let a = 3.0
  let b = 2.0
  let c = 1.0
  let ab = comparison.greater_than(a, b)
  let bc = comparison.greater_than(b, c)
  let ac = comparison.greater_than(a, c)

  case ab && bc {
    True -> should.be_true(ac)
    False -> should.be_true(True)
  }
}

pub fn greater_than_irreflexivity_test() {
  comparison.greater_than(5.0, 5.0)
  |> should.be_false()
}

// Equal tests
pub fn equal_true_test() {
  comparison.equal(5.0, 5.0)
  |> should.be_true()
}

pub fn equal_false_test() {
  comparison.equal(3.0, 7.0)
  |> should.be_false()
}

pub fn equal_reflexivity_test() {
  comparison.equal(5.0, 5.0)
  |> should.be_true()
}

pub fn equal_symmetry_test() {
  let a = 5.0
  let b = 5.0
  comparison.equal(a, b)
  |> should.equal(comparison.equal(b, a))
}

pub fn equal_transitivity_test() {
  let a = 5.0
  let b = 5.0
  let c = 5.0
  let ab = comparison.equal(a, b)
  let bc = comparison.equal(b, c)
  let ac = comparison.equal(a, c)

  case ab && bc {
    True -> should.be_true(ac)
    False -> should.be_true(True)
  }
}

// Not equal tests
pub fn not_equal_true_test() {
  comparison.not_equal(5.0, 3.0)
  |> should.be_true()
}

pub fn not_equal_false_test() {
  comparison.not_equal(7.0, 7.0)
  |> should.be_false()
}

pub fn not_equal_negation_test() {
  let a = 5.0
  let b = 3.0
  comparison.not_equal(a, b)
  |> should.equal(!comparison.equal(a, b))
}

pub fn not_equal_symmetry_test() {
  let a = 5.0
  let b = 3.0
  comparison.not_equal(a, b)
  |> should.equal(comparison.not_equal(b, a))
}

// Less equal tests
pub fn less_equal_less_test() {
  comparison.less_equal(2.0, 3.0)
  |> should.be_true()
}

pub fn less_equal_equal_test() {
  comparison.less_equal(5.0, 5.0)
  |> should.be_true()
}

pub fn less_equal_false_test() {
  comparison.less_equal(10.0, 3.0)
  |> should.be_false()
}

pub fn less_equal_reflexivity_test() {
  comparison.less_equal(5.0, 5.0)
  |> should.be_true()
}

pub fn less_equal_transitivity_test() {
  let a = 1.0
  let b = 2.0
  let c = 3.0
  let ab = comparison.less_equal(a, b)
  let bc = comparison.less_equal(b, c)
  let ac = comparison.less_equal(a, c)

  case ab && bc {
    True -> should.be_true(ac)
    False -> should.be_true(True)
  }
}

// Greater equal tests
pub fn greater_equal_greater_test() {
  comparison.greater_equal(5.0, 3.0)
  |> should.be_true()
}

pub fn greater_equal_equal_test() {
  comparison.greater_equal(7.0, 7.0)
  |> should.be_true()
}

pub fn greater_equal_false_test() {
  comparison.greater_equal(2.0, 10.0)
  |> should.be_false()
}

pub fn greater_equal_reflexivity_test() {
  comparison.greater_equal(5.0, 5.0)
  |> should.be_true()
}

pub fn greater_equal_transitivity_test() {
  let a = 3.0
  let b = 2.0
  let c = 1.0
  let ab = comparison.greater_equal(a, b)
  let bc = comparison.greater_equal(b, c)
  let ac = comparison.greater_equal(a, c)

  case ab && bc {
    True -> should.be_true(ac)
    False -> should.be_true(True)
  }
}
