defmodule Hexer.Hex do
  def print(text) when is_binary(text) do
    :binary.bin_to_list(text)
    |> Enum.map(fn x -> "0x#{:io_lib.format("~2.16.0B", [x])}" end)
    |> Enum.chunk_every(16)
    |> Enum.map(fn line -> Enum.join(line, ", ") end)
    |> Enum.join("\n")
  end

  def print(text), do: "Unable to format: #{inspect text} as it isn't a binary"
end
