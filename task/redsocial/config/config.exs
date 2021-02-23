import Config

config :redsocial, Redsocial.Repo,
  database: "redsocialdb",
  username: "postgres",
  password: "123",
  hostname: "localhost"
config :redsocial, ecto_repos: [Redsocial.Repo]
