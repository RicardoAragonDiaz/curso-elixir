defmodule GServer.Supervisor do
  use Supervisor

  def start_link(opts \\ 0) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  def init() do
    children = [
      #GServer
      #{GServer, name: GServer}
      {GServer, name: :obs}
    ]
    Supervisor.init(children, strategy: :one_for_one) # si el hijo muere se reinicia
  end
end

# {:ok, sup} = GServer.Supervisor.start_link([])
#[{_, observer, _, _}] = Supervisor.which_children(sup)
#observer
## comenzar a probar los comando por iex
#{:ok, balance} = GServer.create(1000)
#
#GServer.deposit(balance, 100)
#GServer.withdraw(balance, 30)
#GServer.transfer(balance, 80)
#GServer.read(balance)
#
# {:ok, sup} = GServer.Supervisor.start_link([])
# GServer.read(:obs)
