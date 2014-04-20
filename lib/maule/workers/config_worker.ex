defmodule Maule.Workers.ConfigWorker do
  use GenServer.Behaviour

  import Maule.Config

  def start_link(config_file_name) do
    :gen_server.start_link({:local, :maule_config}, __MODULE__, config_file_name, [])
  end

  def init(config_file_name) do
    { :ok, load(config_file_name) }
  end

  def handle_call(:environments, _from, config) do
    { :reply, environments(config), config }
  end

  def handle_cast(_msg, _state) do
  end

  def handle_info(_msg, _state) do
  end

  def terminate(_reason, _state) do
  end

  def code_change(_old_vsn, _state, _extra) do
  end
end