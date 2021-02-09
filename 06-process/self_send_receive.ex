await1 = fn ->
  receive do
    {:hello, msg} -> msg
    {:bye, msg} -> msg <> " " <> msg
    {:pid, pid} -> pid
  end
end

await2 = fn ->
  receive do
    {:hello, msg} -> msg
    {:bye, msg} -> msg <> " " <> msg
    {:pid, pid} -> pid
    _ -> {:error, "there wasn't a match"}

  end
end

await3 = fn millis ->
  receive do
    {:hello, msg} -> msg
    {:bye, msg} -> msg <> " " <> msg
    {:pid, pid} -> pid
  after
    millis -> { "Timeout after #{millis} milliseconds"}
  end
end

test = fn await ->
  send self(), {:hello, "World"}
  IO.puts await.() # "World"

  send self(), {:bye, "bye"}
  IO.puts await.() # "bye bye"

  send self(), {:hi, "?"}
  IO.inspect await.() #
end

#test.(await1) # TODO: uncomment this line
# "World"
# "bye bye"
# --------- freezed

test.(await2)
#World
#bye bye
#{:error, "there wasn't a match"}

test.(fn -> await3.(1000) end)
#World
#bye bye
#{"Timeout after 1000 milliseconds"}


IO.puts("======================")
spawn fn -> send self(), {:hello, "World"} end
IO.inspect await3.(1000) # Timeout

IO.puts "----------------------"
self_pid = self()
pid = spawn fn ->
  spid = self()
  send self_pid, {:pid, spid}
end
second_pid = await3.(1000) # process is of the spawn
IO.puts pid === second_pid
