defmodule Ejercicios do
  #Suma
  def suma(n) when is_integer(n) and n > 0 do
    suma1(n)
  end

  defp suma1(n) when n == 1 do
    1
  end

  defp suma1(n) do
   n + suma1(n-1)
  end

  #Fibonacci
  def fibo(n) when is_integer(n) and n > 0 do
    fibo1(n)
  end

  defp fibo1(n) when n == 1 do
    1
  end

  defp fibo1(n) when n == 0 do
    0
  end

  defp fibo1(n) when n > 1 do
    fibo1(n-1) + fibo1(n-2)
  end

  #Some Function
  def someFunc(a, b) when is_integer(a) or is_integer(b)   do
    someFunc1(a, b)
  end

  defp someFunc1(a, b) when a == 0  or b == 0 do
    0
  end

  defp someFunc1(a, b) when a == b  do
    someFunc1(a - 1, b - 1) + 2 * a - 1
  end

  defp someFunc1(a, b) when a > b  do
    someFunc1(a - b, b) + someFunc1(b, b)
  end

  defp someFunc1(a, b) when a < b  do
    someFunc1(a, a) + someFunc1(b - a, a)
  end

   #Greatest Common Divisor
  def gcd(a, b) when is_integer(a) or is_integer(b)   do
    gcd1(a, b)
  end

  defp gcd1(a, b) when b == 0 do
    a
  end

  defp gcd1(a, b) do
    if b > a do
      gcd1(b, a)
    else
      gcd1(a - b, b)
    end
  end

end

result = Ejercicios.fibo(8)
IO.puts  "Fibonacci  = #{result}"

result = Ejercicios.suma(10)
IO.puts  "La suma de los 10 primeros numeros es: #{result}"

result = Ejercicios.someFunc(15, 48)
IO.puts  "Some Fun: #{result}"

result = Ejercicios.gcd(180, 48)
IO.puts  "GCD: #{result}"
