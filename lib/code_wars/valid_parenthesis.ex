defmodule ParenthesesValidator do
  @doc """
    ## Examples

      iex> ParenthesesValidator.valid_parentheses("(())")
      true
      iex> ParenthesesValidator.valid_parentheses("(()")
      false
      iex> ParenthesesValidator.valid_parentheses("())")
      false
      iex> ParenthesesValidator.valid_parentheses("()))))")
      false
      iex> ParenthesesValidator.valid_parentheses("()()()")
      true
      iex> ParenthesesValidator.valid_parentheses("hi(hi)hi")
      true
      iex> ParenthesesValidator.valid_parentheses("h")
      true
  """
  def valid_parentheses(string) do
    brackets = String.graphemes(string)

    pairings =
      Enum.reduce_while(brackets, [], fn
        "(" = bracket, stack ->
          {:cont, [bracket | stack]}

        ")", stack ->
          pop(stack)

        _other, stack ->
          {:cont, stack}
      end)

    pairings != :error and pairings == []
  end

  defp pop(stack) do
    case stack do
      [] -> {:halt, :error}
      [_ | rest] -> {:cont, rest}
    end
  end
end
