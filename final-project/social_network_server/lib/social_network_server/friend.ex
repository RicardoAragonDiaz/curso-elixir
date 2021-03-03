defmodule SocialNetworkServer.Friend do
  use Ecto.Schema

  schema "friends" do
    belongs_to :user,      SocialNetworkServer.User
    field      :friend_id, :integer
  end
end
