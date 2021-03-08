
defmodule Books.Weather do
  use Ecto.Schema

  schema "weathers" do
    field :city     # Defaults to type :string
    field :temp_lo, :integer
    field :temp_hi, :integer
    field :prcp,    :float, default: 0.0
  end

  def changeset(weather, params \\ %{}) do
    weather
    |> Ecto.Changeset.cast(params, [:city, :temp_lo, :temp_hi, :prcp])
    |> Ecto.Changeset.validate_required([:city, :temp_lo, :temp_hi, :prcp])
  end
end

defmodule Books.App do
  import Ecto.Query
  alias Books.{Weather, Repo}

  def keyword_query do
    query =
      from w in Books.Weather,
           where: w.prcp > 0.0 or is_nil(w.prcp),
           select: w

    Repo.all(query)
  end

  def pipe_query do
    Weather
    |> where(city: "Krakow")
    |> order_by(:temp_lo)
    |> limit(10)
    |> Repo.all
  end
end
