defmodule Descendant do
  #is_descendant
  def is_descendant?(list) when is_list(list), do:  is_descendantp?(nil, list)
  defp is_descendantp?(_, []), do: true
  defp is_descendantp?(nil, [h | tail]), do: is_descendantp?(h, tail)
  defp is_descendantp?(aux, [h | tail]) when aux >= h, do: is_descendantp?(h, tail)
  defp is_descendantp?(_, _), do: false
end

IO.puts Descendant.is_descendant?([]) # true
IO.puts Descendant.is_descendant?([1]) # true
IO.puts Descendant.is_descendant?([1, 2]) # false
IO.puts Descendant.is_descendant?([1, 2, 3]) # false
IO.puts Descendant.is_descendant?([1, 2, 3, 4]) # false
IO.puts Descendant.is_descendant?([1, 2, 3, 4, 5]) # false
IO.puts Descendant.is_descendant?([7, 4, 2]) # true
IO.puts Descendant.is_descendant?([7, 4, 2, 1]) # true
IO.puts Descendant.is_descendant?([9, 8, 7, 4, 2]) # true
