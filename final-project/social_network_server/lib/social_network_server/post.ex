defmodule SocialNetworkServer.Post do
  use Ecto.Schema
  @timestamps_opts [type: :utc_datetime]

  schema "posts" do
    field      :title,    :string
    field      :content,  :string
    field      :status,   :integer
    has_many   :comments, SocialNetworkServer.Comment
    belongs_to :user,     SocialNetworkServer.User
    timestamps()
  end

  def changeset(posts, params \\ %{}) do
    posts
    |> Ecto.Changeset.cast(params, [:title, :content, :status])
    |> Ecto.Changeset.validate_required([:title, :content, :status])
  end

end
