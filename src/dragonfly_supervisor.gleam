// SPDX-License-Identifier: PMPL-1.0-or-later
//
// Dragonfly Supervisor — PolyglotFormalisms Common Library (Gleam).
//
// Stub supervisor for Dragonfly (in-memory store compatible with Redis).
// This module demonstrates the OTP supervision pattern. The actual
// process management uses gleam_otp 1.x APIs.
//
// NOTE: This is a scaffold/example. Production usage requires runtime
// configuration of the Dragonfly binary path and port settings.

import gleam/io
import gleam/erlang/process

/// ENTRY POINT: Start the supervision tree for Dragonfly.
///
/// In development, this logs the intent and returns to the caller.
/// Production implementations should start the actual supervisor.
pub fn main() {
  io.println("[Dragonfly Supervisor] Initialising supervision scaffold...")
  // Sleep briefly to demonstrate lifecycle
  process.sleep(10)
  io.println("[Dragonfly Supervisor] Scaffold complete.")
}

/// WORKER: Start the Dragonfly process as a supervised worker.
///
/// Returns Ok(Nil) to signal successful startup to the supervisor.
pub fn start_dragonfly() -> Result(Nil, String) {
  io.println("[Dragonfly Supervisor] Dragonfly worker starting...")
  Ok(Nil)
}
