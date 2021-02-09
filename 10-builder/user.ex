defmodule User do
  defstruct [:name, ::lastname, :country, languages: []]

  def set_name(user, name, lastname) do
    user |> Map.put(:name, name) |> Map.put(:lastname, lastname)
  end

  def set_country(user, country), do: Map.put(user, :country, country)
  def set_languages(user, languages), do: Map.put(user, :languages, languages)

end
