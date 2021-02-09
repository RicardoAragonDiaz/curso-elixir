## Similar to spawn but linked with its parent
pid = spawn_link fn -> 1 + 2 end
IO.inspect(pid)

#primitivo
pid1 = spawn fn -> raise "Opps! There's an error" end
#pid2 = spawn_link fn -> raise "Opps! There's an error" end
IO.inspect pid1
#IO.inspect pid2


### Task
# based on spawn
{:ok, pid} = Task.start fn -> 1 + 2 end
IO.inspect pid # #PID<0.101.0>
#TODO: raise an error inside the Task.start
#Task.start fn -> raise "Opps!" end

# based on spawn_link
{:ok, pid} = Task.start_link fn -> 1 + 2 end
IO.inspect pid # #PID<0.101.0>
#TODO: raise an error inside the Task.start
#Task.start_link fn -> raise "Opps!" end
