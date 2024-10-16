import glychee/benchmark
import glychee/configuration

@external(erlang, "Elixir.FibonacciGleamElixirFfi", "f1")
pub fn f1(n: Int) -> Int

@external(erlang, "Elixir.FibonacciGleamElixirFfi", "f2")
pub fn f2(n: Int) -> Int

@external(erlang, "Elixir.FibonacciGleamElixirFfi", "f3")
pub fn f3(n: Int) -> Int

pub fn main() -> Nil {
  configuration.initialize()
  configuration.set_pair(configuration.Warmup, 2)
  configuration.set_pair(configuration.Parallel, 1)
  configuration.set_pair(configuration.Time, 5)
  configuration.set_pair(configuration.MemoryTime, 0)
  configuration.set_pair(configuration.ReductionTime, 0)

  benchmark.run(
    [
      benchmark.Function(label: "f1", callable: fn(test_data) {
        fn() { f1(test_data) }
      }),
      benchmark.Function(label: "f2", callable: fn(test_data) {
        fn() { f2(test_data) }
      }),
      benchmark.Function(label: "f3", callable: fn(test_data) {
        fn() { f3(test_data) }
      }),
    ],
    [benchmark.Data(label: "30", data: 30)],
  )
  // io.println(
  //   "Fib of " <> int.to_string(30) <> " is: " <> int.to_string(fib3(30)),
  // )
}
