defmodule Day2Test do
  use ExUnit.Case
  alias Aoc19.Day2

  describe "Part One" do
    test "Solves first test" do
      input = [1,0,0,0,99]
      assert Day2.solve_part_one(input) == [2,0,0,0,99]
    end

    test "Solves second test" do
      input = [2,3,0,3,99]
      assert Day2.solve_part_one(input) == [2,3,0,6,99]
    end

    test "Solves third test" do
      input = [2,4,4,5,99,0]
      assert Day2.solve_part_one(input) == [2,4,4,5,99,9801]
    end

    test "Solves fourth test" do
      input = [1,1,1,4,99,5,6,0,99]
      assert Day2.solve_part_one(input) == [30,1,1,4,2,5,6,0,99]
    end
  end
end
