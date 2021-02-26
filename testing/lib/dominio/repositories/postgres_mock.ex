defmodule PostgresMock do
  defstruct [:pid]

  use GenServer

  def create() do
    {:ok, pid} = GenServer.start_link(__MODULE__, {0, %{}})
    %PostgresMock{pid: pid}
  end

  @impl true
  def init(state), do: {:ok, state}

  @impl true
  def handle_call({:create_user, %{name: name}}, _, {user_id, users}) do
    new_id = user_id + 1
    new_user = %User{id: new_id, name: name}
    users = Map.put(users, new_id, new_user)
    state = {new_id, users}
    {:reply, new_user, state}
  end

  @impl true
  def handle_call({:find_user, id}, _, {user_id, users} = state) do
    if user_id < id or id < 1 do
      {:reply, nil, state}
     else
      {:reply, users[id], state}
     end
  end
end

defimpl DbHandler, for: PostgresMock do
  def create_user(handler, %{name: _} = map) do
    GenServer.call(handler.pid, {:create_user, map})
  end

  def find_user(handler, id) do
    GenServer.call(handler.pid, {:find_user, id})
  end
end
