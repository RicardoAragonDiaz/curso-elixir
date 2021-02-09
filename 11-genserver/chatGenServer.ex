defmodule ChatGenServer do
  use GenServer

  def create(initial_state \\ 0) do
    GenServer.start_link(__MODULE__, [initial_state])
  end

  def get_msg(pid), do: GenServer.call(pid, :get_msg)
  def add_msg(pid, msg), do: GenServer.cast(pid, {:add_msg, msg})

  def init(msgs), do: {:ok, msgs}

  def handle_call(:get_msg, _form, msgs), do: {:reply, msgs, msgs}
  def handle_cast({:add_msg, msg}, msgs), do: {:noreply, [msg | msgs]}

end
