#alias Geometry.Rectangle
#alias Geometry.Circle
#alias Geometry.Shape
alias Geometry.{Rectangle, Circle, Shape}

print = fn shape ->
  IO.puts("")
  IO.puts("area(#{inspect shape}) = #{Shape.area(shape)}")
  IO.puts("perimeter(#{inspect shape}) = #{Shape.perimeter(shape)}")
end

rect = %Rectangle{b: 3, h: 4}
print.(rect)

rect = %Rectangle{b: 4}
print.(rect)

circle = %Circle{}
print.(circle)

any = "hola"
print.(any)

#####################################

IO.puts reac.__struct__
#%{}.__struct__ # throes a error

IO.inspect Map.keys(rect) # [:__struct__, :b, :h]
IO.inspect Map.values(rect) # [Geometry.Rectangle, -1, 1]

new_rect = %{rect | b:1}
new_rect = %{rect | b:3, h: 5}
