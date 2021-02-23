defmodule Redsocial.Repo do
  use Ecto.Repo,
    otp_app: :redsocial,
    adapter: Ecto.Adapters.Postgres

  use Paginator
end
