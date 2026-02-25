// SPDX-License-Identifier: PMPL-1.0-or-later

import gleam/erlang/process
import gleam/otp/supervisor
import gleam/erlang/port
import gleam/io

pub fn main() {
  let children = fn(children) {
    children
    |> supervisor.add(supervisor.worker(fn(_) { start_dragonfly() }))
  }

  io.println("[Dragonfly Supervisor] Starting Gleam/OTP supervision tree...")
  
  let assert Ok(_) = supervisor.start(children)
  
  // Keep the main process alive
  process.sleep_forever()
}

fn start_dragonfly() {
  io.println("[Dragonfly Supervisor] Spawning Dragonfly process...")
  
  // We use the full path to the dragonfly binary installed via asdf
  let dragonfly_path = "/home/hyper/.asdf/installs/dragonfly/1.36.0/bin/dragonfly"
  
  // Start dragonfly as a port. 
  // If it crashes, the supervisor will restart this worker.
  let p = port.open_program(
    dragonfly_path,
    ["--port", "6379", "--logtostderr", "--alsologtostderr"]
  )
  
  // Return the port as the "state" of the worker
  Ok(p)
}
