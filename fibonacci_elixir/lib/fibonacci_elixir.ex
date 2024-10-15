defmodule FibonacciElixir do
  def f1(n) do
    cond do
      n == 0 -> 0
      n == 1 -> 1
      true -> f1(n-1) + f1(n-2)
    end
  end

  def f2(n) do
    {0, 1}
    |> Stream.unfold(fn {a, b} -> {a, {b, a + b}} end)
    |> Enum.at(n)
  end

  def start(f, n) do
    cond do
        f == "f1" -> f1(n)
        f == "f2t" -> measure(fn -> f2(n) end)
        f == "f2" -> f2(n)
        f == "f1t" -> measure(fn -> f1(n) end)
        true -> 0
    end
  end

  def measure(function) do
      :erlang.float_to_binary(function |> :timer.tc |> elem(0) |> Kernel./(1_000_000), [decimals: 8])
  end

  def main(argv) do
      start(argv |> List.first, argv |> List.last |> Integer.parse |> elem(0)) |> IO.puts
  end
end
