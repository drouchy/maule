defmodule Maule.Workers.GateKeeper do
  use GenServer.Behaviour
  require Lager

  def start_link(args) do
    :gen_server.start_link({:local, :maule_gate_keeper}, __MODULE__, args, [])
  end

  def init(options, _) do
    default = [port: 2000, connections: %{}]
    { :ok, Keyword.merge(default, options) }
  end

  def handle_call({:open_gate, from, to}, _from, options) do
    port = options[:port]
    new_state = options
      |> open_gate(from, to)
      |> increase_port
    {:reply, port, new_state}
  end

  def handle_cast(_msg, _state) do
  end

  def handle_info(_msg, _state) do
  end

  def terminate(_reason, state) do
    IO.puts "Terminate #{state}"
  end

  def code_change(_old_vsn, _state, _extra) do
  end

  defp increase_port(options) do
    Keyword.put(options, :port, options[:port]+1)
  end

  defp open_gate(options, from, to) do
    pid = options
      |> Maule.OsCommands.GateCommand.open_gate_command(from, to)
      |> run_command

    register_gate(options, from, to, pid)
  end

  defp register_gate(options, from, to, pid) do
    connections = options[:connections]
    new_connections = Map.put(connections, "#{from}-#{to}", pid)
    Keyword.put(options, :connections, new_connections)
  end

  defp run_command(command) do
    :erlang.open_port({:spawn, bitstring_to_list(command)}, [:binary, {:line, 255}])
  end
end