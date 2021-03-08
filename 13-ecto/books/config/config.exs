import Config

config :books, Books.Repo,
  database: "books_repo",
  username: "postgres",
  password: "123",
  hostname: "localhost"
config :books, ecto_repos: [Books.Repo]



# mix new cars --sup
# mix deps.get
# mix ecto.gen.repo -r  Cars.Repo
# mix ecto.gen.migration create_book
# mix ecto.create
