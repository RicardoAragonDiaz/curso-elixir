# simple variable
x = 5
y = case 010 do
  ^x -> "The value match whith #{x}"
  _ -> "The value does't match whith #{x}"
end

IO.puts y

#Tuples
{:ok, result} = case {1, "hello", :ok} do
  {1, x, _} -> {:ok, x}
  _         -> {:error, "There is´t match"}
end

IO.puts result


result  = case {1, 2, 3} do
  {_, x, 3} when x < 0 -> "Does match" # (when) condicional (if) dentro de otro (case)
  _ -> "Does not match"
end
IO.puts result

######
result = case 1 do
  x when x <0 -> "No match"
  x -> "Value #{x}"
end
IO.puts result

result = case -1 do
  x -> "Value #{x}"
  x when x < 0 -> "No match"
end
IO.puts result

result = case 1 do
  a -> "Value #{a}"
  _ -> "No  match"
end
IO.puts result
