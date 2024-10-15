defmodule FibonacciElixirTest do
  use ExUnit.Case
  alias FibonacciElixir

  describe "f1/1" do
    test "returns 0 for n = 0" do
      assert FibonacciElixir.f1(0) == 0
    end

    test "returns 1 for n = 1" do
      assert FibonacciElixir.f1(1) == 1
    end

    test "returns 1 for n = 2" do
      assert FibonacciElixir.f1(2) == 1
    end

    test "returns 2 for n = 3" do
      assert FibonacciElixir.f1(3) == 2
    end

    test "returns 3 for n = 4" do
      assert FibonacciElixir.f1(4) == 3
    end

    test "returns 5 for n = 5" do
      assert FibonacciElixir.f1(5) == 5
    end

    test "returns correct value for n = 30" do
      assert FibonacciElixir.f1(30) == 832040
    end

    test "returns correct value for n = 35" do
      assert FibonacciElixir.f1(35) == 9227465
    end

    test "returns correct value for n = 40" do
      assert FibonacciElixir.f1(40) == 102334155
    end

    test "returns correct value for n = 45" do
      assert FibonacciElixir.f1(45) == 1134903170
    end
  end

  describe "f2/1" do
    test "returns 0 for n = 0" do
      assert FibonacciElixir.f2(0) == 0
    end

    test "returns 1 for n = 1" do
      assert FibonacciElixir.f2(1) == 1
    end

    test "returns 1 for n = 2" do
      assert FibonacciElixir.f2(2) == 1
    end

    test "returns 2 for n = 3" do
      assert FibonacciElixir.f2(3) == 2
    end

    test "returns 3 for n = 4" do
      assert FibonacciElixir.f2(4) == 3
    end

    test "returns 5 for n = 5" do
      assert FibonacciElixir.f2(5) == 5
    end

    test "returns correct value for n = 30" do
      assert FibonacciElixir.f2(30) == 832040
    end

    test "returns correct value for n = 35" do
      assert FibonacciElixir.f2(35) == 9227465
    end

    test "returns correct value for n = 40" do
      assert FibonacciElixir.f2(40) == 102334155
    end

    test "returns correct value for n = 45" do
      assert FibonacciElixir.f2(45) == 1134903170
    end
  end

  describe "start/2" do
    test "calculates f1 correctly" do
      assert FibonacciElixir.start("f1", 5) == 5
    end

    test "calculates f2 correctly" do
      assert FibonacciElixir.start("f2", 5) == 5
    end

    test "calculates f1t correctly" do
      assert is_binary(FibonacciElixir.start("f1t", 5))
    end

    test "calculates f2t correctly" do
      assert is_binary(FibonacciElixir.start("f2t", 5))
    end

    test "returns 0 for unknown function" do
      assert FibonacciElixir.start("unknown", 5) == 0
    end
  end
end
