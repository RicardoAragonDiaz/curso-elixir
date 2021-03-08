#defmodule UserRepo do
#  def createOne(db_handler, keywords) do
#    DbHandler.create_user(db_handler, %{name: keywords[:name]})
#  end
#
#  def findOne(db_handler, id) do
#    DbHandler.find_user(db_handler, id)
#  end
#
#end















defprotocol UserRepo do
  def createOne(repo, keywords)
  def findOne(repo, id)
end

defmodule UserRepoImpl do
  defstruct [:pid]
  use GenServer

  def create(db_handler) do
    {:ok, pid} = GenServer.start_link(__MODULE__, db_handler)
    %UserRepoImpl{pid: pid}
  end

  @impl true
  def init(state), do: {:ok, state}

  @impl true
  def handle_call({:create_one, keywords}, _, db_handler) do
    user = DbHandler.create_user(db_handler, %{name: keywords[:name]})
    {:reply, user, db_handler}
  end

  @impl true
  def handle_call({:find_one, id}, _, db_handler) do
    user = DbHandler.find_user(db_handler, id)
    {:reply, user, db_handler}
  end
end

defimpl UserRepo, for: UserRepoImpl  do
  def createOne(repo, keywords) when repo.pid != nil do
    GenServer.call(repo.pid, {:create_one, keywords})
  end

  def findOne(repo, id) when repo.pid != nil do
    GenServer.call(repo.pid, {:find_one, id})
  end
end



defmodule UserRepoImpl2 do
  @enforce_keys [:db]
  defstruct [:db]

  def create(db_handler), do: %UserRepoImpl2{db: db_handler}
end

defimpl UserRepo, for: UserRepoImpl2  do
  def createOne(repo, keywords) when repo.db != nil do
    DbHandler.create_user(repo.db, %{name: keywords[:name]})
  end

  def findOne(repo, id) when repo.db != nil do
    DbHandler.find_user(repo.db, id)
  end
end
