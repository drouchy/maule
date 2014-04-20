defmodule ConfigTest do
  use ExUnit.Case

  import Maule.Config

  teardown context do
    System.put_env("MAULE_CONFIG_FILE", "")
    :ok
  end

  # load/1
  test "loads a config file" do
    assert regular_config["global"] == [{"user", "drouchy"}, {"ssh_dir", "/var/tmp/maule_ssh"}]
  end

  # config_file
  test "by default gives the .maule.json in the home directory" do
    file_name = config_file

    assert file_name == "#{System.get_env("HOME")}/.maule.json"
  end

  test "by default gives the .maule.json in the home directory if the env is empty" do
    System.put_env("MAULE_CONFIG_FILE", "")

    file_name = config_file

    assert file_name == "#{System.get_env("HOME")}/.maule.json"
  end

  test "gives the config file set via env variable" do
    System.put_env("MAULE_CONFIG_FILE", "/var/tmp/config")

    file_name = config_file

    assert file_name == "/var/tmp/config"
  end

  # environments/1
  test "gives the available environment names" do
    environments = environments(regular_config)

    assert environments == ["staging", "production"]
  end

  defp regular_file,   do: "test/fixtures/config/regular.json"
  defp regular_config, do: load regular_file
end