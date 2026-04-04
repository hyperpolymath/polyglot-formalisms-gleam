// SPDX-License-Identifier: MPL-2.0
// (PMPL-1.0-or-later preferred; MPL-2.0 required for Hex.pm)
//
// Performance baseline benchmarks for PolyglotFormalisms Gleam library.
// Uses Erlang's monotonic clock for timing measurements.
// These are "should complete quickly" tests — they fail if operations
// take longer than a generous threshold (10x expected), not true benchmarks.

import gleeunit/should
import arithmetic
import comparison
import string_ops

@external(erlang, "erlang", "monotonic_time")
fn monotonic_ns() -> Int

fn elapsed_ns(start: Int) -> Int {
  monotonic_ns() - start
}

// One million nanoseconds = 1ms threshold per 1000 iterations
const max_ns_per_1000 = 10_000_000

pub fn bench_arithmetic_add_1000_test() {
  let start = monotonic_ns()
  repeat(1000, fn() { arithmetic.add(1.0, 2.0) })
  let elapsed = elapsed_ns(start)
  // Should complete 1000 adds in under 10ms
  should.be_true(elapsed < max_ns_per_1000)
}

pub fn bench_arithmetic_multiply_1000_test() {
  let start = monotonic_ns()
  repeat(1000, fn() { arithmetic.multiply(3.14, 2.71) })
  let elapsed = elapsed_ns(start)
  should.be_true(elapsed < max_ns_per_1000)
}

pub fn bench_comparison_less_than_1000_test() {
  let start = monotonic_ns()
  repeat(1000, fn() { comparison.less_than(1.0, 2.0) })
  let elapsed = elapsed_ns(start)
  should.be_true(elapsed < max_ns_per_1000)
}

pub fn bench_string_concat_1000_test() {
  let start = monotonic_ns()
  repeat(1000, fn() { string_ops.concat("hello", " world") })
  let elapsed = elapsed_ns(start)
  should.be_true(elapsed < max_ns_per_1000)
}

pub fn bench_string_length_1000_test() {
  let start = monotonic_ns()
  repeat(1000, fn() { string_ops.length("Hello, PolyglotFormalisms!") })
  let elapsed = elapsed_ns(start)
  should.be_true(elapsed < max_ns_per_1000)
}

pub fn bench_string_trim_1000_test() {
  let start = monotonic_ns()
  repeat(1000, fn() { string_ops.trim("  hello world  ") })
  let elapsed = elapsed_ns(start)
  should.be_true(elapsed < max_ns_per_1000)
}

pub fn bench_string_split_1000_test() {
  let start = monotonic_ns()
  repeat(1000, fn() { string_ops.split("a,b,c,d,e", ",") })
  let elapsed = elapsed_ns(start)
  should.be_true(elapsed < max_ns_per_1000)
}

pub fn bench_string_contains_1000_test() {
  let start = monotonic_ns()
  repeat(1000, fn() { string_ops.contains("Hello, World!", "World") })
  let elapsed = elapsed_ns(start)
  should.be_true(elapsed < max_ns_per_1000)
}

fn repeat(n: Int, f: fn() -> a) -> Nil {
  case n {
    0 -> Nil
    _ -> {
      f()
      repeat(n - 1, f)
    }
  }
}
