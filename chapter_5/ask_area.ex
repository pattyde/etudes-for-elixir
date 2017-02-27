defmodule AskArea do

  @moduledoc """
  Gathers required information for the calculation of the area of a geometric
  shape

  Includes basic validation for unknown shapes and invalid dimentions
  """
  @doc """
  Requests the first character of a shape and returns the shape as an atom.

  Requests two dimensions for the shape to calculare its area.

  If a shape is unknown, the unknown character will be assigned to the first
  dimension
  """
  @spec area() :: number()

  def area() do
    user_input = IO.gets("(R)ectangle, (T)riangle, or (E)llipse? > ")
    shape = char_to_shape(String.first(user_input))

    {dim_one, dim_two} = case shape do
      :rectangle -> get_dimensions("width", "height")
      :triangle -> get_dimensions("base", "height")
      :ellipse -> get_dimensions("major_radius", "minor_radius")
      :unknown -> {String.first(user_input), 0}
    end
    calculate(shape, dim_one, dim_two)
  end

  @doc """
  Takes the first character of a shape and returns the shape as an atom.

  If the character is unknown, it will return the atom :unknown
  """
  @spec char_to_shape(char()) :: atom()

  def char_to_shape(character) do
    cond do
      String.downcase(character) == "r" -> :rectangle
      String.downcase(character) == "t" -> :triangle
      String.downcase(character) == "e" -> :ellipse
      true -> :unknown
    end
  end

  @doc """
  Requests two dimensions and returns them as a tuple.
  """
  @spec get_dimensions(String.t(), String.t()) :: {number(), number()}

  def get_dimensions(prompt1, prompt2) do
    dim_one = get_number(prompt1)
    dim_two = get_number(prompt2)
    {dim_one, dim_two}
  end

  @doc """
  Prompts user to enter a dimension.
  """
  @spec get_number(String.t()) :: number()

  def get_number(prompt) do
    input = IO.gets("Enter #{prompt}: ")
    String.to_integer(String.strip(input))
  end

  @doc """
  Calculates area of a shape using the Geom module. Returns basic validation
  errors.
  """
  @spec calculate(atom(), number(), number()) :: number()
  def calculate(shape, dim_one, dim_two) do
    cond do
      shape == :unknown -> IO.puts("Unknown shape: #{dim_one}")
      dim_one < 0 or dim_two < 0 ->
        IO.puts("Both numbers must be positive (or zero)")
      true -> Geom.area(shape, dim_one, dim_two)
    end
  end
end
