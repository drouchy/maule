defmodule ConfigTest do
  use ExUnit.Case

  import Maule.Config

  # load/1
  test "loads a config file" do
    assert regular_config["global"] == [{"user", "drouchy"}, {"ssh_dir", "/var/tmp/maule_ssh"}]
  end

  # environments/1
  test "gives the available environment names" do
    environments = environments(regular_config)

    assert environments == ["staging", "production"]
  end

  defp regular_file,   do: "test/fixtures/config/regular.json"
  defp regular_config, do: load regular_file
end