defmodule Aoc19.Intcode.Instructions do

  # Opcode 1 / 2
  def basic_maths(operator, pointer, memory) do
    value =
      get_params(pointer, 2, memory)
      |> calculate(operator)
    storage_address = Enum.at(memory, pointer + 3)
    next_pointer = pointer + 4
    new_memory = store(value, storage_address, memory)
    {next_pointer, new_memory}
  end

  def calculate([l, r], :add), do: l + r
  def calculate([l, r], :multiply), do: l * r

  # Opcode 3
  def store_input(pointer, memory) do
    value = retrieve(memory, pointer)
    storage_address = retrieve(memory, pointer + 1)
    next_pointer = pointer + 2
    new_memory = store(value, storage_address, memory)
    {next_pointer, new_memory}
  end

  # Opcode 4
  def output(pointer, memory) do
    output_address = retrieve(memory, pointer)
    Enum.at(memory, output_address)
  end

  # Helpers

  defp get_params(pointer, num_params, memory) do
    get_param_addresses(pointer, num_params, memory)
    |> Enum.map(fn i -> retrieve(memory, i) end)
  end

  defp retrieve(memory, i), do: Enum.at(memory, i)

  defp get_param_addresses(pointer, num_params, memory) do
    Enum.slice(memory, pointer + 1, num_params)
  end

  defp store(value, address, memory) do
    List.replace_at(memory, address, value)
  end
end
