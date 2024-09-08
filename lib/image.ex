defmodule Identicon.Image do
  defstruct hex: nil, color: nil, name: nil, rows: nil

  def draw(image) do
    canvas = :egd.create(250, 250)
    fill = :egd.color(image.color)

    image.rows
    |> Enum.with_index
    |> Enum.each(fn {row, y} ->
      row
      |> Enum.with_index
      |> Enum.each(fn {cell, x} ->
        if cell == 1 do
          :egd.filledRectangle(canvas, {x * 50, y * 50}, {x * 50 + 50, y * 50 + 50}, fill)
        end
      end)
    end)

    canvas |> :egd.render |> :egd.save("identicon.png")
  end
end
