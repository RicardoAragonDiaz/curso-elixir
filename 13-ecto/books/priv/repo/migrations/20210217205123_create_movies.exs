defmodule Books.Repo.Migrations.CreateMovies do
  use Ecto.Migration

  def change do
    create table(:actors) do
      add :name, :string
    end

    create table(:movies) do
      add :title, :string
      add :tagline, :string
    end

    create table(:movies_actors) do
      add :movie_id, references(:movies)
      add :actor_id, references(:actors)
    end

    create unique_index(:movies_actors, [:movie_id, :actor_id])
  end
end
