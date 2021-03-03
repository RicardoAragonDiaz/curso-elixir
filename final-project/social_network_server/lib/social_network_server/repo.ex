defmodule SocialNetworkServer.Repo do
  use Ecto.Repo,
    otp_app: :social_network_server,
    adapter: Ecto.Adapters.Postgres
end
