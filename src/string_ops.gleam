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

// ... [Remaining string operations: index_of, contains, starts_with, etc.]
pub fn is_empty(s: String) -> Bool {
  string.is_empty(s)
}
