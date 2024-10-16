defmodule FibonacciGleamElixirRustFfi do
  use Rustler, otp_app: :fibonacci_gleam_elixir_rust_ffi, crate: "fibonacci_gleam_elixir_rust_ffi"

  # Function that will be implemented in Rust.
  # Returns {:ok, result} on success, {:error, error_message} on failure.
  def fibo1(_n), do: :erlang.nif_error(:nif_not_loaded)
  def fibo2(_n), do: :erlang.nif_error(:nif_not_loaded)

  def benchmark(n) do
    Benchee.run(%{
      "f1" => fn -> fibo1(n) end,
      "f2" => fn -> fibo2(n) end
    })
  end

  def start(f, n) do
    cond do
        f == "f1" -> fibo1(n)
        f == "f2t" -> measure(fn -> fibo2(n) end)
        f == "f2" -> fibo2(n)
        f == "f1t" -> measure(fn -> fibo1(n) end)
        true -> 0
    end
  end

  def measure(function) do
      :erlang.float_to_binary(function |> :timer.tc |> elem(0) |> Kernel./(1_000_000), [decimals: 8])
  end
end
