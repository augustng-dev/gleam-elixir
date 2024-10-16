# NIF for Elixir.FibonacciElixirRustFfi

## To build the NIF module:

- Your NIF will now build along with your project.

## To load the NIF:

```elixir
defmodule FibonacciElixirRustFfi do
  use Rustler, otp_app: :fibonacci_elixir_rust_ffi, crate: "fibonacci_elixir_rust_ffi"

  # When your NIF is loaded, it will override this function.
  def add(_a, _b), do: :erlang.nif_error(:nif_not_loaded)
end
```

## Examples

[This](https://github.com/rusterlium/NifIo) is a complete example of a NIF written in Rust.
