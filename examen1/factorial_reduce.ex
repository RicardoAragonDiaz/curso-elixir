defmodule FactorialReduce do

  def factReduc(n) when is_integer(n) and n >= 0, do: reduce(n, 1,  &(&1 * (&2 + 1)))

  def reduce(n,  acc, action) when is_integer(n) and is_function(action,2), do: reducep(n,  acc, action)
  defp reducep(n, acc, _) when n == 0, do: acc
  defp reducep(n, acc, action), do: reducep(n - 1, action.(acc, n - 1), action)

end

IO.puts "#{FactorialReduce.factReduc(8)}"
# 40320
IO.puts "#{FactorialReduce.factReduc(0)}"
# 1
