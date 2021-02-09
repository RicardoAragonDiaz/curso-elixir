defmodule ListOperations do

# List Sum
  #def sum([h | t]), do: h + sum(t)
  #def sum([]), do: 01
  # suma mediante reduce
  def sum(list) when is_list(list), do: sump(list, 0)
  defp sump([], acc), do: acc
  defp sump([h | t], acc), do: sump(t, acc + h)

# reverse
  #def reverse(list), do: reversep(list, [])
  #defp reversep([], aux), do: aux
  #defp reversep([h|t], aux), do: reversep(t, [h|aux])

  def reverse(list) when is_list(list), do: reversep(list, [])
  defp reversep([h | t], reverseList), do: reversep(t, [h] ++ reverseList)
  defp reversep([], reverseList), do: reverseList

# Mas Optimo
  def reverse1(list) when is_list(list), do: reversep1(list, [], length(list))
  defp reversep1(list, reverseList, len) when len < 2, do: list ++ reverseList
  defp reversep1([h | t], reverseList, len), do: reversep1(t, [h] ++ reverseList, len - 1)

#is ascendant
  def ascendant?(list) when is_list(list), do:  ascendant_p?(nil, list)
  defp ascendant_p?(_, []), do: true
  defp ascendant_p?(nil, [b | tail]), do: ascendant_p?(b, tail)
  defp ascendant_p?(a, [b | tail]) when a <= b, do: ascendant_p?(b, tail)
  defp ascendant_p?(_, _), do: false

end
IO.puts ListOperations.sum([2, 5, 7])
IO.puts ListOperations.sum([])

IO.inspect ListOperations.reverse([]) # []
IO.inspect ListOperations.reverse([2]) # []
IO.inspect ListOperations.reverse([2, 5, 7])
IO.inspect ListOperations.reverse([9, 6, 4, 5])

IO.inspect ListOperations.reverse1([]) # []
IO.inspect ListOperations.reverse1([2]) # []
IO.inspect ListOperations.reverse1([2, 5, 7])
IO.inspect ListOperations.reverse1([9, 6, 4, 5])

#IO.puts ListOperations.ascendant?() #
IO.puts ListOperations.ascendant?([]) # true
IO.puts ListOperations.ascendant?([1]) # true
IO.puts ListOperations.ascendant?([1, 2]) # true
IO.puts ListOperations.ascendant?([1, 2, 3]) # true
IO.puts ListOperations.ascendant?([1, 2, 3, 4]) # true
IO.puts ListOperations.ascendant?([1, 2, 3, 4, 5]) # true
IO.puts ListOperations.ascendant?([7, 4, 2]) # false
IO.puts ListOperations.ascendant?([7, 4, 2, 1]) # false
IO.puts ListOperations.ascendant?([6, 1, 7, 4, 2]) # false


# function catering
#iex(1)> ascen? = fn list -> ListOperations.ascendant?(n)
#...(1)> end
##Function<44.79398840/1 in :erl_eval.expr/5>
#iex(2)> sum.([3, 5, -1])
#7
#iex(3)> asc = &ListOperations.ascendant?/1
#&ListOperations.sum/1
#iex(4)> sum1.([3, 5, -1])
#7

# futten()
# a = [1, [3,4], 4, [[[5,3]]]]
#List.flatten(a)

#f1 = &List.flatten/1 # implicita
#f1.(a)

#f2 = &List.flatten/2
#f2.(a, b)
#f2.(a)

#g1 = &(List.flatten(&1)) # explicita
#
#g2 = &(List.flatten(&2, &1))
