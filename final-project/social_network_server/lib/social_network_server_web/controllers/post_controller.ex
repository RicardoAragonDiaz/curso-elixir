defmodule SocialNetworkServerWeb.PostController do
  use SocialNetworkServerWeb, :controller

  alias SocialNetworkServer.{User, Repo, Post}

  def index(%Plug.Conn{query_params: query_params} = conn, _params) do
    try do
      page = String.to_integer(query_params["page"])
      size = String.to_integer(query_params["size"])
      lists = SocialNetwork.paginate(query_params["user_id"], page, size)
      render(conn, "index.html", lists: lists)
    rescue
      e -> json(conn, %{error: "FAIL - Something went wrong"})
    end
  end

  #def show(conn, params) do
  #  #user = Repo.get(1)
  # render(conn, "show.html",params: params["id"])
  #end
#
  #def new(conn, _params) do
  #  changeset = Post.changeset(%Post{})
  #  render(conn, "createP.html", changeset: changeset)
  #end
#
  def create(%Plug.Conn{body_params: body_params} = conn, _params) do

    try do
      user = User |> Repo.get(body_params["user_id"])
      Excute.savePost(user, body_params["title"], body_params["content"],
                     body_params["status"], body_params["name_coment"], body_params["comment_"])
      conn |> json(%{message: "OK - SUCCESSFULL POST" })
    rescue
      e -> json(conn, %{message: "FAIL - FAIL POST (user_Id not found)" })
    end
  end
end
