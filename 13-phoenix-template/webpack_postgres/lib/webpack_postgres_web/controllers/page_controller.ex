defmodule WebpackPostgresWeb.PageController do
  use WebpackPostgresWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
