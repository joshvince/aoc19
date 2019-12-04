defmodule Aoc19.Day2 do
  alias Aoc19.Day2.Input

  def answer_part_one do
    Input.fetch()
    |> solve_part_one()
    |> Enum.at(0)
  end

  def answer_part_two do
    Input.fetch()
    |> solve_part_two
  end

  def solve_part_one(input) do
    compute_instructions(input)
  end

  def solve_part_two(input) do
    test_noun_verb(input, 0, 0)
  end

  ## Private functions


  # if you get to 100 in the verb, try a different combination starting with the next noun and the first verb
  defp test_noun_verb(input, noun, 100) do
    test_noun_verb(input, noun+1, 0)
  end

  # terminate if you find the correct output and return the answer
  defp test_noun_verb(input, noun, verb) do
    new_instructions = inject_inputs(input, noun, verb)
    [output | _rest] = compute_instructions(new_instructions)
    case output do
      19690720 -> noun * 100 + verb
      _anything_else -> test_noun_verb(input, noun, verb+1)
    end
  end

  defp inject_inputs([output, _prev_noun, _prev_verb | instructions], noun, verb) do
    [output, noun, verb | instructions]
  end

  defp compute_instructions(input) do
    process(input, 0)
  end

  defp process(list, pos) do
    operation = Enum.at(list, pos)
    case operation do
      1 -> update(list, &add/3, pos)
      2 -> update(list, &multiply/3, pos)
      99 -> list
    end
  end

  defp update(list, operation, pos) do
    store_at = Enum.at(list,pos+3)
    l = Enum.at(list, pos+1)
    r = Enum.at(list, pos+2)

    operation.(l, r, list)
    |> store(store_at, list)
    |> process(pos+4)
  end

  defp add(l,r, list), do: Enum.at(list,l) + Enum.at(list,r)
  defp multiply(l,r, list), do: Enum.at(list,l) * Enum.at(list,r)

  defp store(new_val, store_at, list), do: List.replace_at(list, store_at, new_val)

end
