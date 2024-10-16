use rustler::{init, nif};

#[nif]
fn fibo1(n: u64) -> u64 {
    fn fib(n: u64) -> u64 {
        match n {
            0 => 0,
            1 => 1,
            _ => fib(n - 1) + fib(n - 2),
        }
    }
    fib(n)
}

#[nif]
fn fibo2(n: u64) -> u64 {
    let result = match n {
        0 => 0,
        1 => 1,
        _ => {
            let mut a = 0;
            let mut b = 1;
            for _ in 2..=n {
                let temp = a + b;
                a = b;
                b = temp;
            }
            b
        }
    };
    result
}

init!("fibonaccigleamrustffi");
