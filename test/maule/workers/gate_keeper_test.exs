defmodule GateKeeperTest do
  use ExUnit.Case
  import Mock

  import Maule.Workers.GateKeeper

  teardown context do
    :os.cmd('killall ssh')
    {:ok}
  end

  # init/2
  test "returns :ok with the options" do
    options = [option_1: true]

    { :ok, [option_1: true, port: 2000, connections: %{}] } = init(options, nil)
  end

  test "the port can be set in the options" do
    options = [port: 2200, option_1: true]

    { :ok, new_options} = init(options, nil)
    assert new_options[:port] == 2200
  end

  # handle_call/3 -> keep_gate
  test "it increases the current port" do
    options = [port: 2010, option_1: true, connections: %{}]

    {:reply, 2010, new_state} = handle_call({:open_gate, "from", "to"}, self, options)

    assert new_state[:port] == 2011
  end

  test "it registers the new connection" do
    options = [port: 2010, option_1: true, connections: %{}]

    {:reply, 2010, new_state} = handle_call({:open_gate, "from", "to"}, self, options)

    assert new_state[:connections]["from-to"] != nil
  end
end