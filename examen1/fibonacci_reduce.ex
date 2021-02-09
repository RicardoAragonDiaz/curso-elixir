defmodule FibonacciReduce do

  def fiboReduc(list) when is_list(list), do: reduce(list, 0, )

  def reduce(list, acc, action) when is_list(list) and is_function(action, 2), do: reducep(list, acc, action)

  defp reducep([], acc, _), do: acc
  defp reducep([h | t], acc, action), do: reducep(t, action.(h, acc), action)


end

IO.puts "#{FibonacciReduce.fiboReduc([5])}"
