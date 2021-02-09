defmodule GcdReduce do
  def gcdReduc(a, b) when is_integer(a) or is_integer(b), do: reduce(a, b, &(&1 - &2))

  def reduce(a, b, action) when is_function(action,2), do: reducep(a, b, action)

  defp reducep(a, 0, _), do: a
  defp reducep(a, b, action) when b > a, do: reducep(b, a, action)
  defp reducep(a, b, action), do:  reducep(action.(a, b), b, action)

end

IO.puts "#{GcdReduce.gcdReduc(10,7)}"
