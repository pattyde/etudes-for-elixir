defmodule Geom do
  @@moduledoc """
  Calculates the area of a geometric shape
  """

  @@doc """
  Calculates the area of a square or rectangle given the length and height. The
  default for both arguments is 1

  Returns: area

  ## Example

    iex> Geom.area(3, 4)
    12

    iex> Geom.area()
    1

  """
  def area(l \\ 1, w \\ 1) do
    l * w
  end
end
