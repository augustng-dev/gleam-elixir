defmodule FibonacciElixirRustFfi do
  use Rustler, otp_app: :fibonacci_elixir_rust_ffi, crate: "fibonacci_elixir_rust_ffi"

  # Function that will be implemented in Rust.
  # Returns {:ok, result} on success, {:error, error_message} on failure.
  def fibo1(_n), do: :erlang.nif_error(:nif_not_loaded)
  def fibo2(_n), do: :erlang.nif_error(:nif_not_loaded)
end
