defmodule WeightSort do
  @moduledoc """
  My friend John and I are members of the "Fat to Fit Club (FFC)". John is
  worried because each month a list with the weights of members is published and
  each month he is the last on the list which means he is the heaviest.

  I am the one who establishes the list so I told him: "Don't worry any more, I
  will modify the order of the list". It was decided to attribute a "weight" to
  numbers. The weight of a number will be from now on the sum of its digits.
  """

  @doc """
  Weight the weights according to its digits

    ## Examples

      iex> WeightSort.weight("103 123 4444 99 2000")
      "2000 103 123 4444 99"
      iex> WeightSort.weight("2000 10003 1234000 44444444 9999 11 11 22 123")
      "11 11 2000 10003 22 123 1234000 44444444 9999"

  """
  def weight(str) do
    str
    |> String.split()
    |> Enum.map(&calculate_weight/1)
    |> Enum.sort(&comparator/2)
    |> Enum.map(&elem(&1, 1))
    |> Enum.join(" ")
  end

  defp calculate_weight(weight) do
    {integer, _} = Integer.parse(weight)
    {sum_digits(integer), weight}
  end

  defp sum_digits(weight) do
    Integer.digits(weight)
    |> Enum.sum()
  end

  defp comparator({ww1, w1}, {ww2, w2}) do
    cond do
      ww1 < ww2 -> true
      ww1 == ww2 -> w1 < w2
      true -> false
    end
  end
end
