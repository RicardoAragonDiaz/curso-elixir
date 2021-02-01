defmodule SumaAcumReduce do
  def sumA(list) when is_list(list), do: reduce(list, &(&1 + &2))

  def reduce(list, transform) when is_list(list) and is_function(transform,2) do
    reducep(list, [], 0, transform)
  end

  defp reducep([], acc, _, _), do: acc
  defp reducep([h | t], acc, aux, transform), do: reducep(t, acc ++ [transform.(aux, h)], aux + h, transform)

end

IO.inspect SumaAcumReduce.sumA([1, 3, 4, -1])
#[1, 4, 8, 7]
