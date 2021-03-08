defmodule PostgresMockTest do
  use ExUnit.Case
  doctest PostgresMock


  test "Creating a PostMock without pid " do
    db_handler = %PostgresMock{}
    assert db_handler.pid == nil
  end

  test "Creating a PostMock" do
    db_handler = PostgresMock.create()
    assert db_handler.pid != nil
  end

  test "creating user" do
    handler = PostgresMock.create()
    expected = %User{id: 1, name: "Juan"}
    new_user = DbHandler.create_user(handler, %{name: "Juan"})
    assert expected == new_user
  end

  test "finding user" do
    handler = PostgresMock.create()

    DbHandler.create_user(handler, %{name: "Juan"})
    DbHandler.create_user(handler, %{name: "Ricardo"})

    assert DbHandler.find_user(handler, 0) == nil
    assert DbHandler.find_user(handler, 1) == %User{id: 1, name: "Juan"}
    assert DbHandler.find_user(handler, 2) == %User{id: 2, name: "Ricardo"}
    assert DbHandler.find_user(handler, 3) == nil
  end
end
