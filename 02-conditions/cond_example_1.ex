result = cond do
  2 + 3 == 4 -> "2 + 3 == 4"
  2 * 3 == 4 -> "2 * 3 == 4"
  1 + 1 == 2 -> "1 + 1 == 2"
end
IO.puts result

result = cond do
  2 + 2 == 4 -> "2 + 3 == 4"
  2 * 3 == 4 -> "2 * 3 == 4"
  1 + 2 == 2 -> "1 + 1 == 2"
 # true -> nil # Needed when the rest of cases´re false
end
IO.puts result

result = cond do
  hd([2, "hola", :ok]) -> "2 works as a true"
end
IO.puts result # "2 works as a true"

result = cond do
  hd([0, "hola", :ok]) -> "0 works as a true"
end
IO.puts result # "0 works as a true"

result = cond do
  hd(["hola", 0, :ok]) -> "\"hola\" works as a true"
end
IO.puts result # "Hola" works as a true

result = cond do
  hd(["", 0, :ok]) -> "\"\" works as a true"
end
IO.puts result # "" works as a true

result = cond do
  hd([:ok, "", 0]) -> ":ok works as a true"
end
IO.puts result # :ok works as a true

result = cond do
  hd([:error, "", 0]) -> ":error works as a true"
end
IO.puts result # :error works as a true

result = cond do
  hd([true, "", 0]) -> "true works as a true"
end
IO.puts result # true works as a true

result = cond do
  hd([false,"", 0]) -> "false works as a true"
  true -> "false works as a false"
end
IO.puts result # false works as a false

result = cond do
  hd([false,"", 0])  == false -> "false works as a true"
end
IO.puts result # false = false works as a true
