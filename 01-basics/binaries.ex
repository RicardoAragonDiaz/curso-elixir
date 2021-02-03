string = "hello"
IO.puts is_binary(true) # true

IO.puts = ?@ #64
IO.puts ?@ == 64 # true
IO.puts ?@ == 0x40 # true

IO.puts "\u0061" # "a"
IO.puts "\u0061" == "a"# true
IO.puts "\u0061"  === "a" # true


####################################
string = "Pingüino"
IO.puts String.length(string)  # 8
IO.puts  byte_size(string) # 9

##################################
# 7 6 5 4 3 2 1 0
# a b c d e f g h = a * 2^7 + b * 2^6 + ... + f * 2^2 + g * 2^1 + h * 2^0
# 0 0 0 0 0 0 0 0
# 1 1 1 1 1 1 1 1

255 = 0b1111_1111
256 = 0b1_0000_0000
1024 = 0b100_0000_0000

IO.puts <<256::8>> == <<0::8>> # true
IO.puts <<0>> == <<0::8>> # true

IO.puts <<256::16>> === <<1, 0>> # true
IO.puts <<256::16>> === <<1::8, 0::8>> # true

IO.puts <<64>> === "@" # true

IO.puts <<4:4, 0::4>> === "@" # true

IO.puts <<1::1, 0::1, 1::1, 1::1>> == <<11::4>>

#######################################
IO.puts is_bitstring(<<11::4>>) # true
IO.puts is_binary(<<11::4>>) # false
IO.puts is_binary(<<11::8>>) # true

#######################################
<<1, 2, x, y>> == <<1, 2, 3, 4>> # x = 3 and y = 4


# <<1, 2, x>> = <<1, 2, 3, 4>> # throws a MatchError
<<1, 2, x::binary>> = <<1, 2, 3, 4, 5, 6, 7>> # x = <<3, 4, 5, 6, 7>>
IO.puts x

################################################
<<a::size(2), b::size(2)>> = <<11::4>>

<<head::binary-size(2), middle, tail::binary>> = <<64, 65, 66, 67, 68, 69>>
IO.puts head # "@A"
IO.puts middle # 66
IO.puts tail # "CDE"

#########################################
is_binary(<<219, 197, 19>>) # true
IO.inspect String.valid?(<<219, 197, 19>>) # false
IO.inspect String.valid?(<<127>>) # true
IO.inspect String.valid?(<<128>>) # false

## todo string es un binary pero no todo binary es un strring

<<head, rest::binary>> = "Microsoft"
IO.puts head == ?M #
IO.puts head  # 77
IO.puts rest  # icrosoft

<<heqad, rest::binary>> = "úber"
IO.puts head  # 195
IO.inspect rest # <<188, 98, 101, 114>>

<<head::binary-size(2), rest::binary>> = "Über"
IO.puts head # "Ü"
IO.puts rest # ber

#############################################

IO.inspect 'hola', charlists: : as_lists
# [104, 111, 108, 97]
# 'hola'


############################################

iex(5)> Enum.reduce([1,2,3,4,5,6], fn act, acc -> act + acc end)
#

iex(5)> list = [1,2,3,4,5]
# [1, 2, 3, 4, 5]
iex(121)> Enum.map(Enum.filter(list, &(rem(&1, 2) == 1)), &(3 * &1 + 1))
# [4, 10, 16]
