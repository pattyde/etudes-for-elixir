defmodule Geom do
  @moduledoc """
  Calculates the area of a geometric shape
  """

  @doc """
  Calculates the area of a rectangle, triangle, or ellipse given the name of
  the shape and two measurements as a tuple. Only accepts measurements that are
  greater than or equal to zero. Will return zero if any invalid measurements
  are provided

  Returns: area or 0
  """
  def area({shape, dimension_one, dimension_two}) do
    area(shape, dimension_one, dimension_two)
  end

  # Private functions to calculate area of each geometric shape

  defp area(:rectangle, length, width) when length >= 0 and width >= 0 do
    length * width
  end

  defp area(:triangle, base, height) when base >= 0 and height >= 0 do
    base * height / 2.0
  end

  defp area(:ellipse, x, y) when x >= 0 and y >= 0 do
    :math.pi() * x * y
  end

  defp area(_, _, _) do
    0
  end
end
