defmodule Identicon do
  def main(name) do
    %Identicon.Image{name: name}
      |> get_color
      |> hash_input
      |> build_rows
  end

  def build_rows(image) do
    rows = image.hex |> Enum.map(&(&1 |> rem(2))) |> Enum.chunk_every(3) |> Enum.map(&mirror_row/1)

    %Identicon.Image{image | rows: rows}
  end

  def mirror_row(row) do
    [e1, e2, e3] = row

    [e1, e2, e3, e2, e1]
  end

  def get_color(image) do
    %Identicon.Image{image | color: {255, 0, 0}}
  end

  def hash_input(image) do
    hex = :crypto.hash(:md5, image.name) |> :binary.bin_to_list |> Enum.take(15)

    %Identicon.Image{image | hex: hex}
  end
end
