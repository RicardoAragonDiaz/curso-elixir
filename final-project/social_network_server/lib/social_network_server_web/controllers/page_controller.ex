defmodule SocialNetworkServerWeb.PageController do
  use SocialNetworkServerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
