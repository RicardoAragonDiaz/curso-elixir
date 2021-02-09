#Sequence
defmodule EjerciciosSeq do
  def seq(n) when is_integer(n) and n > 0 do
    seq1(n, 0, "1")
  end

  #defp seq1(1, _, acc),  do: IO.puts acc

  defp seq1(n, pref, acc)  do
    IO.puts acc
    if n > 1, do: seq1(n - 1, 1 - pref, "#{pref}" <> acc)
  end

end

EjerciciosSeq.seq(5)
