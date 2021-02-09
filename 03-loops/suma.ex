#Suma
defmodule EjerciciosSuma do

  def suma(n) when is_integer(n) and n > 0 do
    suma1(n)
  end
  defp suma1(n) when n == 1, do: 1
  defp suma1(n), do: n + suma1(n-1)

end

result = EjerciciosSuma.suma(10)
IO.puts  "La suma de los 10 primeros numeros es: #{result}"
