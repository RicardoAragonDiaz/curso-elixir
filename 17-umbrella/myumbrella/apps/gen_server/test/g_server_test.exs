defmodule GServerTest do
  use ExUnit.Case
  doctest GServer

  test "greets the world" do
    assert GServer.hello() == :world
  end


end
