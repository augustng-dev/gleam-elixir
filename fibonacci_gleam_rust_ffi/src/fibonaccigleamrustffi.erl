-module(fibonaccigleamrustffi).
-export([fibo1/1, fibo2/1]).
-nifs([fibo1/1, fibo2/1]).
-on_load(init/0).

init() ->
    ok = erlang:load_nif("./priv/fibonacci_gleam_rust_ffi", 0).

fibo1(_N) ->
    erlang:nif_error("NIF library not loaded").

fibo2(_N) ->
    erlang:nif_error("NIF library not loaded").