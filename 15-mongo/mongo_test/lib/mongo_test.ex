defmodule MongoTest do
  @moduledoc """
  Documentation for `MongoTest`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> MongoTest.hello()
      :world

  """
  def hello do
    :world
  end

  def insert_One(conn, data) do
    result = Mongo.insert_one!(conn, "estudiantes", data)
    Map.put(data, "id", result.inserted_id)
  end

end
