defmodule Collatz do
  def coll(n)  when is_integer(n)  and n > 0 do
    IO.puts("#{n}")
    cond do
      n == 1 -> :ok
      rem(n, 2) == 1 -> coll(n * 3 + 1)
      rem(n, 2) == 0 -> coll(div(n, 2))
    end
  end
end
Collatz.coll(33)
