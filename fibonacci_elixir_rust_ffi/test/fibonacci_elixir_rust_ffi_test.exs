defmodule FibonacciElixirRustFfiTest do
  use ExUnit.Case
  doctest FibonacciElixirRustFfi

  test "calculates Fibonacci numbers correctly" do
    assert FibonacciElixirRustFfi.fibo2(0) == {:ok, 0}
    assert FibonacciElixirRustFfi.fibo2(1) == {:ok, 1}
    assert FibonacciElixirRustFfi.fibo2(10) == {:ok, 55}
    assert FibonacciElixirRustFfi.fibo2(20) == {:ok, 6765}
    assert FibonacciElixirRustFfi.fibo1(0) == {:ok, 0}
    assert FibonacciElixirRustFfi.fibo1(1) == {:ok, 1}
    assert FibonacciElixirRustFfi.fibo1(10) == {:ok, 55}
    assert FibonacciElixirRustFfi.fibo1(20) == {:ok, 6765}
  end

  test "compares Rust and Elixir implementations" do
    n = 45
    {rust_iter_time, {:ok, rust_iter_result}} = :timer.tc(fn -> FibonacciElixirRustFfi.fibo2(n) end)
    {rust_rec_time, {:ok, rust_rec_result}} = :timer.tc(fn -> FibonacciElixirRustFfi.fibo1(n) end)
    {elixir_rec_time, elixir_rec_result} = :timer.tc(fn -> Fibonacci1.fibonacci(n) end)
    {elixir_iter_time, elixir_iter_result} = :timer.tc(fn -> Fibonacci2.fibonacci(n) end)

    IO.puts("Rust Iterative time: #{rust_iter_time} microseconds")
    IO.puts("Rust Recursive time: #{rust_rec_time} microseconds")
    IO.puts("Elixir Iterative time: #{elixir_iter_time} microseconds")
    IO.puts("Elixir Recursive time: #{elixir_rec_time} microseconds")
    IO.puts("Speedup (Rust Recursive vs Elixir Recursive): #{elixir_rec_time / rust_rec_time}x")
    IO.puts("Speedup (Rust Iterative vs Elixir Iterative): #{elixir_iter_time / rust_iter_time}x")
    IO.puts("Speedup (Rust Iterative vs Rust Recursive): #{rust_rec_time / rust_iter_time}x")
    IO.puts("Speedup (Elixir Iterative vs Elixir Recursive): #{elixir_rec_time / elixir_iter_time}x")

    assert rust_iter_result == elixir_rec_result
    assert rust_iter_result == elixir_iter_result
    assert rust_rec_result == elixir_rec_result
    assert rust_rec_result == elixir_iter_result
  end
end
