
table = :ets.new(:my_bucket, [:set, :protected])
:ets.insert(table, {"a", 1}) # true
:ets.insert(table, {"a", 2}) #true
:ets.lookup(table, "a") # [{"a", 1}, {"a", 2}]
:ets.insert(table, {"a", 3})# true
:ets.lookup(table, "a") # [{"a", 1}, {"a", 2}, {"a", 3}]

############################################################

table = :ets.new(:my_bucket, [:bag, :protected]) #Reference<0.435586894.4043177987.215723>
:ets.insert(table, {:hello, 3}) # true
:ets.insert(table, {:hello, 1}) # true
:ets.lookup(table, :hello) # [hello: 3, hello: 1]
:ets.insert(table, {"a", 1}) # true
:ets.lookup(table, "a") # [{"a", 1}, {"a", 2}]

############################################################

table1 = :ets.new(:my_bucket, [:bag, :protected]) #  #Reference<0.3692191807.1776418817.113800>
:ets.insert(table1, {:hello, 1}) #
:ets.insert(table1, {:hello, 2}) #
:ets.lookup(table1, :hello)) #
spawn_link fn -> :ets.lookup(table1, :hello) end #
parent = self() #
spawn_link fn -> sen parent, :ets.lookup(table1, :hello) end #
receive do
  x -> x
end # [hello:1, hello: 2]
spawn_link fn -> send parent, :ets.insert(table1, {:hello, 3}) end # throws ArgumentError, cant insert, table ins protected

############################################################

table1 = :ets.new(:my_bucket, [:bag, :protected]) #
:ets.insert(table1,{"a", 2}) # true
table1 = :ets.new(:my_bucket, [:bag, :private]) #
parente = self() #
spawn_link fn -> send parent, :ets.lookup(table, "a") end

