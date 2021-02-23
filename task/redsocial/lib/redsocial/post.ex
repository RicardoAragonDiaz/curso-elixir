defmodule Redsocial.Post do
  use Ecto.Schema
  @timestamps_opts [type: :utc_datetime]

  schema "posts" do
    field      :title,    :string
    field      :content,  :string
    field      :status,   :integer
    has_many   :comments, Redsocial.Comment
    belongs_to :user,     Redsocial.User
    timestamps()
  end

end
