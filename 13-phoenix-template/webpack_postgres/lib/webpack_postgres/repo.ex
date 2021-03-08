defmodule WebpackPostgres.Repo do
  use Ecto.Repo,
    otp_app: :webpack_postgres,
    adapter: Ecto.Adapters.Postgres
end
