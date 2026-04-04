// SPDX-License-Identifier: PMPL-1.0-or-later

//
// String Kernel — PolyglotFormalisms Common Library (Gleam).
//
// This module implements the string manipulation suite matching the 
// PolyglotFormalisms specification for the Gleam language. It prioritizes 
// Unicode-aware grapheme handling and maintains cross-language consistency.
//
// DESIGN MANDATE:
// -//*0-Based Indexing**: Uses 0-based indices to match Gleam conventions.
// -//*Grapheme Awareness**: Operations like `length` count perceived 
//   characters (e.g. emoji) rather than raw bytes.
// -//*Totality**: Returns safe defaults (empty string, -1 index) for 
//   out-of-bounds requests.
//

import gleam/string

/// CONCATENATION: Merges `a` and `b` into a single string.
///
/// PROPERTIES:
/// - Identity: concat(a, "") == a
/// - Associative: concat(a, concat(b, c)) == concat(concat(a, b), c)
pub fn concat(a: String, b: String) -> String {
  a <> b
}

/// LENGTH: Returns the number of Unicode graphemes in `s`.
pub fn length(s: String) -> Int {
  string.length(s)
}

/// SUBSTRING: Extracts a slice from `start` to `end_pos` (inclusive).
pub fn substring(s: String, start: Int, end_pos: Int) -> String {
  case start > end_pos {
    True -> ""
    False -> string.slice(s, start, end_pos - start + 1)
  }
}

/// EMPTY CHECK: Returns True iff `s` has zero graphemes.
pub fn is_empty(s: String) -> Bool {
  string.is_empty(s)
}

/// TRIM: Removes leading and trailing whitespace from `s`.
pub fn trim(s: String) -> String {
  string.trim(s)
}

/// SPLIT: Splits `s` on every occurrence of `separator`.
///
/// PROPERTIES:
/// - join(split(s, sep), sep) == s (round-trip)
pub fn split(s: String, separator: String) -> List(String) {
  string.split(s, separator)
}

/// JOIN: Concatenates a list of strings with `separator` between each.
pub fn join(parts: List(String), separator: String) -> String {
  string.join(parts, separator)
}

/// REPLACE: Replaces every occurrence of `pattern` in `s` with `replacement`.
pub fn replace(s: String, pattern: String, replacement: String) -> String {
  string.replace(s, each: pattern, with: replacement)
}

/// CONTAINS: Returns True iff `s` contains `substring_str` as a sub-sequence.
pub fn contains(s: String, substring_str: String) -> Bool {
  string.contains(s, substring_str)
}

/// STARTS WITH: Returns True iff `s` begins with `prefix`.
pub fn starts_with(s: String, prefix: String) -> Bool {
  string.starts_with(s, prefix)
}

/// ENDS WITH: Returns True iff `s` ends with `suffix`.
pub fn ends_with(s: String, suffix: String) -> Bool {
  string.ends_with(s, suffix)
}

/// TO UPPERCASE: Converts all alphabetic characters in `s` to uppercase.
pub fn to_uppercase(s: String) -> String {
  string.uppercase(s)
}

/// TO LOWERCASE: Converts all alphabetic characters in `s` to lowercase.
pub fn to_lowercase(s: String) -> String {
  string.lowercase(s)
}

/// INDEX OF: Returns the 0-based index of the first occurrence of `substring_str`,
/// or -1 if not found. Empty substring always returns 0.
pub fn index_of(s: String, substring_str: String) -> Int {
  case substring_str {
    "" -> 0
    _ ->
      case string.split_once(s, substring_str) {
        Ok(#(before, _)) -> string.length(before)
        Error(_) -> -1
      }
  }
}
