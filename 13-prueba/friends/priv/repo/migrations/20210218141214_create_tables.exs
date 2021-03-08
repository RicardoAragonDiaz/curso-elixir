defmodule Friends.Repo.Migrations.CreateTables do
  use Ecto.Migration

  def change do
    create table(:actors) do
      add :name, :string
    end

    create table(:distributors) do
      add :name, :string
    end

    create table(:movies) do
      add :title, :string
      add :tagline, :string
      add :distributor_id, references(:distributors), null: false
    end

    create table(:movies_actors) do
      add :movie_id, references(:movies)
      add :actor_id, references(:actors)
    end

    create table(:characters) do
      add :name, :string
      add :movie_id, references(:movies) null: false
    end

    #create unique_index(:movies, [:distributor_id])

    create unique_index(:movies_actors, [:movie_id, :actor_id])
  end
end
