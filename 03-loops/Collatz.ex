defmodule Collatz do
  def coll(n)  when is_integer(n)  and n > 0 do
    cond do
      n == 1 -> IO.puts("#{n}")
      rem(n, 2) == 1 -> IO.puts("#{n}")
        1 + coll(n * 3 + 1)
      rem(n, 2) == 0 -> IO.puts("#{n}")
        1 + coll(div(n, 2))
    end
  end
end
Collatz.coll(33)
