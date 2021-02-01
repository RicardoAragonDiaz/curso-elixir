defmodule SumaAcumReduce do
  def sumA(list) when is_list(list), do: sumaAcum(list, &(&1 + &2))

  def sumaAcum(list, transform) when is_list(list) and is_function(transform,2) do
    sumaAcump(list, [], 0, transform)
  end

  defp sumaAcump([], acc, _, _), do: acc
  defp sumaAcump([h | t], acc, aux, transform), do: sumaAcump(t, acc ++ [transform.(aux, h)], aux + h, transform)

end

IO.inspect SumaAcumReduce.sumA([1, 3, 4, -1])
#[1, 4, 8, 7]
