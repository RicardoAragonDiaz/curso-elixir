import Config

config :myapp, MyApps.Repo,
  database: "myapp_repo",
  username: "postgres",
  password: "123",
  hostname: "localhost"
config :myapp, ecto_repos: [MyApps.Repo]
