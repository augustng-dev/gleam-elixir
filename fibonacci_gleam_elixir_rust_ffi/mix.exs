defmodule FibonacciGleamElixirRustFfi.MixProject do
  use Mix.Project

  @app :fibonacci_gleam_elixir_rust_ffi
  @version "0.1.0"

  def project do
    [
      app: @app,
      version: @version,
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Gleam compilation config
      # compilers: [:gleam] ++ [:rustler] ++ Mix.compilers(),
      compilers: [:gleam | Mix.compilers()],
      archives: [mix_gleam: "~> 0.6"],
      aliases: ["deps.get": ["deps.get", "gleam.deps.get"]],
      # erlc_paths: ["src", "gen"],
      erlc_paths: [
        "build/dev/erlang/#{@app}/_gleam_artefacts",
        "build/dev/erlang/#{@app}/build"
      ],
      erlc_include_path: "build/dev/erlang/#{@app}/include",
      prune_code_paths: false,
      rustler_crates: fibonacci_gleam_elixir_rust_ffi()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:mix_gleam, "~> 0.6.2"},
      {:rustler, "~> 0.34.0"},
      {:benchee, "~> 1.3", only: [:dev, :test], runtime: false},
      {:gleam_stdlib, "~> 0.34.0 or ~> 2.0.0"},
      {:gleeunit, "~> 1.0.0 or ~> 2.0.0", only: [:dev, :test], runtime: false},
      {:glychee, "~> 1.1", only: [:dev, :test], runtime: false}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  # defp rustc_mode(:prod), do: :release
  # defp rustc_mode(_), do: :debug

  defp fibonacci_gleam_elixir_rust_ffi do
    [
      fibonacci_gleam_elixir_rust_ffi: [
        path: "native/fibonacci_gleam_elixir_rust_ffi",
        # mode: rustc_mode(Mix.env),
        mode: (if Mix.env() == :prod, do: :release, else: :debug)
      ]
    ]
  end
end
