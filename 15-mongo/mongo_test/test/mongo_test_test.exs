defmodule MongoTestTest do
  use ExUnit.Case
  doctest MongoTest

  test "greets the world" do
    assert MongoTest.hello() == :world
  end
end
