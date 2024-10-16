// import gleam/int
// import gleam/io
import gleam/list

import glychee/benchmark
import glychee/configuration

pub fn fib1(num: Int) -> Int {
  case num {
    0 -> 0
    1 -> 1
    _ -> fib1(num - 1) + fib1(num - 2)
  }
}

pub fn fib2(num: Int) -> Int {
  case num {
    0 -> 0
    1 -> 1
    _ -> {
      list.fold(list.range(2, num), 0, fn(a, b) { a + b })
    }
  }
}

fn fib_acc(target, n, f_minus_1, f_minus_2) {
  let sum = f_minus_1 + f_minus_2
  case n {
    _ if n == target -> sum
    _ -> fib_acc(target, n + 1, sum, f_minus_1)
  }
}

pub fn fib3(n) {
  case n {
    0 -> 0
    1 -> 1
    _ -> fib_acc(n, 2, 1, 0)
  }
}

pub fn main() -> Nil {
  configuration.initialize()
  configuration.set_pair(configuration.Warmup, 2)
  configuration.set_pair(configuration.Parallel, 1)
  configuration.set_pair(configuration.Time, 5)
  configuration.set_pair(configuration.MemoryTime, 0)
  configuration.set_pair(configuration.ReductionTime, 0)

  benchmark.run(
    [
      benchmark.Function(label: "fib1", callable: fn(test_data) {
        fn() { fib1(test_data) }
      }),
      benchmark.Function(label: "fib3", callable: fn(test_data) {
        fn() { fib3(test_data) }
      }),
    ],
    [benchmark.Data(label: "30", data: 30)],
  )
  // io.println(
  //   "Fib of " <> int.to_string(30) <> " is: " <> int.to_string(fib3(30)),
  // )
}
