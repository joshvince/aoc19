defmodule Aoc19.Day4 do

  def answer_part_one() do
    lower_bound = 284639
    upper_bound = 748759
    lower_bound..upper_bound
    |> Enum.filter(fn num -> matches_criteria(num) end)
    |> Enum.count()
  end

  def matches_criteria(input) do
    digits = Integer.digits(input)
    has_adjacent_digits(digits) && never_decreases(digits)
  end

  # private

  defp has_adjacent_digits(digits) do
    {_num, result} = Enum.reduce(digits, {nil, false}, fn n, acc -> check_adjacency(n, acc) end)
    result
  end

  defp never_decreases(digits) do
    {_num, result} = Enum.reduce(digits, {1, true}, fn n, acc -> compare_digits(n, acc) end)
    result
  end

  defp check_adjacency(next, {_prev, true}), do: {next, true}

  defp check_adjacency(next, {prev, false}) do
    res = (next == prev)
    {next, res}
  end

  defp compare_digits(next, {_prev, false}), do: {next, false}

  defp compare_digits(next, {prev, true}) do
    res = (next >= prev)
    {next, res}
  end

end
