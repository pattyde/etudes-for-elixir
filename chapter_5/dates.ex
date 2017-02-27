defmodule Dates do
  @moduledoc """
  Functions for dealing with dates
  """

  @doc """
  Takes a date in ISO format and returns a list of integers
  """
  @spec date_parts(list) :: list
  
  def date_parts(date_string) do
    [year, month, day] = String.split(date_string, ~r/-/)
    [String.to_integer(year), String.to_integer(month), String.to_integer(day)]
  end
end
