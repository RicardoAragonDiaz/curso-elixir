double = fn x -> 2 * x end
triple = fn x -> 3 * x end
filter = fn n -> rem(n, 4) == 0 end
is_mod3_plus_1 = fn n -> rem(n, 3) == 1 end
is_mod3_plus_2 = fn n -> rem(n, 3) == 2 end

list = 0..7

# a |> proc(fun)
#proc(a, fun)
result_enum = Enum.filter(Enum.map(list, double), filter)

# result_enum1 = Enum.map(list, double) |> Enum.filter(filter)
# result_enum1 = ( list |> Enum.map(double)) |> Enum.filter(filter)

result_enum1 = list |> Enum.map(double) |> Enum.filter(filter)

IO.puts("#{inspect(result_enum)}")
IO.puts("#{inspect(result_enum1)}")
IO.puts("#================================")

#int [] list = {0, 1, ..., 7}
#int [] double = {};
#int [] result = {};
#for(int i = 0; i < N; i++){
#  double[i] = double(list[i]);
#}
#
#for(int i = 0; i < N; i++){
#  triple[i] = triple(double[i]);
#}
#
#for(int i = 0; i < N; i++){
#  int x = list[i];
#  if(filter(x)){
#     resul.push(x);
#  }
#}

result = list |> Enum.map(double) |> Enum.map(triple) |> Enum.filter(filter)
IO.puts("#{inspect(result)}")
IO.puts("#================================")

#int [] list = {0, 1, ..., 7}
#int [] sextuples = {};
#int [] result = {};
#for(int i = 0; i < N; i++){
#  int x = triple(double(list[i]));
#  sextuples.push(x);
#}
#for(int i = 0; i < N; i++){
#  int x = sextuples[i];
#  if(filter(x)){
#    result.push(x)
#  }
#}
result = list |> Stream.map(double) |> Stream.map(triple) |> Enum.filter(filter)
IO.puts("#{inspect(result)}")
IO.puts("#================================")

#int [] list = {0, 1, ..., 7}
#int [] result = {};
#for(int i = 0; i < N; i++){
#  int x = triple(double(list[i]));
#  if(filter(x))
#     result.push(x)
#  }
#}

result =
  list
  |> Stream.map(double)
  |> Stream.map(triple)
  |> Stream.filter(filter)
  |> Enum.map(fn x -> x end)

  IO.puts("#{inspect(result)}")
  IO.puts("#================================")

##################################################
#Enum is eager
#Stream is la0zy
#list |> stream1 |> stream2 |> enum1 |> stream3 |> enum2 |> stream4 |> stream5 |> enum3

#filter5 = fn (x) ->
#  if(!my_cond && x)do
#    some code (return boot)
#  else
#    false
#  end
#end
#
#temporal = list |> stream1 |> stream2 |> enum1 |> stream3 |> enum2 |> stream4
#result  = if my_cond do
#    temporal |> enum3
#  else
#    temporal |> stream5 |> enum4
#end

######################################
result = 0..7 |> Stream.drop(2) |> Enum.take(3)
IO.puts("#{inspect(result)}")

result = 0..3 |> Stream.drop(2) |> Enum.take(3)
IO.puts("#{inspect(result)}")
IO.puts("#================================")

#int [] list = {0, 1, ..., 7}
#int [] result = {};
#for(int i = 0; i < N; i++){
#  int x = double(list[i]);
#  if(is_mod3_plus_2(x))
#    result.push(x);
#  }
#}
# result = 0..7 |> Stream.map(double) |> Enum.filter(is_mod3_plus_2)
result = 0..7 |> Stream.map(double) |> Enum.filter(is_mod3_plus_2) |> Enum.map(fn x -> x end)
IO.puts("#{inspect(result)}")

#int [] list = {0, 1, ..., 7}
#int [] result = {};
#for(int i = 0; i < N; i++){
#  if(is_mod3_plus_1(x))
#    int x = double(list[i]);
#    result.push(x);
#  }
#}
result = 0..7 |> Stream.filter(is_mod3_plus_1) |> Stream.map(double) |> Enum.map(fn x -> x end)
IO.puts("#{inspect(result)}")
IO.puts("#================================")
