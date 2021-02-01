defmodule SumaAcumu do
  def sumList(list) when is_list(list), do: sumListp(list, [], 0)
  defp sumListp([], acc, _), do: acc
  defp sumListp([h | t], acc, aux), do: sumListp(t, acc ++ [aux + h], aux + h)
end

IO.inspect SumaAcumu.sumList([1, 3, 4, -1])
# [1, 4, 8, 7]
