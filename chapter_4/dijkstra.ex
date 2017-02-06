defmodule Dijkstra do
  @moduledoc """
  Calculates the greatest common denominator using a method devised by Edsger
  W. Dijkstra
  """

  @doc """
  Calculates the greatest common denominator given two integers. Does not use
  any division.
  """
  def gcd(m, n) do
    cond do
      m == n -> m
      m > n -> gcd((m - n), n)
      true -> gcd(m, (n - m))
    end
  end
end
