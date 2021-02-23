defmodule Redsocial.User do
  use Ecto.Schema
  @timestamps_opts [type: :utc_datetime]

  schema "users" do
    field     :name,     :string
    field     :lastname, :string
    field     :email,    :string
    field     :age,      :integer
    field     :status,   :integer
    has_many  :friends,  Redsocial.Friend
    has_many  :posts,    Redsocial.Post
    timestamps()
  end

  def changeset(users, params \\ %{}) do
    users
    |> Ecto.Changeset.cast(params, [:name, :lastname, :email, :age, :status])
    |> Ecto.Changeset.validate_required([:name, :lastname, :email, :age, :status])
  end

end


## falta
# 1. Doble insert a -> b  y b -> a
# 2. Automatizar todo los insert
# 3. Paguinacion añadir la tabla friends con comments  <:ok>
# --------------------------------------------------------------------
# alias Redsocial.{Friend, User, Post, Comment, Repo}
# user = %User{name: "Ricardo", lastname: "Aragon", email: "ricardo@gmail.com", age: 27, status: 1}
# user = Repo.insert!(user)
# >>> insert other user <<<
# user2 = %User{name: "Juan Camilo", lastname: "Aragon", email: "juank@gmail.com", age: 25, status: 1}
# user2 = Repo.insert!(user2)
# >>> insert other user <<<
# user3 = %User{name: "Sandra F.", lastname: "Sanchez", email: "sandra@gmail.com", age: 18, status: 1}
# user3 = Repo.insert!(user3)

# friend = Ecto.build_assoc(user, :friends, %{friend_id: user2.id})
# Repo.insert!(friend)

# post1 = Ecto.build_assoc(user, :posts, %{title: "Feliz Cumple Anios..!", content: "Dios te bendiga por siempre amig@", status: 1})
# post2 = Ecto.build_assoc(user, :posts, %{title: "Hola..!", content: "Bienvenidos", status: 1})
# post3 = Ecto.build_assoc(user, :posts, %{title: "Favor Compartir", content: "prueba contenido 1", status: 1})
# post4 = Ecto.build_assoc(user, :posts, %{title: "titulo 1", content: "prueba contenido 2", status: 1})
# post5 = Ecto.build_assoc(user, :posts, %{title: "titulo 3", content: "prueba contenido 3", status: 1})
# post6 = Ecto.build_assoc(user, :posts, %{title: "titulo 4", content: "prueba contenido 4", status: 1})
# post7 = Ecto.build_assoc(user, :posts, %{title: "titulo 5", content: "prueba contenido 5", status: 1})
# post8 = Ecto.build_assoc(user, :posts, %{title: "titulo 6", content: "prueba contenido 6", status: 1})
# post9 = Ecto.build_assoc(user, :posts, %{title: "titulo 7", content: "prueba contenido 7", status: 1})
# post10 = Ecto.build_assoc(user, :posts, %{title: "titulo 8", content: "prueba contenido 8", status: 1})
# post11 = Ecto.build_assoc(user, :posts, %{title: "titulo 9", content: "prueba contenido 9", status: 1})
# post12 = Ecto.build_assoc(user, :posts, %{title: "titulo 10", content: "prueba contenido 10", status: 1})
# post13 = Ecto.build_assoc(user, :posts, %{title: "titulo 11", content: "prueba contenido 11", status: 1})
# post14 = Ecto.build_assoc(user, :posts, %{title: "titulo 12", content: "prueba contenido 12", status: 1})
# post15 = Ecto.build_assoc(user, :posts, %{title: "titulo 13", content: "prueba contenido 13", status: 1})
# post16 = Ecto.build_assoc(user, :posts, %{title: "titulo 14", content: "prueba contenido 14", status: 1})
# post17 = Ecto.build_assoc(user, :posts, %{title: "titulo 15", content: "prueba contenido 15", status: 1})
# post18 = Ecto.build_assoc(user, :posts, %{title: "titulo 16", content: "prueba contenido 16", status: 1})
# post19 = Ecto.build_assoc(user, :posts, %{title: "titulo 17", content: "prueba contenido 17", status: 1})
# post20 = Ecto.build_assoc(user, :posts, %{title: "titulo 18", content: "prueba contenido 18", status: 1})


# post1 = Repo.insert!(post1)

# post2 = Repo.insert!(post2)
# post3 = Repo.insert!(post3)
# post4 = Repo.insert!(post4)
# post5 = Repo.insert!(post5)
# post6 = Repo.insert!(post6)
# post7 = Repo.insert!(post7)
# post8 = Repo.insert!(post8)
# post9 = Repo.insert!(post9)
# post10 = Repo.insert!(post10)
# post11 = Repo.insert!(post11)
# post12 = Repo.insert!(post12)
# post13 = Repo.insert!(post13)
# post14 = Repo.insert!(post14)
# post15 = Repo.insert!(post15)
# post16 = Repo.insert!(post16)
# post17 = Repo.insert!(post17)
# post18 = Repo.insert!(post18)
# post19 = Repo.insert!(post19)
# post20 = Repo.insert!(post20)


#
# comment = Ecto.build_assoc(post1, :comments, %{name: "Agradecimientos", comment: "Gracias Amig@." , status: 1})
# comment = Repo.insert!(comment)
#
# query = from(p in Redsocial.Post, order_by: [asc: p.inserted_at, asc: p.id])
# page = Redsocial.Repo.paginate(query, cursor_fields: [:inserted_at, :id], limit: 10)
