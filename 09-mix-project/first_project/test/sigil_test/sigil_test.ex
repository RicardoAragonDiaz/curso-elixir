defmodule SigilTest do
  use ExUnit.Case
  doctest Sigil

  test "test Custom sigils" do
    import Sigil, only: [sigil_i: 2]
    assert ~i"(10)" == 10
    assert ~i"(-10)n" == -10
    assert ~i"(-10)a" == -10
    assert ~i"(10)n" == 10
    assert ~i"(10)a" == 10
  end
end
