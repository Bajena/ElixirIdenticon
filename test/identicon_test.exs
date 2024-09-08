defmodule IdenticonTest do
  use ExUnit.Case
  doctest Identicon

  test "builds correct rows for a name" do
    assert Identicon.main("Jan Bajena").rows == [
      [1, 0, 0, 0, 1],
      [0, 1, 0, 1, 0],
      [0, 0, 0, 0, 0],
      [1, 1, 1, 1, 1],
      [1, 0, 1, 0, 1]
    ]
  end
end
