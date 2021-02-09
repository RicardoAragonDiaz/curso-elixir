defmodule Factorial do
  def classic(n)  when is_integer(n) and n >= 0 do
    cond do
      n < 2 -> 1
      true -> facp1(n, 0, 1)
    end
  end

  def fac1(n) when is_integer(n) and n >= 0 do
    facp1(n, 0, 1)
  end
  defp facp1(n, i, acc) when is_integer(n) do
    cond do
      i == n -> acc
      true -> facp1(n, i + 1, acc * (i + 1))
    end
  end


  def fac2(n) when is_integer(n) and n >= 0 do
    cond do
      n < 2 -> 1
      true -> facp2(n - 1, n)
    end
  end

  # defp facp2(n, acc) when is_integer(n) and n == 0 do
  #    acc
  # end
  defp facp2(0, acc) when is_integer(acc), do: acc
  defp facp2(n, acc) when is_integer(n) do
    facp2(n - 1, acc * n)
  end

end


IO.puts (Factorial.classic(6))
IO.puts (" fac1(0) = #{Factorial.fac1(0)}")
IO.puts (" fac1(1) = #{Factorial.fac1(1)}")
IO.puts (" fac1(2) = #{Factorial.fac1(2)}")
IO.puts (" fac1(3) = #{Factorial.fac1(3)}")
IO.puts (" fac1(4) = #{Factorial.fac1(4)}")
IO.puts (" fac1(5) = #{Factorial.fac1(5)}")
IO.puts("---------------------")
IO.puts (" fac2(0) = #{Factorial.fac2(0)}")
IO.puts (" fac2(1) = #{Factorial.fac2(1)}")
IO.puts (" fac2(2) = #{Factorial.fac2(2)}")
IO.puts (" fac2(3) = #{Factorial.fac2(3)}")
