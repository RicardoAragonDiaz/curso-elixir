map = %{:a => 5, 2 => "hello", true => :ok} # %{2 => "hello", :a => 5, true => :ok}
IO.puts "map = %{ 2 => \"map[2]\", :a => #{map[:a]}, true => #{map[true]}}"

map = %{:a => 5, 2 => "hello", 2 => :ok} # %{2 => "hello", :a => :ok}
IO.puts map[:c] # nill

# pattern matching
%{2 => b, :a => a} = %{:a => 5, 2 => true} #  a = true, b = 5
%{:a => a} = %{:a => 5, b => 2} # a= 5
%{:c => a} = %{:a => 5, b => 2} # Throws a MatchError
%{} = %{:a => 5, b => 2} # It works but is useless

key = 5
map  = %{:a => true, key => "hello"} # %{5 => "hello", :a => true}
IO.puts map[key] # hello
# %{key => value} = map # Throws a CompileError
%{^key => value} = map # value ="hello"
IO.puts value #hello


#Operations
map = %{:a => 5, 2 => "hello", true => :ok} # %{2 => "hello", :a => 5, true => :ok}
IO.puts Map.get(map, :a) # 5

map2 = Map.put(map, :c, 4) # %{2 => "hello", :a => 5, :c => 4, true => :ok}
IO.puts (map2 == map) # false

map3 = Map.put(map2, :c, false) #%{2 => "hello", :a => 5, :c => false, true => :ok}
IO.puts (map2 == map3) #false

#%{map | :c => "bye"} ##Throws a KeyError because :c nopt int map
map4 =  %{map | :a => "bye"} # %{2 => "hello", :a => "bye", true => :ok}
IO.puts (map4 == map) # false

# if the key is an atom
IO.puts map.a # 5
IO.puts map[:a] # 5
users = [
  frank: %{lastname: "Moreno", contry: "Peru"},
  #frank: %{:lastname => "moreno", :contry => "peru"}
  juan: %{lastname: "Meza", contry: "Colombia"}
]

IO.puts users[:frank].lastname # Moreno
# users.frank # Thorws a Argument Error
