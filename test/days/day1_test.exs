defmodule Day1Test do
  use ExUnit.Case
  import Aoc19.Day1
  alias Aoc19.Day1

  describe "Part One" do
    test "solves test input #1" do
      assert Day1.solve_part_one(12) == 2
    end

    test "solves test input #2" do
      assert Day1.solve_part_one(14) == 2
    end

    test "solves test input #3" do
      assert Day1.solve_part_one(1969) == 654
    end

    test "solves test input #4" do
      assert Day1.solve_part_one(100_756) == 33583
    end
  end

  describe "Part Two" do
    test "solves test input #1" do
      assert Day1.solve_part_two(14) == 2
    end

    test "solves test input #2" do
      assert Day1.solve_part_two(1969) == 966
    end

    test "solves test input #3" do
      assert Day1.solve_part_two(100_756) == 50346
    end
  end
end
