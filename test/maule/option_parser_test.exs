defmodule OptionParserTest do
  use ExUnit.Case

  import Maule.OptionParser

  # parse/1
  test "returns the main command" do
    %{command: "environments"} = parse ["environments"]
  end
end