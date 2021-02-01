defmodule FactorialReduce do

  def factReduc(n) when is_integer(n) and n >= 0, do: reduce(n, 0, 1,  &(&1 * (&2 + 1)))

  def reduce(n, i, acc, action) when is_integer(n) and is_function(action,2), do: reducep(n, i, acc, action)
  defp reducep(n, i, acc, _) when i == n, do: acc
  defp reducep(n, i, acc, action), do: reducep(n, (i + 1), action.(acc, i), action)

end

IO.puts "#{FactorialReduce.factReduc(8)}"
# 40320
IO.puts "#{FactorialReduce.factReduc(0)}"
# 1
