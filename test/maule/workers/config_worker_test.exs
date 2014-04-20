defmodule ConfigWriterWorkerTest do
  use ExUnit.Case
  import Mock

  import Maule.Workers.ConfigWorker

  # init/2
  test "returns ok" do
    { :ok, _ } = init(config_file)
  end

  test "returns the config" do
    { :ok, config } = init(config_file)

    assert config["global"] == [{"user", "drouchy"}, {"ssh_dir", "/var/tmp/maule_ssh"}]
  end


  # handle_call/3 { :environments }
  test_with_mock "read the environments from the config", Maule.Config,
  [ environments: fn("CONFIG") -> environments end ] do
    { :reply, environments, "CONFIG" } = handle_call(:environments, self, "CONFIG")
  end

  def config_file,  do: "test/fixtures/config/regular.json"
  def environments, do: ["env1", "env2"]
end