defmodule Redsocial.Comment do
  use Ecto.Schema
  @timestamps_opts [type: :utc_datetime]

  schema "comments" do
    field      :name,    :string
    field      :comment, :string
    field      :status,  :integer
    belongs_to :post,    Redsocial.Post
    timestamps()
  end
end
