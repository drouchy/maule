defmodule Maule.Config do

  def load(config_file) do
    read_config_file(config_file) |> decode_content
  end

  def config_file do
    System.get_env("MAULE_CONFIG_FILE") |> config_file
  end

  def environments(config) do
    Enum.map(config["environments"], fn (env) -> env["name"] end)
  end

  defp decode_content({:ok, content}) do
    { :ok, config }  = JSEX.decode content
    config
  end

  defp read_config_file(config_file), do: File.read(config_file)

  defp config_file(nil),      do: Path.expand("~/.maule.json")
  defp config_file(""),       do: Path.expand("~/.maule.json")
  defp config_file(filename), do: filename
end