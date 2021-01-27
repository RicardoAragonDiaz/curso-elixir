# Fibonacci y factorial

# Fibonacci
defmodule SimpleFibonacci do
  # cond do
  def fibon(m) do
    cond do
      m == 0 -> 0
      m == 1 -> 1
      m > 1 ->  fibon(m-1) + fibon(m-2)
      true -> -1
    end
  end

  # case
  def fibCase(n) do
    case n do
     n when n == 1 -> 1
     n when n == 0 -> 0
     n when n  > 1  -> fibCase(n-1) + fibCase(n-2)
    end
  end

  # if else if
  def fibIf(n) do
    if n == 1 do
      1
    else
      if n == 0 do
        0
      else
        if n> 1 do
          fibIf(n-1) + fibIf(n-2)
        else
          -1
        end
      end
    end
  end

end

result = SimpleFibonacci.fibIf(20)
IO.puts  "Fibonacci if = #{result}"


result = SimpleFibonacci.fibCase(20)
IO.puts  "Fibonacci case = #{result}"

result = SimpleFibonacci.fibon(20)
IO.puts  "Fibonacci cond do = #{result}"

#
#
##Factorial
## cond do
#defmodule SimpleFactorial do
#  def fac(n) do
#    cond do
#      n > 1 -> n * fac(n-1)
#      n >=0 -> 1
#      true -> -1
#    end
#  end
#
#  def facCase(n) do
#    case n do
#     n when n == 1 -> 1
#     n when n == 0 -> 1
#     n when n  > 1  -> n * facCase(n-1)
#    end
#  end
#
#end
#
#result = SimpleFactorial.facCase(5)
#IO.puts  "Factorial case = #{result}"

#result = SimpleFactorial.fac(5)
#IO.puts  "Factorial cond do = #{result}"

# case
#factorial = fn
#  (0,_) -> 1
#  (1,_) -> 1
#  (n, fun) -> n * fun.(n - 1, fun)
#end
#result = factorial.(5,factorial)
#IO.puts  "Factorial  case = #{result}"
