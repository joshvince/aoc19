defmodule Aoc19.Day2 do
  alias Aoc19.Day2.Input

  def answer_part_one do
    Input.fetch()
    |> solve_part_one()
    |> Enum.at(0)
  end

  def solve_part_one(input) do
    process(input, 0)
  end

  ## Private functions

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
