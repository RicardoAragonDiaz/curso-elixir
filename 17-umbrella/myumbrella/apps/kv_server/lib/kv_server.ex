defmodule KVServer do
  require Logger

  def accept(port) do
    {:ok, socket} = :gen_tcp.listen(port, [:binary, packet: :line, active: false, reuseaddr: true])
    KVServer.Balance.create()
    Logger.info("Aceptando conexiones en el puerto: #{port}")
    loop_acceptor(socket)
  end

  defp loop_acceptor(socket) do
    {:ok, client} = :gen_tcp.accept(socket)
    Task.start_link(fn -> serve(client) end)
    loop_acceptor(socket)
  end

  defp serve(socket) do
    msg = case read_line(socket) do
      {:ok, data} ->
        Logger.info("Mensaje: #{data}")
        case KVServer.Command.parse(data) do
          {:ok, command} -> KVServer.Command.run(command)
          {:error, _}= err -> err
        end
      {:error, _} = err -> err
    end

    write_line(msg, socket)
    serve(socket)
  end

  defp read_line(socket) do
    :gen_tcp.recv(socket, 0)
    #{:ok, data} = :gen_tcp.recv(socket, 0)
    #Logger.info("Se recibio: #{data}")
    #data
  end

  defp write_line({:ok, line}, socket) do
    :gen_tcp.send(socket, "Respuesta: #{line}")
  end

  defp write_line({:error, :close}, _socket) do
    exit(:shutdown)
  end

  defp write_line({:error, :unknown_command}, socket) do
    :gen_tcp.send(socket, "UNKNOWN COMMAND\r\n")
  end

  defp write_line({:error, :illegal_expression}, socket) do
    :gen_tcp.send(socket, "ILLEGAL EXPRESION\r\n")
  end


  defp write_line({:error, err}, socket) do
    :gen_tcp.send(socket, "ERROR\r\n")
    exit(err)
  end

end

#iex(1)> KVServer.accept(8000)
### en otra terminal
# telnet 127.0.0.1 8000
###########
# mix compile # desarrollo
# MIX_ENV=prod mix compile # producion
# mix release
# c:/Users/riaragon/curso-elixir/17-umbrella/myumbrella/_build/dev/rel/kv_server/bin/kv_server.bat start
# c:/Users/riaragon/curso-elixir/17-umbrella/myumbrella/_build/dev/rel/kv_server/bin/kv_server.bat stop
# PORT=9000 _build/dev/rel/kv_server/bin/kv_server.bat start
## otra terminal
# _build/dev/rel/kv_server/bin/kv_server.bat remote
#####producion
# MIX_ENV=prod mix release
#_build/prod/rel/kv_server/bin/kv_server.bat start
#_build/prod/rel/kv_server/bin/kv_server.bat remote
