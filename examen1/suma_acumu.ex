defmodule SumaAcumu do
  def sumList(list \\ []) when is_list(list), do: sumListp(list, [], 0)
  defp sumListp([], acc, _), do: acc
  defp sumListp([h | t], acc, aux), do: sumListp(t, acc ++ [aux + h], aux + h)
end

IO.inspect SumaAcumu.sumList() # []
IO.inspect SumaAcumu.sumList([]) # []
IO.inspect SumaAcumu.sumList([4]) # [4]
IO.inspect SumaAcumu.sumList([4, -1]) # [4, 3]
IO.inspect SumaAcumu.sumList([1, 0, 4, 2]) # [1, 1, 5, 7]
IO.inspect SumaAcumu.sumList([10, 20, 4, -1]) # [10, 30, 34, 33]
IO.inspect SumaAcumu.sumList([1, -1]) #[1, 0]
IO.inspect SumaAcumu.sumList([1, 3, 4, -1]) # [1, 4, 8, 7]
