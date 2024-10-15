# FibonacciElixir

## recursive if-else

| v | # | 30 | 35 | 40 | 45 |
| --- | --- | --- | --- | --- | --- |
| 1.12.2 | [Elixir](./fibo.ex) (compiled) | 0.04940300 | 0.16671900 | 1.75396000 | 21.32343600 |

## optimization

| v | # | 30 | 35 | 40 | 45 |
| --- | --- | --- | --- | --- | --- |
| 1.12.2 | [Elixir](./lib/fibonacci_elixir.ex) (compiled) | 0.06485200 | 0.02042700 | 0.03491300 | 0.02693800 |

## run

```
mix escript.build
time ./fibonacci_elixir f1 30
time ./fibonacci_elixir f1t 30
time ./fibonacci_elixir f2 30
time ./fibonacci_elixir f2t 30
```