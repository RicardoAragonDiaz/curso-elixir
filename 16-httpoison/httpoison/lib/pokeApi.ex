defmodule PokeApi do

  def fetch_many(limit, offset \\ nil) do
    url = "https://pokeapi.co/api/v2/pokemon?limit=#{limit}"
    url = if offset != nil, do: url <> "&offset=#{offset}", else: url
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{body: body}} ->
        {_, data} = JSON.decode(body)
        data["results"]
      {:error, _} -> nil
    end
  end

  def fetch_many_with_params(limit, offset \\ nil) do
    url = "https://pokeapi.co/api/v2/pokemon"
    params = [limit: limit, offset: offset]
    options = [params: params]
    case HTTPoison.get(url, [], options) do
      {:ok, %HTTPoison.Response{body: body}} ->
        {_, data} = JSON.decode(body)
        data["results"]
      {:error, _} -> nil
    end
  end

end

#PokeApi.fetch_many(10)
#PokeApi.fetch_many_with_params(10, 5)
