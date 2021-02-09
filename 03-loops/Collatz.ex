defmodule Collatz do
  #def coll(n)  when is_integer(n)  and n > 0 do
  #  IO.puts("#{n}")
  #  cond do
  #    n == 1 -> :ok
  #    rem(n, 2) == 1 -> coll(n * 3 + 1)
  #    rem(n, 2) == 0 -> coll(div(n, 2))
  #  end
  #end

  #Optimizacion
  def coll(n) when is_integer(n) and n > 0 do
    coll(n, 0)
  end

  def coll(1, acc) do
    IO.puts("1")
    acc
  end

  def coll(n, acc) when rem(n, 2) == 0 do
    IO.puts("#{n}")
    coll(div(n, 2), acc + 1)
  end

  def coll(n, acc) do
    IO.puts("#{n}")
    coll(n * 3 + 1, acc + 1)
  end
end
Collatz.coll(33)
