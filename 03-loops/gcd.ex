#Greatest Common Divisor
defmodule EjercicioGcd do

 def gcd(a, b) when is_integer(a) or is_integer(b)   do
   gcd1(a, b)
 end

 defp gcd1(a, b) when b == 0, do: a

 defp gcd1(a, b) do
   if b > a do
     gcd1(b, a)
   else
     gcd1(a - b, b)
   end
 end

end

result = EjercicioGcd.gcd(10, 7)
IO.puts  "GCD: #{result}"
