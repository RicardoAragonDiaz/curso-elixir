defmodule Excute do
  alias SocialNetworkServer.Repo
  def newData() do
    user = %{name: "Ricardo", lastname: "Aragon", email: "ricardo@gmail.com", age: 27, status: 1}
    user1 = %{name: "Daniel", lastname: "Casas", email: "daniel@gmail.com", age: 18, status: 1}
    user2 = %{name: "Juan Camilo", lastname: "Aragon", email: "juank@gmail.com", age: 35, status: 1}
    user3 = %{name: "Sandra F.", lastname: "Sanchez", email: "sandra@gmail.com", age: 9, status: 1}

    user = SocialNetwork.register_user(user)
    user1 = SocialNetwork.register_user(user1)
    user2 = SocialNetwork.register_user(user2)
    user3 = SocialNetwork.register_user(user3)

    saveFriend(user, user1)
    saveFriend(user, user3)
    saveFriend(user1, user2)

    savePost(user, "Feliz Cumple Anios..!", "Dios te bendiga por siempre amig@", 1, "Agradecimientos", "Gracias Amig@.")
    savePost(user1, "Feliz Cumple!", "Benciones Compa.!", 1, "Agradecer", "Gracias Companero" )
  end

  def saveFriend(a, b) do
    friend1 = Ecto.build_assoc(a, :friends, %{friend_id: b.id})
    Repo.insert!(friend1)
    friend11 = Ecto.build_assoc(b, :friends, %{friend_id: a.id})
    Repo.insert!(friend11)
  end

  def savePost(user_id, title, content, status, name_coment, comment_ ) do
    post = Ecto.build_assoc(user_id, :posts, %{title: title, content: content, status: status})
    post = Repo.insert!(post)

    saveComment(post, name_coment, comment_, status)
  end

  def saveComment(post_id, name, comment, status) do
    comment1 = Ecto.build_assoc(post_id, :comments, %{name: name,  comment: comment, status: status})
    Repo.insert!(comment1)
  end
end
