defmodule HttpoisonTest do
  use ExUnit.Case
  doctest Httpoison

  test "greets the world" do
    assert Httpoison.hello() == :world
  end
end
