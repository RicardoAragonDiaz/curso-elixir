defmodule Friends.Distributor do
  use Ecto.Schema

  schema "distributors" do
    field      :name,   :string
    has_many   :movie,  Friends.Movie
  end
end

# iex(1)> alias Friends.{Movie, Character, Repo, Distributor,.Actor}
# iex(2)> distributor = %Distributor{name: "Netflix"}
# iex(3)> distributor = Repo.insert!(distributor)
# iex(6)> movie = Ecto.build_assoc(distributor, :movie, %{title: "Ready Player One", tagline: "Something about video games"})
# iex(7)> Repo.insert!(movie)
# iex(4)> character = Ecto.build_assoc(movie, :characters, %{name: "Wade Watts"})
# iex(5)> Repo.insert!(character)
#iex(9)> actor = %Actor{name: "Tyler Sheridan"}
#iex(10)>  actor = Repo.insert!(actor)
