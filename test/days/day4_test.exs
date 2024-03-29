defmodule Day4Test do
  use ExUnit.Case
  alias Aoc19.Day4

  describe "Part One" do
    test "Solves first test case" do
      assert Day4.matches_criteria(111111)
    end

    test "Solves second test case" do
      refute Day4.matches_criteria(223450)
    end

    test "Solves third test case" do
      refute Day4.matches_criteria(123789)
    end
  end

  describe "Part Two" do
    test "Solves first test case" do
      assert Day4.matches_extra_criteria(112233)
    end

    test "Solves second test case" do
      refute Day4.matches_extra_criteria(123444)
    end

    test "Solves third test case" do
      assert Day4.matches_extra_criteria(111122)
    end
  end
end
