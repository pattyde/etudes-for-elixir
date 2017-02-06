defmodule Powers do
  import Kernel, except: [raise: 2, raise: 3]

  @moduledoc """
  Functions to calculate the result of raising a number to an integer power
  using tail recursion and finding the nth root of a number
  """

  @doc """
  Raises a number (x) to an interger power (n) and returns the result.
  """
  def raise(x, n) do
    cond do
      n == 0 -> 1
      n > 0 -> raise(x, n, 1)
      n < 0 -> 1.0 / raise(x, -n)
    end
  end

  @doc """
  Helper function to multiply the accumulator by x each time, returning the
  accumulator when n == 0
  """
  defp raise(x, n, accumulator) do
    cond do
      n == 0 -> accumulator
      true -> raise(x, (n - 1), (x * accumulator))
    end
  end

  @doc """
  Calculates the nth root of a number using the Newton-Raphson method.
  """
  def nth_root(x, n) do
    nth_root(x, n, (x / 2.0))
  end

  @doc """
  Helper function to return the estimate of the nth root of x. Calculates the
  next estimate until the difference from the previous estimate is within a
  set limit. 
  """
  defp nth_root(x, n, estimate) do
    IO.puts("Current guess is #{estimate}")
    f = raise(estimate, n) - x
    f_prime = n * raise(estimate, (n - 1))
    next = estimate - f / f_prime
    change = abs(next - estimate)

    cond do
      change < 1.0e-8 -> next
      true -> nth_root(x, n, next)
    end
  end
end
