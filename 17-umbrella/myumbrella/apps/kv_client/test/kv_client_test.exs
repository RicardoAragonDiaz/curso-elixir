defmodule KVClientTest do
  use ExUnit.Case
  doctest KVClient

  test "greets the world" do
    assert KVClient.hello() == :world
  end
end
