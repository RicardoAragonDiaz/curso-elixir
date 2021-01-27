a = rem(35, 4)
IO.puts "rem(35, 4) #{a}"

result = case a do
  0 -> "35 = 0 mod 4"
  1 -> "35 = 1 mod 4"
  2 -> "35 = 2 mod 4"
  3 -> "35 = 3 mod 4"
end
IO.puts "result (as function): #{result}"

result = "No value"
case a do
  0 ->
    result = "35 = 0 mod 4"
  1 ->
    result = "35 = 1 mod 4"
  2 ->
    result = "35 = 2 mod 4"
  3 ->
    result = "35 = 3 mod 4"
   # IO.puts " Resu = result (as value): #{result}"
  end
  IO.puts "result (as value): #{result}"
