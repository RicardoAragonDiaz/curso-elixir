defmodule CommandTest do
  use ExUnit.Case
  doctest KVServer.Command

  test "running command with error" do
    cmd = {:hola, nil}
    assert KVServer.Command.run(cmd) == {:error, :unknown_command}
  end

  test "running command" do

    cmd = {:read, nil}
    assert KVServer.Command.run(cmd) == {:ok, "Su saldo es:$0\r\n"}

    cmdDep = {:deposit, 150}
    assert KVServer.Command.run(cmdDep) == {:ok, "Deposito Exitoso\r\n"}
    assert KVServer.Command.run(cmd) == {:ok, "Su saldo es:$150\r\n"}

    cmdRet = {:withdraw, 70}
    assert KVServer.Command.run(cmdRet) == {:ok, "Retiro Exitoso\r\n"}
    assert KVServer.Command.run(cmd) == {:ok, "Su saldo es:$80\r\n"}

    cmdRet = {:withdraw, 80}
    assert KVServer.Command.run(cmdRet) == {:ok, "Retiro Exitoso\r\n"}
    assert KVServer.Command.run(cmd) == {:ok, "Su saldo es:$0\r\n"}
  end

  test "command {:read, algo_indiferente} " do
    KVServer.Command.run({:deposit, 87})

    cmd = {:read, :hello}
    assert KVServer.Command.run(cmd) == {:ok, "Su saldo es:$87\r\n"}

    cmd = {:read, 15}
    assert KVServer.Command.run(cmd) == {:ok, "Su saldo es:$87\r\n"}

    cmd = {:read, []}
    assert KVServer.Command.run(cmd) == {:ok, "Su saldo es:$87\r\n"}

    cmd = {:read, {}}
    assert KVServer.Command.run(cmd) == {:ok, "Su saldo es:$87\r\n"}

    KVServer.Command.run({:withdraw, 87})
  end

  test "parse command Error" do
    str = "deposit x"
    assert KVServer.Command.parse(str) == {:error, :illegal_expression}

    str = "dsdf 102\r"
    assert KVServer.Command.parse(str) == {:error, :unknown_command}

    str = "ghkgk\r\n"
    assert KVServer.Command.parse(str) == {:error, :unknown_command}

    str = "dfsadfdf 115"
    assert KVServer.Command.parse(str) == {:error, :unknown_command}

    str = "dfsadfdf 10 f 2343"
    assert KVServer.Command.parse(str) == {:error, :unknown_command}
  end

  test "parse command" do

    str = "deposit 15"
    assert KVServer.Command.parse(str) == {:ok, {:deposit, 15}}

    str = "withdraw 10"
    assert KVServer.Command.parse(str) == {:ok, {:withdraw, 10}}

    str = "withdraw 11\r\n"
    assert KVServer.Command.parse(str) == {:ok, {:withdraw, 11}}

  end

end

# $ mix test --cover
