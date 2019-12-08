defmodule Aoc19.Intcode do
  alias Aoc19.Intcode.Instructions

  def run(instruction) do
    process_next_address({0, instruction})
  end

  defp process_next_address({address, memory}) do
    instruction_pointer = Enum.at(memory, address)
    process_instruction(instruction_pointer, address, memory)
  end

  defp process_instruction(99, _pointer, memory) do
    memory
  end

  defp process_instruction(2, pointer, memory) do
    Instructions.basic_maths(:multiply, pointer, memory)
    |> process_next_address()
  end

  defp process_instruction(1, pointer, memory) do
    Instructions.basic_maths(:add, pointer, memory)
    |> process_next_address()
  end

  defp process_instruction(3, pointer, memory) do
    Instructions.store_input(pointer, memory)
    |> process_next_address()
  end

  defp process_instruction(4, pointer, memory) do
    Instructions.output(pointer, memory)
  end

end
