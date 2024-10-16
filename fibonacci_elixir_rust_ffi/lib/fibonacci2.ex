defmodule Fibonacci2 do
  def fibonacci(n) do
    {0, 1}
    |> Stream.unfold(fn {a, b} -> {a, {b, a + b}} end)
    |> Enum.at(n)
  end
end
