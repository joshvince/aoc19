defmodule Aoc19.Day1 do
  alias Aoc19.Day1.Input

  def answer_part_one() do
    Input.fetch()
    |> Enum.map(&solve_part_one(&1))
    |> Enum.sum()
  end

  def answer_part_two() do
    Input.fetch()
    |>Enum.map(&solve_part_two(&1))
    |> Enum.sum()
  end

  @spec solve_part_one(integer) :: integer
  def solve_part_one(input) do
    mass_to_fuel(input)
  end

  @spec solve_part_two(integer) :: integer
  def solve_part_two(input) do
    calculate_fuel(0, mass_to_fuel(input))
  end

  # Private Functions

  defp calculate_fuel(total, last_mass) when last_mass <= 0 do
    total
  end

  defp calculate_fuel(total, last_mass) do
    new_total = total + last_mass
    new_fuel = mass_to_fuel(last_mass)
    calculate_fuel(new_total, new_fuel)
  end

  defp mass_to_fuel(mass) do
    (div(mass, 3)) - 2
  end


end
