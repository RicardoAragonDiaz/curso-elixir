result = unless true do
  "this never will be returned"
end
IO.puts result  # nil

# result = cond do
#   my_condition -> nil
#   true -> "this return a value"
# end
result = unless false do
  "this return a value"
  #else
  #  nil
end
IO.puts result  # this return a value

#evaluateUnless = fn x ->
#  unless x do
#    "Truhty"
#  else
#    "falsy"
#  end
#end
evaluateUnless = fn x ->
  unless x, do: "Truhty", else: "falsy"
end

IO.puts evaluateUnless.(false) # Truhty
IO.puts  evaluateUnless.(nil)  # Truhty
IO.puts  evaluateUnless.(true) # Truhty
# evaluateUnless.(another_value) # falsy more example, watch cond examples
