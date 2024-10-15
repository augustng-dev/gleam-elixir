import gleam/list
import gleam/result
import gleam/string

pub fn f1(n: Int) -> Int {
  case n {
    0 -> 0
    1 -> 1
    _ -> f1(n - 1) + f1(n - 2)
  }
}

pub fn f2(n: Int) -> Int {
  list.unfold({0, 1}, fn (a, b) -> ok(a, (b, a + b)) end)
  |> list.at(n)
  |> result.unwrap(0)
}

pub fn measure(function: fn() -> Int) -> String {
  let start = timer.monotonic();
  let result = function();
  let end = timer.monotonic();
  let elapsed = (end - start) / 1_000_000.0;
  string.from_float(elapsed, precision=8)
}

pub fn start(f: String, n: Int) -> String {
  case f {
    "f1" -> string.from_int(f1(n))
    "f2" -> string.from_int(f2(n))
    "f1t" -> measure(fn() -> f1(n) end)
    "f2t" -> measure(fn() -> f2(n) end)
    _ -> "0"
  }
}

pub fn main() -> Result(String, String) {
  case os.argv() {
    [f, n_str] ->
      case string.to_int(n_str) {
        Ok(n) -> ok(start(f, n))
        Error(_) -> error("Invalid input: n must be an integer")
      }
    _ -> error("Usage: gleam run <f1|f2|f1t|f2t> <n>")
  }
}