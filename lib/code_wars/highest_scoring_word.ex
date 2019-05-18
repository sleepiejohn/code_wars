defmodule HighestScoringWord do
  @alphabet Enum.zip(?a..?z |> Enum.map(&<<&1::utf8>>), 1..26) |> Map.new()

  @doc """
  Find the highest scoring word in a phrase weighted by the sum of each word
  position on alphabet.

    ## Example

      iex> HighestScoringWord.high("man i need a taxi up to ubud")
      "taxi"
      iex> HighestScoringWord.high("what time are we climbing up the volcano")
      "volcano"

  """
  def high(""), do: ""

  def high(string) do
    string
    |> String.split()
    |> Enum.map(&calculate_weight/1)
    |> Enum.sort_by(&elem(&1, 0), &(&1 > &2))
    |> hd()
    |> elem(1)
  end

  defp calculate_weight(word) do
    sum =
      word
      |> String.graphemes()
      |> Enum.map(&alphabet_pos/1)
      |> Enum.sum()

    {sum, word}
  end

  defp alphabet_pos(letter) do
    Map.get(@alphabet, letter, 0)
  end
end
