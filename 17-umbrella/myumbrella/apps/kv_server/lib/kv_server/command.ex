defmodule KVServer.Command do

  #def run(_command) do
  #  {:ok, "OK\r\n"}
  #end
  #
  #def parse(msg) do
  #  case msg do
  #    "boom\r\n" -> {:error, :unknown_command}
  #    _          -> {:ok, msg}
  #  end
  #end

  def run({comm, val}) do
    case comm do
      :deposit  ->
        KVServer.Balance.deposit(KVServer.Balance, val)
        {:ok, "Deposito Exitoso\r\n"}
      :withdraw ->
        KVServer.Balance.withdraw(KVServer.Balance, val)
        {:ok, "Retiro Exitoso\r\n"}
      #:transfer ->
      #  KVServer.Balance.transfer(KVServer.Balance, val)
      #  {:ok, "Transferencia Exitosa\r\n"}
      :read     ->
        balance = KVServer.Balance.read(KVServer.Balance)
        {:ok, "Su saldo es:$#{balance}\r\n"}
      _         ->
        {:error, :unknown_command}
    end
  end

  def parse(msg) do
    msg = msg |> String.replace("\r", "") |> String.replace("\n", "")

    [comm, val] = [String.split(msg, " ") |> Enum.at(0), String.split(msg, " ")|> Enum.at(1)]

    try do
      case comm do
        "deposit"  ->
          {:ok, {:deposit,  String.to_integer(val)}}
        "withdraw" ->
          {:ok, {:withdraw, String.to_integer(val)}}
        #"transfer" -> {:ok, {:transfer, String.to_integer(val)}}
        "read"     ->
          {:ok, {:read, val}}
        _          ->
          {:error, :unknown_command}
      end
    rescue
      ArgumentError ->
        {:error, :illegal_expression}
    end
  end

end
