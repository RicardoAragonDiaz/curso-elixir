defmodule WebpackPostgresWeb.HelloController do
  use WebpackPostgresWeb, :controller

  #plug WebpackPostgresWeb.Plug.Locale, "en"

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(%Plug.Conn{query_params: query_params} = conn, %{"messenger" => messenger}) do
    case query_params["format"] do
      "json" -> json(conn, %{id: messenger})
      "text" -> text(conn, "From messenger #{messenger}")
      _      ->
        conn
        |> put_flash(:info, "Welcome to Phoenix, from flash info!")
        |> put_flash(:error, "Let's pretend we have an error.")
        |> render("show.html", messenger: messenger)
    end
  end
end
