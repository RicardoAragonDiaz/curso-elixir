defmodule Friends.Movie do
  use Ecto.Schema

  schema "movies" do
    field        :title, :string
    field        :tagline, :string
    belongs_to   :distributor, Friends.Distributor
    has_many     :characters, Friends.Character
    many_to_many :actors, Friends.Actor, join_through: "movies_actors" # I'm new!
  end
end

#####
# iex(1)> alias Friends.{Movie, Character, Repo}
## [Friends.Movie, Friends.Character, Friends.Repo]
# iex(2)> movie = %Movie{title: "Ready Player One", tagline: "Something about video games"}
#iex(3)> movie = Repo.insert!(movie)
## INSERT INTO "movies" ("tagline","title") VALUES ($1,$2) RETURNING "id" ["Something about video games", "Ready Player One"]
#iex(4)> character = Ecto.build_assoc(movie, :characters, %{name: "Wade Watts"})
#iex(5)> Repo.insert!(character)
## INSERT INTO "characters" ("movie_id","name") VALUES ($1,$2) RETURNING "id" [1, "Wade Watts"]
#iex(6)> distributor = Ecto.build_assoc(movie, :distributor, %{name: "Netflix"})
#iex(7)> Repo.insert!(distributor)
##INSERT INTO "distributors" ("movie_id","name") VALUES ($1,$2) RETURNING "id" [1, "Netflix"]
#iex(8)> alias Friends.Actor
##Friends.Actor
#iex(9)> actor = %Actor{name: "Tyler Sheridan"}
#iex(10)>  actor = Repo.insert!(actor)
## INSERT INTO "actors" ("name") VALUES ($1) RETURNING "id" ["Tyler Sheridan"]
#iex(11)> movie = Repo.preload(movie, [:distributor, :characters, :actors])
## SELECT c0."id", c0."name", c0."movie_id", c0."movie_id" FROM "characters" AS c0 WHERE (c0."movie_id" = $1) ORDER BY c0."movie_id" [1]
## SELECT a0."id", a0."name", m1."id" FROM "actors" AS a0 INNER JOIN "movies" AS m1 ON m1."id" = ANY($1) INNER JOIN "movies_actors" AS m2 ON m2."movie_id" = m1."id" WHERE (m2."actor_id" = a0."id") ORDER BY m1."id" [[1]]
## SELECT d0."id", d0."name", d0."movie_id", d0."movie_id" FROM "distributors" AS d0 WHERE (d0."movie_id" = $1) [1]
#iex(12)> movie_changeset = Ecto.Changeset.change(movie)
#iex(13)> movie_actors_changeset = movie_changeset |> Ecto.Changeset.put_assoc(:actors, [actor])
#iex(14)> Repo.update!(movie_actors_changeset)
## INSERT INTO "movies_actors" ("actor_id","movie_id") VALUES ($1,$2) [1, 1]
#iex(15)> changeset = movie_changeset |> Ecto.Changeset.put_assoc(:actors, [%{name: "Gary"}])
#iex(16)> Repo.update!(changeset)
## INSERT INTO "actors" ("name") VALUES ($1) RETURNING "id" ["Gary"]
## INSERT INTO "movies_actors" ("actor_id","movie_id") VALUES ($1,$2) [2, 1]
