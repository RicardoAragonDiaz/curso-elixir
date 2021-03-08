defmodule Cars.Repo do
  use Ecto.Repo,
    otp_app: :books,
    adapter: Ecto.Adapters.Postgres
end
