defmodule Maule.OptionParser do

  def parse(args) do
    { _options, [command], _unparsed} = OptionParser.parse(args)
    %{command: command}
  end

end