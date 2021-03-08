defmodule Bye do

  def bye(pid) do
    Node.spawn_link(pid, fn ->
      receive do
        {:hi, client} -> send(client, :bye)
      end
    end)
  end
end
