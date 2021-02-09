
defmodule DescendantReduce do

  def descendant?(list \\ []) when is_list(list) do
    {is_descendant, _} = reduce(list, {true, nil}, fn head, {canContinue, min} ->
      cond do
        !canContinue -> {canContinue, min}
        min == nil -> {canContinue, head}
        head < min -> {canContinue, head}
        true -> {false, min}
      end
    end)
    is_descendant
  end

  def reduce(list, acc, action) when is_list(list) and is_function(action,2) do
    reducep(list, acc, action)
  end

  defp reducep([], acc, _), do: acc
  defp reducep([h | t], acc, action), do: reducep(t, action.(h, acc), action)

end

IO.puts DescendantReduce.descendant?([]) # true
IO.puts DescendantReduce.descendant?([1]) # true
IO.puts DescendantReduce.descendant?([1, 2]) # false
IO.puts DescendantReduce.descendant?([1, 2, 3]) # false
IO.puts DescendantReduce.descendant?([1, 2, 3, 4]) # false
IO.puts DescendantReduce.descendant?([1, 2, 3, 4, 5]) # false
IO.puts DescendantReduce.descendant?([7, 4, 2]) # true
IO.puts DescendantReduce.descendant?([7, 4, 2, 1]) # true
IO.puts DescendantReduce.descendant?([9, 8, 7, 4, 2]) # true
