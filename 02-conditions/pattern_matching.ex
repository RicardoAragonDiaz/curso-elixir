# tuples probadas en iex
{a, b, c} = {1, "hello", :ok}
{a, _, c} = {1, "hello", :ok} # "hello" is ignored

b = true
{a, ^b, _} = {1, true, "ok"} # b is compared whith true

b = false
{a, ^b, _} = {1, true, "ok"} # thrws a MatchError

{x, x} = {2, 2} # x = 2
{x, x} = {2, 3} # thrws a MatchError

# lists
[a, _, c] = [1, "hello", :ok]
[a, b, c] = [1, "hello", :ok] # "hello" is ignored

b = true
[a, ^b, _] = [1, true, "ok"] # b is compared whith true

b = false
[a, ^b, _] = [1, true, "ok"] # thrws a MatchError

[head | tail] = [] # ** throws (MatchError) no match of right hand side value: []
[head | tail] = [5.0]         #head = 5.0, tail = []
[head | tail] = [5.0, 3]      #head = 5.0, tail = [3]
[head | tail] = [5.0, 3, :ok] #head = 5.0, tail = [3, :ok]

[_ | tail] = [5.0, 3, :ok] # tail = [3, :ok]
[ head| _] = [5.0, 3, :ok] # head = 5.0

[1 | tail] = [1, 2, 3] # tail = [2, 3]
[1 | tail] = [1, 2, 3] # throws a (MatchError)

a = 1
[^a | tail] = [1, 2 ,3] # tail = [2, 3]

a = 2
[^a | tail] = [1, 2 ,3] # throws a (MatchError)
