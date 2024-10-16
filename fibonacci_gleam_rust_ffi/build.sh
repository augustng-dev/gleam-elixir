#!/bin/bash
(cd native/fibonacci_gleam_rust_ffi && cargo build --release)

gleam build