defmodule FibonacciReduce do
  def fiboReduc(n) when is_integer(n) and n > 0, do: reduce(n, 1, 0, &(&1 + &2))

  def reduce(n, v1, v2, action) when is_integer(n) and is_function(action,2), do: reducep(n, v1, v2, action)

  defp reducep(0, _, v2, _), do: v2
  defp reducep(1, v1, _, _), do: v1
  defp reducep(n, v1, v2, action) when n > 1, do: reducep(n - 1, action.(v1, v2), v1, action)

end

#IO.puts "#{FibonacciReduce.fiboReduc(8)}"
