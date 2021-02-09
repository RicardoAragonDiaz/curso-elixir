#Fibonacci
defmodule EjerciciosFib do
  @spec fibo(integer()) ::  integer()
  def fibo(n) when is_integer(n) and n > 0 do
    fibo1(n)
  end
  defp fibo1(1), do: 1
  defp fibo1(0), do: 0
  defp fibo1(n) when n > 1, do: fibo1(n-1) + fibo1(n-2)
end

result = EjerciciosFib.fibo(8)
IO.puts  "Fibonacci  = #{result}"
