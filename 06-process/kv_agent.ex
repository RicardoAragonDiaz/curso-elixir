defmodule KvAgent do
  @moduledoc """
  Provides a Key-Value (KV) process to access a shared state map

  ## Examples

    iex> {:ok, kv} = KV.start_link()
    {:ok, #PID<0.101.0>}
    iex> KV.read(kv, :hello)
    nil
    iex> KV.update(kv, :hello, "Word")
    :ok
    iex>KV.read(kv, :hello)
    "World"
  """

  @vsn 1

  @initial_state %{hello: "Mundo"}

  @doc """
  Creates a pid to read and create/update a Key-value pair

  ## Examples
     iex> {:ok, kv} = KV.start_link()
     {:ok, #PID<0.101.0>}
  """
  def start_link do
    Agent.start_link(fn -> initial_state end)
  end
  @doc """
  read a value for a key. If the key doesn´t exists, returns nil

  ## Examples

      iex> KV.read(kv, :hello)
      nill
  """
  def read(kv_pid, key) do
    Agent.get(kv_pid, fn map -> Map.get(map, key) end)
  end

  @doc """
  Update or creates (if necessary) a value for a key.

  ## Example

      iex> KV.update(kv, :hello, "World")
      :ok
  """
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
