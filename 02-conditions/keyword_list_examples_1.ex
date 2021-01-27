#iex(3)> list = [1, 2]
#[1, 2]
#iex(4)> list ++ [3, 4]
#[1, 2, 3, 4]
#iex(5)> list = [{:a,1}, {:b,5}]
#[a: 1, b: 5]
#iex(6)> [a: 1, b: 5]
#[a: 1, b: 5]
#iex(7)> [a: 1, b: 5] ++ [{:c,3},{:d,4}]
#[a: 1, b: 5, c: 3, d: 4]
#iex(8)> [{:c,3},{:d,4}] ++ [a: 1, b: 5]
#[c: 3, d: 4, a: 1, b: 5]
#
#iex(9)> list[:a]
#1
#iex(10)> list[:b]
#5
#iex(11)> list[0]
#** (ArgumentError) the Access calls for keywords expect the key to be an atom, got: 0
#    (elixir 1.11.3) lib/access.ex:311: Access.get/3
#iex(11)> Enum.at(list,2)
#nil
#iex(12)> Enum.at(list,1)
#{:b, 5}
#iex(13)> Enum.at(list,0)
#{:a, 1}
#iex(15)> [a: 0, a: 1, b: 2]
#[a: 0, a: 1, b: 2]
#iex(16)> list[:a]
#1
#iex(17)> list[:a]
#1
#iex(18)> list[:b]
#5
#iex(21)> list = [a: 0, a: 1, b: 2, b: 3]
#[a: 0, a: 1, b: 2, b: 3]
#iex(22)> list[:a]
#0
#iex(23)> list = [a: 0, a: 1, b: 2,a: 3, b: 4]
#[a: 0, a: 1, b: 2, a: 3, b: 4]
#iex(24)>
##ex(28)> [a: a] = [a: 1]
#[a: 1]
#iex(29)> [x] = [a: 1]
#[a: 1]
#iex(30)> a
#1
#iex(31)> x
#{:a, 1}
#
#iex(38)> [x] = [a: 1]
#[a: 1]
#iex(39)> x
#{:a, 1}
#iex(40)> [{:a, z}] = [{a: 1}]
#** (SyntaxError) iex:40:15: syntax error before: a
#
#iex(40)> [{:a, z}] = [{:a, 1}]
#[a: 1]
#iex(41)> z
#1
#iex(42)> [{:a, 1}, _] = [a: 1, b: 2]
#[a: 1, b: 2]
#iex(43)>
#
#
[a: a] = [a: 1, b: 2] # Throws a MatchError
#[{:a, a}] = [{:a, 1},{:b 2}] # Different length

#[b: b, a: a] = [a: 1, b: 2] # Throws a MatchError

#Enum(list, index) returns the a value in a index
