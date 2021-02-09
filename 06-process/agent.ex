{:ok, pid}= Agent.start_link(fn -> %{} end)
Agent.update(pid, fn map -> Map.put(map, :hello, "world") end)
Agent.get(pid, fn map -> Map.get(map, :hello) end)

##
{:ok, agent} = Agent.start_link fn -> 123 end
IO.puts Agent.get_and_update(agent, fn state -> {state - 5, state + 1} end )
IO.puts Agent.get(agent, fn x -> x end ) # 124
