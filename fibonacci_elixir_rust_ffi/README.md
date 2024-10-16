# FibonacciElixirRustFfi

## recursive if-else

| v | # | 30 | 35 | 40 | 45 |
| --- | --- | --- | --- | --- | --- |
| 1.12.2 | [Elixir](./fibo.ex) (compiled) | 0.00387900 | 0.04201500 | 0.39719000 | 4.80324000 |

## optimization

| v | # | 30 | 35 | 40 | 45 |
| --- | --- | --- | --- | --- | --- |
| 1.12.2 | [Elixir](./lib/fibonacci_elixir.ex) (compiled) | 0.00000400 | 0.00000400 | 0.00000300 | 0.00003000 |

## run

```
iex -S mix
FibonacciElixirRustFfi.start("f1", 30)
FibonacciElixirRustFfi.start("f1t", 30)
FibonacciElixirRustFfi.start("f2", 30)
FibonacciElixirRustFfi.start("f2t", 30)
FibonacciElixirRustFfi.benchmark(30)
```