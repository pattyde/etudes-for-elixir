defmodule Geom do
  @moduledoc """
  Calculates the area of a geometric shape
  """

  @doc """
  Calculates the area of a rectangle, triangle, or ellipse given the name of
  the shape and two measurements. Only accepts measurements that are
  greater than or equal to zero.

  Returns: area
  """
  def area(shape, dim_one, dim_two) when dim_one >= 0 and dim_two >= 0 do
    case shape do
      :rectangle -> dim_one * dim_two
      :triangle -> dim_one * dim_two / 2.0
      :ellipse -> :math.pi() * dim_one * dim_two
    end
  end
end
