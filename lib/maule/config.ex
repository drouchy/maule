defmodule Maule.Config do

  def load(config_file) do
    read_config_file(config_file) |> decode_content
  end

  def environments(config) do
    Enum.map(config["environments"], fn (env) -> env["name"] end)
  end

  defp decode_content({:ok, content}) do
    { :ok, config }  = JSEX.decode content
    config
  end

  defp read_config_file(config_file), do: File.read(config_file)
end