defmodule FibonacciGleamElixirFfi do
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

  def fib_acc(target, n, f_minus_1, f_minus_2) do
    sum = f_minus_1 + f_minus_2
    cond do
      n == target -> sum
      true -> fib_acc(target, n + 1, sum, f_minus_1)
    end
  end

  def f3(n) do
    cond do
      n == 0 -> 0
      n == 1 -> 1
      true -> f1(n-1) + f1(n-2)
    end
  end

  def benchmark(n) do
    Benchee.run(%{
      "f1" => fn -> f1(n) end,
      "f2" => fn -> f2(n) end,
      "f3" => fn -> f3(n) end
    })
  end

  def start(f, n) do
    cond do
        f == "f1" -> f1(n)
        f == "f1t" -> measure(fn -> f1(n) end)
        f == "f2" -> f2(n)
        f == "f2t" -> measure(fn -> f2(n) end)
        f == "f3" -> f3(n)
        f == "f3t" -> measure(fn -> f3(n) end)
        true -> 0
    end
  end

  def measure(function) do
      :erlang.float_to_binary(function |> :timer.tc |> elem(0) |> Kernel./(1_000_000), [decimals: 8])
  end
end
