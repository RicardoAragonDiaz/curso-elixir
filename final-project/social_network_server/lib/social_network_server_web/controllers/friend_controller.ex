defmodule SocialNetworkServerWeb.FriendController do
  use SocialNetworkServerWeb, :controller

  alias SocialNetworkServer.{User, Repo}

  def create(%Plug.Conn{body_params: body_params} = conn, %{"user_id" => user_id}) do

    try do
      user  = User |> Repo.get(user_id)
      user2 = User |> Repo.get(body_params["friend_id"])
      Excute.saveFriend(user, user2)
      json(conn, %{message: "OK - ASSOCIATION  SUCCESSFULL " })
    rescue
      e -> json(conn, %{message: "FALLO - ASSOCIATION FALLO (user_Id not found)" })
    end
  end

end
