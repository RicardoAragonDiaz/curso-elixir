defmodule MyMapreduce do
  def double(list) when is_list(list), do: map(list, &(2 * &1)) # doublep(list, [])
  #defp doublep([], acc), do:acc
  #defp doublep([h | t], acc), do: doublep(t, acc ++ [2 * h])

  def map(list, transform) when is_list(list) and is_function(transform,1) do
    mapp(list, [], transform)
  end

  defp mapp([], acc, _), do: acc
  defp mapp([h | t], acc, transform), do: mapp(t, acc ++ [transform.(h)], transform)
end


# iex.bat 04-enumerables/map_reduce.ex
# iex(1)> MyMapreduce.map([1, 2, 3, 4, 5], &(2 * &1))
# [2, 4, 6, 8, 10]
# iex(2)>

#iex(1)> MyMapreduce.double([1, 2, 3, 4, 5])
#[2, 4, 6, 8, 10]
#iex(2)>
