IO.puts("SECTION 1 ---------------------------")

try do
  :bar / 2
rescue
  RuntimeError -> IO.puts("There was a runtime error")
  ArithmeticError -> IO.puts("The divisions was not possible")
end

IO.puts("SECTION 2 ---------------------------")

try do
  :bar / 2
rescue
  RuntimeError -> IO.puts("There was a runtime error")
  e in ArithmeticError -> IO.puts("The divisions was not possible: #{e.message}")
end

IO.puts("SECTION 3 ---------------------------")
#try do
#  raise CustomError, message: "My custon error"
#rescue
#  e in CustomError -> IO.puts("message: #{e.message}, country: #{e.country}")
#end
#
#try do
#  raise CustomError, message: "My custon error"
#rescue
#  e in CustomError -> IO.puts("message: #{e.message}, country: #{e.country}")
#end

IO.puts("SECTION 4 ---------------------------")

try do
  IO.puts("This is not an error")
rescue
  _ -> IO.puts("This is never printed")
end

try do
  raise "This was an erro :'("
rescue
  _ -> IO.puts("This is printed on error ")
after
  IO.puts("This is always printed?")
end

IO.puts("SECTION 5 ---------------------------")
try do
  IO.puts("This is not an error")
rescue
  e -> IO.puts("This is never printed #{e}")
after
  IO.puts("This is always printed")
end

#try do
#  throw(453_637)
#  IO.puts("This is never printed")
#rescue
#  e -> IO.puts("This is printed on error #{e}")
#after
#  IO.puts("This is always printed?")
#end

IO.puts("SECTION 6 ---------------------------")

#falta

try do
  throw("hola")
  IO.puts("This is never printed")
rescue
  e -> IO.puts("from rescue: #{e.message}")
catch
  e -> IO.puts("from catch: #{e}")
after
  IO.puts("This is always printed")
end

IO.puts("SECTION 7 ---------------------------")
try do
  throw(nil)
  IO.puts("This is never printed")
rescue
  e -> IO.puts("from rescue: #{e.message}")
catch
  e -> IO.puts("from catch: #{e}")
after
  IO.puts("This is always printed")
end


IO.puts("SECTION 8 ---------------------------")
try do
  0..20
  |> Enum.each(fn x ->
    if x == 10, do: raise("Oops! x == 10")
  end)
rescue
  e -> IO.puts("from rescue: #{e.message}")
catch
  e -> IO.puts("from catch: #{e}")
after
  IO.puts("This is always printed")
end

try do
  0..20
  |> Enum.each(fn x ->
    if x == 10, do: throw("Oops! x == 10")
  end)
rescue
  e -> IO.puts("from rescue: #{e.message}")
catch
  e -> IO.puts("from catch: #{e}")
# after
  IO.puts("This is always printed")
end

sum = try do
  1..20 |> Enum.reduce(0, fn h, acc ->
    if rem(h, 13) == 0 do
      #raise acc # para lanzar error pero la intencion es detener por eso se usa el throw
      throw acc
    else
      h + acc
    end
  end)
  #rescue
    # e in RuntimeError -> e.message
  catch
    acc -> acc
end
IO.puts sum

############

how_large_is = fn x ->
  try do
    1 / x
  rescue
    ArithmeticError -> :infinity
  #catch
  # e -> IO.puts e
  else
    d when d < 1  and d > -1  -> :small
    d when d < 10 and d > -10 -> :middle
    _ -> :large
  after
    IO.puts "Hello"
  end
end

how_large_is.(0)
how_large_is.(1)
how_large_is.(2)
how_large_is.(0.5)
how_large_is.(0.1)
