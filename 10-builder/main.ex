import User

user =
  create_user()
  |> set_name("Ricardo", "Aragon")
  |> set_contry("Colombia")
  |> set_languages(["spanish", "english", "gesman"])

inspect(user) |> IO.puts()
