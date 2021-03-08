defmodule MongoTest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      worker(Mongo, [[name: :mongo, database: "admin", pool_size: 2]])
      # Starts a worker by calling: MongoTest.Worker.start_link(arg)
      # {MongoTest.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MongoTest.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
# {:ok, conn} = Mongo.start_link(url: "mongodb://localhost:27017/config", username: "root", password: "1234", auth_source: "admin")
# cursor = Mongo.find(conn, "estudiantes", %{})
# cursor |> Enum.to_list()

#cursor = Mongo.insert_one!(conn, "estudiantes",
#  %{"email" => "dan@gmail.com", "name" => "Daniel",
#  "phone" => 4141414, "edad" => 25, "lastname" => "Castro"})

# data =  %{"email" => "dan@gmail.com", "name" => "Daniel", "phone" => 4141414, "edad" => 25, "lastname" => "Castro"}
