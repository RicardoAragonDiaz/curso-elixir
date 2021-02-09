#Some Function
defmodule EjerciciosSomF do

  def someFunc(a, b) when is_integer(a) or is_integer(b)   do
    someFunc1(a, b)
  end

  defp someFunc1(0, 0), do: 0

  defp someFunc1(a, b) when a == b  do
    someFunc1(a - 1, b - 1) + 2 * a - 1
  end

  defp someFunc1(a, b) when a > b  do
    someFunc1(a - b, b) + someFunc1(b, b)
  end

  defp someFunc1(a, b), do: someFunc1(a, a) + someFunc1(b - a, a)

end

result = EjerciciosSomF.someFunc(15, 48)
IO.puts  "Some Fun: #{result}"
