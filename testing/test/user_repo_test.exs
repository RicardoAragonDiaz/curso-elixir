defmodule UserRepoTest do
  use ExUnit.Case
  doctest UserRepo

  test "UserRepoImple.pid is nil" do
    repo = %UserRepoImpl{pid: nil}
    assert_raise UndefinedFunctionError, fn -> UseRepo.findOne(repo, 1) end
  end

  test "creating users" do
    db_handler = PostgresMock.create()

    repo = UserRepoImpl.create(db_handler)

    expected = %User{id: 1, name: "Juan"}
    new_user = UserRepo.createOne(repo, name: "Juan")
    assert expected == new_user

    expected = %User{id: 2, name: "Ricardo"}
    new_user = UserRepo.createOne(repo, name: "Ricardo")
    assert expected == new_user

    expected = %User{id: 3, name: "duban"}
    new_user = UserRepo.createOne(repo, name: "duban")
    assert expected == new_user
  end

  test "finding users out of range" do
    db_handler = PostgresMock.create()
    repo = UserRepoImpl.create(db_handler)

    UserRepo.createOne(repo, name: "Juan")
    UserRepo.createOne(repo, name: "Ricardo")

    assert UserRepo.findOne(repo, -1) == nil
    assert UserRepo.findOne(repo,  0) == nil
    assert UserRepo.findOne(repo,  3) == nil
    assert UserRepo.findOne(repo,  4) == nil
  end

  test "finding users" do
    db_handler = PostgresMock.create()
    repo = UserRepoImpl.create(db_handler)

    UserRepo.createOne(repo, name: "Juan")
    UserRepo.createOne(repo, name: "Ricardo")

    assert UserRepo.findOne(repo,  1) == %User{id: 1, name: "Juan"}
    assert UserRepo.findOne(repo,  2) == %User{id: 2, name: "Ricardo"}
  end

  test "UserRepoImple2.db is nil" do
    repo = %UserRepoImpl2{db: nil}
    assert_raise UndefinedFunctionError, fn -> UseRepo.findOne(repo, 1) end
  end

  test "UserRepoImple2 as struct" do
    db_handler = PostgresMock.create()
    repo = UserRepoImpl2.create(db_handler)

    assert UserRepo.createOne(repo, name: "Juan")    == %User{id: 1, name: "Juan"}
    assert UserRepo.createOne(repo, name: "Ricardo") == %User{id: 2, name: "Ricardo"}

    assert UserRepo.findOne(repo,  1) == %User{id: 1, name: "Juan"}
    assert UserRepo.findOne(repo,  2) == %User{id: 2, name: "Ricardo"}

    assert UserRepo.findOne(repo, -1) == nil
    assert UserRepo.findOne(repo,  0) == nil
    assert UserRepo.findOne(repo,  3) == nil
    assert UserRepo.findOne(repo,  4) == nil
  end

end
