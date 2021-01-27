#Integer
n = 105
n_hex = 0x41 # = 65
n_octal = 0o24 # = 20

IO.puts("a = #{n}, b = #{n_hex}, c = #{n_octal}  ")

# Float
x = 2.71
IO.puts("roud(#{x}) = #{round(x)}")
IO.puts("trunc(#{x}) = #{trunc(x)}")

x = 276.5e-2
IO.puts("roud(#{x}) = #{round(x)}")
IO.puts("trunc(#{x}) = #{trunc(x)}")

# Boolean

# isOpen = true # false


IO.puts("====================")
text = "Pinguino"
#text = "hello word (#{isOpen})"
IO.puts(text)
IO.puts("is_binary(\"#{text}\") = #{is_binary(text)}")
n = String.length(text)
IO.puts("is_binary(\"#{n}\") = #{is_binary(n)}")
IO.puts("String.length(\"#{text}\") = #{(n)}")
IO.puts("byte_size(\"#{text}\") = #{byte_size(text)}")

IO.puts String.upcase(text)

IO.puts("=======================")
atom = :my_atom
atom2 = MyAtom
IO.puts("is_atom(#{4}) = #{is_atom(4)}")
IO.puts("is_atom(#{atom}) = #{is_atom(atom)}")
IO.puts("is_boolean(#{atom}) = #{is_boolean(atom)}")
IO.puts("is_atom(#{atom2}) = #{is_atom(atom2)}")
IO.puts("is_boolean(#{atom2}) = #{is_boolean(atom2)}")


t = true

f = false
IO.puts("is_atom(#{t}) = #{is_atom(t)}")
IO.puts("is_atom(#{f}) = #{is_atom(f)}")
IO.puts("(:true == true) = #{:true == true}")
IO.puts("(:false == false) = #{:true == false}")

IO.puts("#{:ok}")
IO.puts("#{:error}")

IO.puts("========================")
# funcion anonima
add = fn(x,y) ->
  x + y
end

sub = fn x,y -> x - y end

s = add.(1,2)
r = sub.(5,3)

#IO.puts("#{add}") #  Throws an error. "add" can´t be formayyrd as string
IO.puts("is_function(add) = #{is_function(add)}")
IO.puts("is_function(sub) = #{is_function(sub)}")
IO.puts("add.(1,2) = #{s}")
IO.puts("sub.(5,3) = #{r}")
IO.puts("is_function(add, 0) = #{is_function(add, 0)}")
IO.puts("is_function(add, 1) = #{is_function(add, 1)}")
IO.puts("is_function(add, 2) = #{is_function(add, 2)}")
IO.puts("is_function(add, 3) = #{is_function(add, 3)}")

#double = fn

IO.puts("========================")
# Listas
list = [1,"hola",3.3,false]
IO.inspect list # imprimir la lista una de sus funciones
IO.puts("length(list) = #{length list}")

list = [1, "hola"] ++ [4, "y", :hello] # concatenacion de listas
IO.inspect list
IO.puts("length(list) = #{length list}")

IO.puts "hd(list) = #{hd(list)}"
IO.puts "tl(list) = "
IO.inspect tl(list)

# hd [] # ** (ArgumentError) argument error
# tl [] # ** (ArgumentError) argument error

# iex(3) [64,65]
# '@A'
# iex(3) [11,12,13]
#'\v\f\r'
#iex(3) [104,111,108,97]
#'hola'

IO.puts("========================")
# Tuplas
tuple = {1, "2", 3.0, true,:error}
IO.inspect tuple

{a, b, _, c, _} = tuple
IO.puts("a = #{a}, b = #{b}, c = #{c}")

IO.inspect put_elem(tuple, 2, :ok)
IO.inspect tuple

result = File.read("holamundo/hello.ex")
IO.inspect result
IO.puts "elem(result, 0) = #{elem(result, 0)}"

result = File.read("hello.ex")
IO.inspect result
IO.puts "elem(result, 0) = #{elem(result, 0)}"
