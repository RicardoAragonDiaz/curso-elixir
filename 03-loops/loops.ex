defmodule Loop do
  #int i = 0;
  #while(true){
  #  unless(i < n) breack;
  #  println(value)
  #  i++;
  #}

  def for_loop(i, n, value) do
    cond do
      i < n ->
        IO.puts("#{value} #{i}")
        for_loop(i+1,n,value)

        true -> :ok
    end
  end

  def do_while1(i, n, value) when i < n do
    IO.puts("#{value} #{i}")
    do_while1(i+1, n, value)
  end

  def do_while1(i, n, value) do
    :ok
  end

  # ---------------- Actividad --------------------------
  def for_loopCase(i, n, value)  when i < n do
    case n do
      n when i < n ->
        IO.puts("#{value} #{i}")
        for_loopCase(i+1, n, value)
    end
  end

  def for_loopCase(_, _, _) do
    :ok
  end

  def do_while1Cond(i, n, value) do
    cond do
      i < n ->
        IO.puts("#{value} #{i}")
        do_while1Cond(i+1, n, value)
      true -> :ok
    end
  #  IO.puts("#{value} #{i}")
  #  do_while1(i+1, n, value)

  end
#
  #def do_while1(i, n, value) do
  #  :ok
  #end


end

#Loop.for_loopCase(0, 3, "Hola")
Loop.do_while1Cond(0, 3, "Hola")
#Loop.for_loop(0, 3, "Hola")
#Loop.do_while1(0, 3, "Hola")
# expresar el for_loop en funciones partidad
# expresar el do_while en una funciones
