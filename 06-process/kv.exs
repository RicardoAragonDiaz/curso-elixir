defmodule KV do
  def start_link do
    Task.start_link(fn -> loop(%{}) end)
  end

  defp loop(map) do
    receive do
      {:read, key, caller} ->
        send caller, Map.get(map, key)
        loop(map)
      {:update, key, value} -> Map.put(map, key, value) |> loop()
    end
  end

  def request(kv_pid, key) do
    caller = self()
    send kv_pid, {:read, key, caller}
  end

  # read = request + await
  def read(kv_pid, key) do
    request(kv_pid, key)
    receive do
      value -> value
    end
  end

  def update(kv_pid, key, value) do
    send kv_pid, {:update, key, value}
  end
end


# ind a OOP language
# kv = KV()
{:ok, kv} = KV.start_link()

KV.request(kv, :hello)
value = receive do
  value -> value
end
IO.inspect value

# value = kv.read(:hello)
# print(value)
value = KV.read(kv, :hello)
IO.inspect value

# kv.update(:hello, "World")
KV.update(kv, :hello, "World")

KV.request(kv, :hello)
value = receive do
  value -> value
end
IO.inspect value

# value = kv.read(:hello)
#print(cvalue)
value =  KV.read(kv, :hello)
IO.puts value

#######
Process.register(kv, :my_kv)
value = KV.read(:my_kv, :hello)
IO.inspect value # nil

KV.update(:my_kv, :bye, "bye bye")
value = KV.read(:my_kv, :bye)
IO.inspect value # "bye bye"
