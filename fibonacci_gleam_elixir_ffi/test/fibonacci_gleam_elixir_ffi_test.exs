defmodule FibonacciGleamElixirFfiTest do
  use ExUnit.Case
  doctest FibonacciGleamElixirFfi

  test "greets the world" do
    assert FibonacciGleamElixirFfi.hello() == :world
  end
end
