// SPDX-License-Identifier: MPL-2.0
import gleeunit/should
import string_ops

pub fn concat_test() {
  string_ops.concat("Hello", " World")
  |> should.equal("Hello World")

  string_ops.concat("", "test")
  |> should.equal("test")

  string_ops.concat("test", "")
  |> should.equal("test")

  string_ops.concat("a", "b")
  |> should.equal("ab")
}

pub fn concat_associativity_test() {
  let left = string_ops.concat(string_ops.concat("a", "b"), "c")
  let right = string_ops.concat("a", string_ops.concat("b", "c"))
  left
  |> should.equal(right)
}

pub fn concat_identity_test() {
  string_ops.concat("test", "")
  |> should.equal("test")

  string_ops.concat("", "test")
  |> should.equal("test")
}

pub fn length_test() {
  string_ops.length("Hello")
  |> should.equal(5)

  string_ops.length("")
  |> should.equal(0)

  string_ops.length("🎉")
  |> should.equal(1)

  string_ops.length("Test 123")
  |> should.equal(8)
}

pub fn length_non_negative_test() {
  { string_ops.length("") >= 0 }
  |> should.be_true

  { string_ops.length("test") >= 0 }
  |> should.be_true
}

pub fn length_concatenation_property_test() {
  let a = "Hello"
  let b = " World"
  let combined = string_ops.concat(a, b)
  string_ops.length(combined)
  |> should.equal(string_ops.length(a) + string_ops.length(b))
}

pub fn substring_test() {
  string_ops.substring("Hello World", 0, 4)
  |> should.equal("Hello")

  string_ops.substring("Hello World", 6, 10)
  |> should.equal("World")

  string_ops.substring("Test", 0, 0)
  |> should.equal("T")

  string_ops.substring("Test", 2, 1)
  |> should.equal("")
}

pub fn index_of_test() {
  string_ops.index_of("Hello World", "World")
  |> should.equal(6)

  string_ops.index_of("Hello World", "o")
  |> should.equal(4)

  string_ops.index_of("Test", "xyz")
  |> should.equal(-1)

  string_ops.index_of("Test", "")
  |> should.equal(0)
}

pub fn index_of_not_found_test() {
  string_ops.index_of("Hello", "xyz")
  |> should.equal(-1)
}

pub fn index_of_empty_substring_test() {
  string_ops.index_of("Test", "")
  |> should.equal(0)

  string_ops.index_of("", "")
  |> should.equal(0)
}

pub fn contains_test() {
  string_ops.contains("Hello World", "World")
  |> should.be_true

  string_ops.contains("Hello World", "xyz")
  |> should.be_false

  string_ops.contains("Test", "")
  |> should.be_true

  string_ops.contains("", "Test")
  |> should.be_false
}

pub fn contains_empty_substring_test() {
  string_ops.contains("Test", "")
  |> should.be_true

  string_ops.contains("", "")
  |> should.be_true
}

pub fn contains_reflexivity_test() {
  string_ops.contains("Hello", "Hello")
  |> should.be_true
}

pub fn starts_with_test() {
  string_ops.starts_with("Hello World", "Hello")
  |> should.be_true

  string_ops.starts_with("Hello World", "World")
  |> should.be_false

  string_ops.starts_with("Test", "")
  |> should.be_true

  string_ops.starts_with("", "Test")
  |> should.be_false
}

pub fn starts_with_empty_prefix_test() {
  string_ops.starts_with("Test", "")
  |> should.be_true

  string_ops.starts_with("", "")
  |> should.be_true
}

pub fn starts_with_reflexivity_test() {
  string_ops.starts_with("Hello", "Hello")
  |> should.be_true
}

pub fn ends_with_test() {
  string_ops.ends_with("Hello World", "World")
  |> should.be_true

  string_ops.ends_with("Hello World", "Hello")
  |> should.be_false

  string_ops.ends_with("Test", "")
  |> should.be_true

  string_ops.ends_with("", "Test")
  |> should.be_false
}

pub fn ends_with_empty_suffix_test() {
  string_ops.ends_with("Test", "")
  |> should.be_true

  string_ops.ends_with("", "")
  |> should.be_true
}

pub fn ends_with_reflexivity_test() {
  string_ops.ends_with("Hello", "Hello")
  |> should.be_true
}

pub fn to_uppercase_test() {
  string_ops.to_uppercase("Hello World")
  |> should.equal("HELLO WORLD")

  string_ops.to_uppercase("test")
  |> should.equal("TEST")

  string_ops.to_uppercase("TEST")
  |> should.equal("TEST")
}

pub fn to_uppercase_idempotence_test() {
  let once = string_ops.to_uppercase("test")
  let twice = string_ops.to_uppercase(once)
  twice
  |> should.equal(once)
}

pub fn to_lowercase_test() {
  string_ops.to_lowercase("Hello World")
  |> should.equal("hello world")

  string_ops.to_lowercase("TEST")
  |> should.equal("test")

  string_ops.to_lowercase("test")
  |> should.equal("test")
}

pub fn to_lowercase_idempotence_test() {
  let once = string_ops.to_lowercase("TEST")
  let twice = string_ops.to_lowercase(once)
  twice
  |> should.equal(once)
}

pub fn trim_test() {
  string_ops.trim("  Hello World  ")
  |> should.equal("Hello World")

  string_ops.trim("\n\tTest\n")
  |> should.equal("Test")

  string_ops.trim("NoSpaces")
  |> should.equal("NoSpaces")

  string_ops.trim("   ")
  |> should.equal("")
}

pub fn trim_idempotence_test() {
  let once = string_ops.trim("  test  ")
  let twice = string_ops.trim(once)
  twice
  |> should.equal(once)
}

pub fn trim_internal_whitespace_test() {
  string_ops.trim("  Hello World  ")
  |> should.equal("Hello World")
}

pub fn split_test() {
  string_ops.split("a,b,c", ",")
  |> should.equal(["a", "b", "c"])

  string_ops.split("Hello World", " ")
  |> should.equal(["Hello", "World"])

  string_ops.split("test", ",")
  |> should.equal(["test"])

  string_ops.split("a,,b", ",")
  |> should.equal(["a", "", "b"])
}

pub fn split_empty_delimiter_test() {
  string_ops.split("abc", "")
  |> should.equal(["a", "b", "c"])
}

pub fn split_not_found_test() {
  string_ops.split("test", ",")
  |> should.equal(["test"])
}

pub fn join_test() {
  string_ops.join(["a", "b", "c"], ",")
  |> should.equal("a,b,c")

  string_ops.join(["Hello", "World"], " ")
  |> should.equal("Hello World")

  string_ops.join(["test"], ",")
  |> should.equal("test")

  string_ops.join([], ",")
  |> should.equal("")
}

pub fn join_empty_list_test() {
  string_ops.join([], ",")
  |> should.equal("")
}

pub fn join_single_element_test() {
  string_ops.join(["test"], ",")
  |> should.equal("test")
}

pub fn join_inverse_of_split_test() {
  let original = "a,b,c"
  let parts = string_ops.split(original, ",")
  string_ops.join(parts, ",")
  |> should.equal(original)
}

pub fn replace_test() {
  string_ops.replace("Hello World", "World", "Universe")
  |> should.equal("Hello Universe")

  string_ops.replace("test test", "test", "demo")
  |> should.equal("demo demo")

  string_ops.replace("Hello", "xyz", "abc")
  |> should.equal("Hello")

  string_ops.replace("Hello", "l", "")
  |> should.equal("Heo")
}

pub fn replace_not_found_test() {
  string_ops.replace("Hello", "xyz", "abc")
  |> should.equal("Hello")
}

pub fn replace_empty_old_test() {
  string_ops.replace("Hello", "", "x")
  |> should.equal("Hello")
}

pub fn replace_multiple_occurrences_test() {
  string_ops.replace("test test test", "test", "demo")
  |> should.equal("demo demo demo")
}

pub fn is_empty_test() {
  string_ops.is_empty("")
  |> should.be_true

  string_ops.is_empty("test")
  |> should.be_false

  string_ops.is_empty(" ")
  |> should.be_false
}

pub fn is_empty_equivalence_to_length_test() {
  { string_ops.is_empty("") == { string_ops.length("") == 0 } }
  |> should.be_true

  { string_ops.is_empty("test") == { string_ops.length("test") == 0 } }
  |> should.be_true
}
