defmodule Student do
  defstruct [:name, :phone, :lastname, :id]

  defimpl Mongo.Encoder do
    def encode(%{phone: phone, name: name, lastname: lastname, id: id}) do
      %{phone: phone, name: name, lastname: lastname}
    end
  end
end

# {:ok, conn} = Mongo.start_link(url: "mongodb://localhost:27017/config", username: "root", password: "1234", auth_source: "admin")
# student = %Student{name: "javier", phone: 544545454}
# Mongo.insert_one!(conn, "estudiantes", student)

# iex --sname hola // iex con nombre
# iex(hola@PSLT3924)1> defmodule Hello do
#  ...(hola@PSLT3924)1>   def hello do
#  ...(hola@PSLT3924)1>    IO.puts "algo"
#  ...(hola@PSLT3924)1>   end
#  ...(hola@PSLT3924)1> end
# iex(hola@PSLT3924)1> Hello.hello()
#
###
###
# iex --sname chao
# Node.spawn_link(:"hola@PSLT3924", fn -> Hello.hello() end) // llama otro servidor
#iex(chao@PSLT3924)2> pid = Node.spawn_link(:"hola@PSLT3924", fn ->
#  ...(chao@PSLT3924)2>   receive do
#  ...(chao@PSLT3924)2>    {:hi, client} -> send(client, :bye)
#  ...(chao@PSLT3924)2>   end
#  ...(chao@PSLT3924)2> end)
#  #PID<10668.123.0>
#  iex(chao@PSLT3924)3> send(pid, {:hi, self()})
#  {:hi, #PID<0.108.0>}
#  iex(chao@PSLT3924)4> flush()
#  :bye
#  :ok
#
