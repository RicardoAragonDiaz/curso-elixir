# String.to_charlist "hola mundo"
#iex(1)> :binary.bin_to_list "adios"
#'adios'
#iex(2)>
#iex(3)> :erlang.+(2, 3)
#5
#iex(4)> 2 |> :erlang.+(3)
#5
#iex(5)> :io.format("pi es aproximado a: ~10.3f~n", [:math.pi])
#iex(7)> :io_lib.format("pi es aproximado a: ~10.3f~n", [:math.pi])
#'pi es aproximado a:      3.142\n'
#iex(8)> to_string :io_lib.format("pi es aproximado a: ~10.3f~n", [:math.pi])
#"pi es aproximado a:      3.142\n"
#iex(8)> to_string :io_lib.format("pi es aproximado a: ~10.3f~n", [:math.pi])
#"pi es aproximado a:      3.142\n"
#iex(9)> Base.encode16(:crypto.hash(:sha256, "curso elixir"))
#"A112C33BD910C2785036DDC5E45CAD8442EB362C01BBE005A0593141C45BD112"
#iex(10)> :crypto.hash(:sha256, "curso elixir")
#<<161, 18, 195, 59, 217, 16, 194, 120, 80, 54, 221, 197, 228, 92, 173, 132, 66,
#  235, 54, 44, 1, 187, 224, 5, 160, 89, 49, 65, 196, 91, 209, 18>>
#  iex(11)> :crypto.hash(:sha256, "curso elixir") |> Base.encode16
#  iex(12)> table = :ets.new :my_table, []
##Reference<0.244520005.973209603.222653>
#iex(13)> :ets.insert(table, {"Colombia", "COP"})
#true
#iex(14)> :ets.insert(table, {"Peru", "pen"})
#true
#iex(15)> :ets.i(table)
#<1   > {<<"Colombia">>,<<"COP">>}
#<2   > {<<"Peru">>,<<"pen">>}
#EOT  (q)uit (p)Digits (k)ill /Regexp -->q
#:ok
#iex(16)> :ets.lookup(table, "Colombia")
#[{"Colombia", "COP"}]
#iex(17)> :ets.delete(table)
#true
#iex(18)> :ets.lookup(table, "Colombia")
#** (ArgumentError) argument error
#    (stdlib 3.8) :ets.lookup(#Reference<0.244520005.973209603.222653>, "Colombia")
#iex(18)> :math.pi
#3.141592653589793
#iex(19)> :math.pi()
#3.141592653589793
#iex(20)> :math.pow(2, 3)
#8.0
#iex(21)> :rand.uniform()
#0.2866261718223858
#iex(22)> :rand.seed(:exs1024, {47,545, 890})
#{%{
#   jump: #Function<13.10897371/1 in :rand.mk_alg/1>,
#   max: 18446744073709551615,
#   next: #Function<12.10897371/1 in :rand.mk_alg/1>,
#   type: :exs1024
# },
# {[11459981300416043001, 10839693417436097381, 4510633679073751878,
#   2926229852099820512, 10331495020522950119, 18208990086451454936,
#   2789677723559950830, 13929398633717925763, 17175936808292613419,
#   16935221695196970564, 17501650339431854763, 6071448046042915873,
#   3610314203473479231, 12745154328551770161, 14778945609234077907,
#   1164360897446980114], []}}
#   iex(23)> :rand.uniform()
#   0.3365869329687696
#   iex(24)> :rand.uniform(7)
#   5
#   iex(25)> :rand.uniform(6) +  :rand.uniform(6)
#   8
#   iex(26)> :rand.uniform(6) +  :rand.uniform(6)
#   5
#   iex(27)> :rand.uniform(6) +  :rand.uniform(6)
#   4
