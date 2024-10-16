import glychee/benchmark
import glychee/configuration

@external(erlang, "Elixir.FibonacciGleamElixirRustFfi", "fibo1")
pub fn fibo1(n: Int) -> Int

@external(erlang, "Elixir.FibonacciGleamElixirRustFfi", "fibo2")
pub fn fibo2(n: Int) -> Int

pub fn main() -> Nil {
  configuration.initialize()
  configuration.set_pair(configuration.Warmup, 2)
  configuration.set_pair(configuration.Parallel, 1)
  configuration.set_pair(configuration.Time, 5)
  configuration.set_pair(configuration.MemoryTime, 0)
  configuration.set_pair(configuration.ReductionTime, 0)

  benchmark.run(
    [
      benchmark.Function(label: "fibo1", callable: fn(test_data) {
        fn() { fibo1(test_data) }
      }),
      benchmark.Function(label: "fibo2", callable: fn(test_data) {
        fn() { fibo2(test_data) }
      }),
    ],
    [benchmark.Data(label: "30", data: 30)],
  )
  // io.println(
  //   "Fib of " <> int.to_string(30) <> " is: " <> int.to_string(fib3(30)),
  // )
}
