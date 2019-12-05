defmodule Aoc19.Day4 do

  def answer_part_one() do
    lower_bound = 284639
    upper_bound = 748759
    lower_bound..upper_bound
    |> Enum.filter(fn num -> matches_criteria(num) end)
    |> Enum.count()
  end

  def answer_part_two() do
    lower_bound = 284639
    upper_bound = 748759
    lower_bound..upper_bound
    |> Enum.filter(fn num -> matches_extra_criteria(num) end)
    |> Enum.count()
  end

  def matches_extra_criteria(input) do
    digits = Integer.digits(input)
    adjacent_pairs_only(digits) && never_decreases(digits)
  end

  def matches_criteria(input) do
    digits = Integer.digits(input)
    has_adjacent_digits(digits) && never_decreases(digits)
  end

  # private

  def adjacent_pairs_only(digits) do
    init = %{prev: nil, current_adj: 1, adj_count: []}
    Enum.reduce(digits, init, fn n, acc -> check_adjacent_pairs(n, acc) end)
    |> finish_accumulator()
    |> Enum.member?(2)
  end

  defp check_adjacent_pairs(next, %{prev: prev, current_adj: adj, adj_count: adj_count}) do
    if next == prev do
      %{prev: next, current_adj: adj + 1, adj_count: adj_count}
    else
      %{prev: next, current_adj: 1, adj_count: [adj| adj_count]}
    end
  end

  defp finish_accumulator(%{current_adj: adj, adj_count: count}) do
    [adj | count]
  end

  defp has_adjacent_digits(digits) do
    {_num, result} = Enum.reduce(digits, {nil, false}, fn n, acc -> check_adjacency(n, acc) end)
    result
  end

  defp check_adjacency(next, {_prev, true}), do: {next, true}

  defp check_adjacency(next, {prev, false}) do
    res = (next == prev)
    {next, res}
  end

  defp never_decreases(digits) do
    {_num, result} = Enum.reduce(digits, {1, true}, fn n, acc -> compare_digits(n, acc) end)
    result
  end

  defp compare_digits(next, {_prev, false}), do: {next, false}

  defp compare_digits(next, {prev, true}) do
    res = (next >= prev)
    {next, res}
  end

end
