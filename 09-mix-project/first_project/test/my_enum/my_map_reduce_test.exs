defmodule MyMapreduceTest do
  use ExUnit.Case
  doctest MyMapreduce

  test "double each element in a list" do
    import MyMapreduce, only: [double: 1]
    assert_raise FunctionClauseError, fn ->
      double(1)
    end
    assert double([]) == []
    assert double([1, 3, 5, 6]) == [2, 6, 10, 12]
  end

  test "sum of number in a list" do
    import MyMapreduce, only: [sum: 1]
    assert_raise FunctionClauseError, fn ->
      sum(1)
    end
    assert sum([]) == 0
    assert sum([1]) == 1
    assert sum([1, 3, 5, 6]) == 15
  end

  test "reduce each element in a list" do
    import MyMapreduce, only: [reduce: 3]
    assert_raise FunctionClauseError, fn ->
      reduce(0, 0, "1")
    end
    assert_raise FunctionClauseError, fn ->
      reduce([], 0, "1")
    end
    assert reduce([], 0, &(&1 + &2)) == 0
    assert reduce([1, 2, 3, 4, 5], 0, &(&1 + &2)) == 15
  end

  test "filter each element in a list" do
    import MyMapreduce, only: [filter: 2]
    assert_raise FunctionClauseError, fn ->
      filter(0, "1")
    end

    assert filter([], &(rem(&1, 2) == 0)) == []
    assert filter([1, 2, 3, 4, 5], &(rem(&1, 2) == 0)) == [2, 4]
  end

  test "map each element in a list" do
    import MyMapreduce, only: [map: 2]
    assert_raise FunctionClauseError, fn ->
      map(0, "1")
    end
    assert_raise FunctionClauseError, fn ->
      map([], "1")
    end
    assert_raise FunctionClauseError, fn ->
      map([], fn -> 15 end)
    end
    assert_raise FunctionClauseError, fn ->
      map([], &(&1 + &2))
    end

    assert map([], &(2 * &1)) == []
    assert map([1, 2, 3, 4, 5], &(2 * &1)) == [2, 4, 6, 8, 10]
  end

end
