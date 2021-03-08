defmodule Myumbrella.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "0.1.0",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Dependencies listed here are available only for this
  # project and cannot be accessed from applications inside
  # the apps folder.
  #
  # Run "mix help deps" for examples and options.
  defp deps do
    []
  end
end

# mix new myumbrella --umbrella
# C:\Users\riaragon\curso-elixir\17-umbrella\myumbrella\apps>mix new kv_server --module KVServer --sup
# h :zip.foldl
# h :zip.foldl(fn _, _, _, acc -> acc + 1 end, 0, :binary.bin_to_list("hola.zip"))
# h :binary.bin_to_list
# parrafo = "este es un texto largo,  lorem imp......."
# compressed = :zlib.compress parrafo
# byte_size parrafo # 635
# byte_size compressed # 371
# :zlib.uncompress compressed
#####################
#iex(1)> digraph = :digraph.new
#{:digraph, #Reference<0.4110709902.3950903299.19332>,
#Reference<0.4110709902.3950903299.19333>,
#Reference<0.4110709902.3950903299.19334>, true}
#iex(2)>  coords = [{0.0, 0.0},{1.0, 0.0}, {1.0, 1.0}]
# [v0, v1, v2] = (for x <- coords, do: :digraph.add_vertex(digraph, x))
# iex(4)> h :digraph.add_vertex
# :digraph.add_adge(digraph, v1, v0)
# diagraph |> :digraph.add_adge(digraph, v1, v0)
# :digraph.get_short_path((digraph, v2, v0)) # fasle
# :digraph.get_short_path((digraph, v1, v2)) # [....]
# :digraph.get_short_path((digraph, v2, v1)) # false
# :digraph.get_short_path((digraph, v0, v2)) # [....]
# :digraph.get_short_path((digraph, v1, v2)) # [....]
