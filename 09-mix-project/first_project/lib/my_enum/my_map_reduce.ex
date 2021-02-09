defmodule MyMapreduce do
  def double(list) when is_list(list), do: map(list, &(2 * &1))
  def sum(list) when is_list(list), do: reduce(list, 0, &(&1 + &2))

  def map(list, transform) when is_list(list) and is_function(transform,1) do
    #mapp(list, [], transform)
    reduce(list, [], fn h, acc -> acc ++ [transform.(h)] end)
  end

  def filter(list, condition?) do
    reduce(list, [], &(if condition?.(&1), do: &2 ++ [&1], else: &2))
  end

  def reduce(list, acc, action) when is_list(list) and is_function(action,2) do
    reducep(list, acc, action)
  end

  defp reducep([], acc, _), do: acc
  defp reducep([h | t], acc, action), do: reducep(t, action.(h, acc), action)

end
