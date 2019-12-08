defmodule Aoc19.IntcodeTest do
  use ExUnit.Case
  alias Aoc19.Intcode

  describe "Calculates Opcode 1" do
    test "first test case" do
      input = [1, 0, 0, 0, 99]
      assert Intcode.run(input) == [2, 0, 0, 0, 99]
    end

    test "third test case" do
      input = [2, 4, 4, 5, 99, 0]
      assert Intcode.run(input) == [2, 4, 4, 5, 99, 9801]
    end
  end

  describe "Calculates Opcode 2" do
    test "second test case" do
      input = [2, 3, 0, 3, 99]
      assert Intcode.run(input) == [2, 3, 0, 6, 99]
    end

    test "fourth test case" do
      input = [1, 1, 1, 4, 99, 5, 6, 0, 99]
      assert Intcode.run(input) == [30, 1, 1, 4, 2, 5, 6, 0, 99]
    end
  end

  describe "Calculates Opcode 3" do

  end

  describe "Calculates Opcode 4" do

  end
end
