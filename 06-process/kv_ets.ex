defmodule KvEts do

  @initial_state {:hello, "Mundo"}

  def start_link do
    myTable = :ets.new(:myTable, [:set, :protected])
    :ets.insert(myTable, @initial_state)
    myTable
  end

  def read(ref_pid, key) do
    case :ets.lookup(ref_pid, key) do
      [] -> nil
      [{_, val}] -> value
    end
  end

  def insert(ref_pid, key, val) do
    :ets.insert(ref_pid, {key, val})
  end
end

kv = KvEts.start_link()

value = KvEts.read(kv, :hello)
IO.inspect value # "Mundo"

KvEts.update(kv, :hello, "World!")

value =  KvEts.read(kv, :hello)
IO.puts value # World!
