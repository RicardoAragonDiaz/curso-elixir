defmodule SocialNetworkServerWeb.UserController do
  use SocialNetworkServerWeb, :controller

  alias SocialNetworkServer.{User, Repo}

  def index(conn, _params) do
    users = User |> Repo.all()
    render(conn, "index.html", users: users)
  end

  def show(conn, params) do
    user =  User |> Repo.get(params["id"])
    render(conn, "show.html", name: user.name)
  end

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render(conn, "createU.html", changeset: changeset)
  end

  def create(conn, params) do
    chs = User.changeset(%User{}, params["user"])
    if chs.valid? do
      SocialNetwork.register_user(params["user"])
      conn
      |> put_flash(:info, "ok,  inserted record")
      |> redirect(to: "/users")
    else
      conn
      |> put_flash(:error, "Something went wrong")
      |> redirect(to: "/users")
    end
  end

end
