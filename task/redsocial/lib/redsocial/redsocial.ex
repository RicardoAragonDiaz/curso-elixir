defmodule SocialNetwork do
import Ecto.Query
alias Redsocial.{User, Post, Repo, Friend, Comment}

  def register_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert!()
  end

  def get_user_by_name(name) do
    Repo.get_by!(User, %{name: name})
  end

  def get_comment(id) do
    Comment
    |> Repo.get(id)
    |> Repo.preload(:comments)
  end

  def get_post(title) do
    Post
    |> Repo.get(title)
    |> Repo.preload(:posts)
  end

  def update_user(attrs) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.update()
  end

  def paginate(iduser, page \\ 0, size \\ 10) do
    query = from f in Friend,
            join: p in Post,
            on: f.user_id == p.user_id,
            join: c in Comment,
            on: p.id == c.post_id,
            where: f.friend_id == ^iduser,
            select: {p, c},
            limit: ^size,
            offset: (^page - 1) * ^size
    Repo.all(query)
  end

end
