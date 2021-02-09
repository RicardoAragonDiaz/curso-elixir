defmodule ObsGenServerTest do
  use ExUnit.Case
  doctest Obs2

  test "Initial state 2" do
   {:ok, subject} = Obs2.create()
   assert Obs2.read(subject) == 0

   {:ok, subject} = Obs2.create(0)
   assert Obs2.read(subject) == 0

   {:ok, subject} = Obs2.create(1)
   assert Obs2.read(subject) == 1
  end

  test "attach y detach increment and notify 2" do
    {:ok, subject} = Obs2.create()
    Obs2.increment(subject)
    assert Obs2.await() == "Ther was not a answer"

    Obs2.attach(subject)
    Obs2.increment(subject)
    assert_receive 2

    Obs2.detach(subject)
    Obs2.increment(subject)
    assert Obs2.await() == "Ther was not a answer"
  end

  test "attach y detach decrement and notify 2" do
    {:ok, subject} = Obs2.create(5)
    Obs2.decrement(subject)
    assert Obs2.await() == "Ther was not a answer"

    Obs2.attach(subject)
    Obs2.decrement(subject)
    assert Obs2.await() == 3

    Obs2.detach(subject)
    Obs2.decrement(subject)
    assert Obs2.await() == "Ther was not a answer"
  end

end
