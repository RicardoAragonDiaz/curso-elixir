defmodule Redsocial.Friend do
  use Ecto.Schema

  schema "friends" do
    belongs_to :user,      Redsocial.User
    field      :friend_id, :integer
  end
end
