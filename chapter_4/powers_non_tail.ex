defmodule Powers do
  import Kernel, except: [raise: 2]

  @moduledoc """
  Calculates the result of raising a number to an integer power using a non-tail
  recursive function.
  """

  @doc """
  Raises a number (x) to an interger power (n) and returns the result.
  """
  def raise(x, n) do
    cond do
      n == 0 -> 1
      n == 1 -> x
      n > 0 -> x * raise(x, (n - 1))
      n < 0 -> 1.0 / raise(x, -n)
    end
  end
end
