defmodule Maule.Cli do

  def main(args) do
    parsed_args = Maule.OptionParser.parse(args)
    execute_command(parsed_args[:command])
  end

  defp execute_command("environments"), do: Maule.Commands.Environments.execute([])

end