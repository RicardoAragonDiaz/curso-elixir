defmodule Geometry do
  defmodule Rectangle do
    @enforce_keys [:b]
    defstruct  b: 1, h: 1 # base, heigh
  end

  defmodule Circle do
    defstruct r: 1 #radius
  end

  defmodule HiperCube do # Tesseract
    # @enforce_keys[:a]
    defstruct [:a, :d, b: 1, c: 1]
    #  defstruct a: nil, b: 1, c: 1, d: nil
    #  defstruct [a: nil, b: 1, c: 1, d: nil]
    #  defstruct [{:a, nil}, {:b 1}, {:c 1}, {:d, nil}]
  end

  defprotocol Shape do
    @fallback_to_any true
    def area(shape)
    def perimeter(shape)
  end

  # Instead of reac.area(), you must write Shape.area(rect)
  defimpl Shape, for: Rectangle  do
    def area(r), do: r.b * r.h
    def perimeter(r), do: 2 * r.b + 2 * r.h
  end

  # Instead of circle.area(), you must write Shape.area(circle)
  defimpl Shape, for: Circle  do
    def area(c), do: :math.pi() * c.r * c.r / 2
    def perimeter(c), do: 2 * :math.pi() * c.r
  end

  defimpl Shape, for: Any do
    def area(_), do: :error
    def perimeter(_), do: :error
  end

end
