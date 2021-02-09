defmodule Observable do
  use GenServer

  @spec create(integer()) :: pid()
  def create(initial_Value \\ 0) do
    cond do
      initial_Value < 0 -> {:error, "amount can't be negative"}
      true -> GenServer.start_link(__MODULE__, {[], initial_Value})
    end
  end

  def init(value), do: {:ok, value}

  defp add_observer(observers, observer_pid), do: [observer_pid | observers]
  defp remove_observer(observers, observer_pid), do: observers -- [observer_pid]

  def read(subject) do
    GenServer.call(subject, :read)
  end
  def attach(subject), do: GenServer.call(subject, :attach)
  def detach(subject), do: GenServer.call(subject, :detach)
  def increment(subject), do: GenServer.cast(subject, :increment)
  def decrement(subject), do: GenServer.cast(subject, :decrement)

  def handle_call(:read, _from_id, {observers, value}) do
    {:reply, value, {observers, value}}
  end

  def handle_call(:attach, {from_id, _}, {observers, value}) do
    observers = observers |> add_observer(from_id)
    {:reply, :ok, {observers, value}}
  end

  def handle_call(:detach, {from_id, _}, {observers, value}) do
    observers = observers |> remove_observer(from_id)
    {:reply, :ok, {observers, value}}
  end

  def handle_cast(:increment, {observers, value}) do
    result = observers |> notify(value + 1)
    {:noreply, result}
  end

  def handle_cast(:decrement, {observers, value}) do
    result = observers |> notify(value - 1)
    {:noreply, result}
  end

  defp notify(observers, value) do
    observers |> Enum.each(&send(&1, value))
    {observers, value}
  end

  def await(millis \\ 1000) do
    receive do
      count  -> count
    after
      millis -> :timeout
    end
  end

end
