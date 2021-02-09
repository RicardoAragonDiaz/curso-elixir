defmodule KvAgent do

  @vsn 1

  @initial_state %{hello: "Mundo"}

  def start_link do
    :ets.new(table, [:named_table, read_concurrency: true])
  end

  def read(kv_pid, key) do
    Agent.get(kv_pid, fn map -> Map.get(map, key) end)
  end

  def update(kv_pid, key, value) do
    Agent.update(kv_pid, fn map -> Map.put(map, key, value) end)
  end
end


# ind a OOP language
# kv = KV()
{:ok, kv} = KV.start_link()

# value = kv.read(:hello)
# print(value)
value = KV.read(kv, :hello)
IO.inspect value

# kv.update(:hello, "World")
KV.update(kv, :hello, "World")

# value = kv.read(:hello)
#print(cvalue)
value =  KV.read(kv, :hello)
IO.puts value






defmodule KV.Registry do
  use GenServer

  def start_link(table, event_manager, buckets, opts \\ []) do
    GenServer.start_link(__MODULE__, {table, event_manager, buckets}, opts)
  end

  def lookup(table, name) do
    case :ets.lookup(table, name) do
      [{^name, bucket}] -> {:ok, bucket}
      [] -> :error
    end
  end

  def create(server, name) do
    GenServer.cast(server, {:create, name})
  end

  def init({table, events, buckets}) do
    ets  = :ets.new(table, [:named_table, read_concurrency: true])
    refs = HashDict.new
    {:ok, %{names: ets, refs: refs, events: events, buckets: buckets}}
  end

  def handle_cast({:create, name}, state) do
    case lookup(state.names, name) do
      {:ok, _pid} ->
        {:noreply, state}
      :error ->
        {:ok, pid} = KV.Bucket.Supervisor.start_bucket(state.buckets)
        ref = Process.monitor(pid)
        refs = HashDict.put(state.refs, ref, name)
        :ets.insert(state.names, {name, pid})
        GenEvent.sync_notify(state.events, {:create, name, pid})
        {:noreply, %{state | refs: refs}}
    end
  end

end
