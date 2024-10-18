defmodule ElixirWithGleam do
  @moduledoc """
  Documentation for `ElixirWithGleam`.
  """

  def hello do
    :fibonacci_gleam_elixir_rust_ffi.switch(:fibonacci_gleam_elixir_rust_ffi.greeting())
  end

  def benchmark(n) do
    Benchee.run(%{
      "f1" => fn -> :fibonacci_gleam_elixir_rust_ffi.fib1(n) end,
      "f2" => fn -> :fibonacci_gleam_elixir_rust_ffi.fib2(n) end
    })
  end

  def start(f, n) do
    cond do
        f == "f1" -> :fibonacci_gleam_elixir_rust_ffi.fib1(n)
        f == "f2t" -> measure(fn -> :fibonacci_gleam_elixir_rust_ffi.fib2(n) end)
        f == "f2" -> :fibonacci_gleam_elixir_rust_ffi.fib2(n)
        f == "f1t" -> measure(fn -> :fibonacci_gleam_elixir_rust_ffi.fib1(n) end)
        true -> 0
    end
  end

  def measure(function) do
      :erlang.float_to_binary(function |> :timer.tc |> elem(0) |> Kernel./(1_000_000), [decimals: 8])
  end
end
