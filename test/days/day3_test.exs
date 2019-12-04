defmodule Day3Test do
  use ExUnit.Case
  alias Aoc19.Day3

  describe "Part One" do
    test "Solves first test case" do
      input = Day3.Input.parse(["R8,U5,L5,D3","U7,R6,D4,L4"])
      assert Day3.solve_part_one(input) == 6
    end

    test "Solves second test case" do
      input = Day3.Input.parse(["R75,D30,R83,U83,L12,D49,R71,U7,L72","U62,R66,U55,R34,D71,R55,D58,R83"])
      assert Day3.solve_part_one(input) == 159
    end

    test "Solves third test case" do
      input = Day3.Input.parse(["R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51","U98,R91,D20,R16,D67,R40,U7,R15,U6,R7"])
      assert Day3.solve_part_one(input) == 135
    end
  end
end
