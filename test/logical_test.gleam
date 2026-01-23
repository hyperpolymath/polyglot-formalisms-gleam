// SPDX-License-Identifier: PMPL-1.0-or-later
import gleeunit/should
import logical

// And tests
pub fn and_true_true_test() {
  logical.and(True, True)
  |> should.be_true()
}

pub fn and_true_false_test() {
  logical.and(True, False)
  |> should.be_false()
}

pub fn and_false_true_test() {
  logical.and(False, True)
  |> should.be_false()
}

pub fn and_false_false_test() {
  logical.and(False, False)
  |> should.be_false()
}

pub fn and_commutativity_test() {
  logical.and(True, False)
  |> should.equal(logical.and(False, True))
}

pub fn and_associativity_test() {
  logical.and(logical.and(True, True), False)
  |> should.equal(logical.and(True, logical.and(True, False)))
}

pub fn and_identity_true_test() {
  logical.and(True, True)
  |> should.equal(True)
}

pub fn and_identity_false_test() {
  logical.and(False, True)
  |> should.equal(False)
}

pub fn and_annihilator_test() {
  logical.and(True, False)
  |> should.equal(False)
}

pub fn and_idempotence_true_test() {
  logical.and(True, True)
  |> should.equal(True)
}

pub fn and_idempotence_false_test() {
  logical.and(False, False)
  |> should.equal(False)
}

// Or tests
pub fn or_true_true_test() {
  logical.or(True, True)
  |> should.be_true()
}

pub fn or_true_false_test() {
  logical.or(True, False)
  |> should.be_true()
}

pub fn or_false_true_test() {
  logical.or(False, True)
  |> should.be_true()
}

pub fn or_false_false_test() {
  logical.or(False, False)
  |> should.be_false()
}

pub fn or_commutativity_test() {
  logical.or(True, False)
  |> should.equal(logical.or(False, True))
}

pub fn or_associativity_test() {
  logical.or(logical.or(False, False), True)
  |> should.equal(logical.or(False, logical.or(False, True)))
}

pub fn or_identity_true_test() {
  logical.or(True, False)
  |> should.equal(True)
}

pub fn or_identity_false_test() {
  logical.or(False, False)
  |> should.equal(False)
}

pub fn or_annihilator_true_test() {
  logical.or(True, True)
  |> should.equal(True)
}

pub fn or_annihilator_false_test() {
  logical.or(False, True)
  |> should.equal(True)
}

pub fn or_idempotence_true_test() {
  logical.or(True, True)
  |> should.equal(True)
}

pub fn or_idempotence_false_test() {
  logical.or(False, False)
  |> should.equal(False)
}

// Not tests
pub fn not_true_test() {
  logical.not(True)
  |> should.be_false()
}

pub fn not_false_test() {
  logical.not(False)
  |> should.be_true()
}

pub fn not_involution_true_test() {
  logical.not(logical.not(True))
  |> should.equal(True)
}

pub fn not_involution_false_test() {
  logical.not(logical.not(False))
  |> should.equal(False)
}

pub fn not_excluded_middle_true_test() {
  logical.or(True, logical.not(True))
  |> should.be_true()
}

pub fn not_excluded_middle_false_test() {
  logical.or(False, logical.not(False))
  |> should.be_true()
}

pub fn not_contradiction_true_test() {
  logical.and(True, logical.not(True))
  |> should.be_false()
}

pub fn not_contradiction_false_test() {
  logical.and(False, logical.not(False))
  |> should.be_false()
}

pub fn not_demorgan_and_test() {
  let a = True
  let b = False
  logical.not(logical.and(a, b))
  |> should.equal(logical.or(logical.not(a), logical.not(b)))
}

pub fn not_demorgan_or_test() {
  let a = True
  let b = False
  logical.not(logical.or(a, b))
  |> should.equal(logical.and(logical.not(a), logical.not(b)))
}
