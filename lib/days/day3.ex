defmodule Aoc19.Day3 do
  alias Aoc19.Day3.Input

  def answer_part_one do
    Input.fetch()
    |> solve_part_one
  end

  def solve_part_one(input) do
    Enum.map(input, &compute_one_wire&1)
    |> find_crossover_points()
    |> Enum.map(&calculate_manhattan_distance&1)
    |> shortest_manhattan_distance()
  end

  # private

  defp compute_one_wire(direction_list) do
    direction_list
    |> Enum.reduce([{0,0}], fn dir, acc -> move(dir, acc) end)
  end

  defp move({"U", val}, [{last_x, last_y} | _tail] = coords) do
    stop_y = last_y + val
    new_coords = track_route(:y, {last_x, last_y}, stop_y)
    [new_coords | coords] |> List.flatten()
  end

  defp move({"D", val}, [{last_x, last_y} | _tail] = coords) do
    stop_y = last_y - val
    new_coords = track_route(:y, {last_x, last_y}, stop_y)
    [new_coords | coords] |> List.flatten()
  end

  defp move({"L", val}, [{last_x, last_y} | _tail] = coords) do
    stop_x = last_x - val
    new_coords = track_route(:x, {last_x, last_y}, stop_x)
    [new_coords | coords] |> List.flatten()
  end

  defp move({"R", val}, [{last_x, last_y} | _tail] = coords) do
    stop_x = last_x + val
    new_coords = track_route(:x, {last_x, last_y}, stop_x)
    [new_coords | coords] |> List.flatten()
  end

  defp track_route(:x, {start_x, y}, stop_x) do
    stop_x..start_x
    |> Enum.map(fn new_x -> {new_x, y} end)
  end

  defp track_route(:y, {x, start_y}, stop_y) do
    stop_y..start_y
    |> Enum.map(fn new_y -> {x, new_y} end)
  end

  defp find_crossover_points([first, second]) do
    first
    |> Enum.filter(fn coord -> Enum.member?(second, coord) end)
    |> Enum.reject(fn {x,y} -> x == 0 && y == 0 end)
  end

  defp calculate_manhattan_distance({x,y}), do: distance_from_zero(x) + distance_from_zero(y)

  defp distance_from_zero(num) when num < 0, do: 0 - num
  defp distance_from_zero(num) when num >= 0, do: 0 + num

  defp shortest_manhattan_distance(coords_list) do
    [first | _rest] = Enum.sort(coords_list)
    first
  end

end
