defmodule EnvironmentsTest do
  use ExUnit.Case
  import Mock

  import Maule.Commands.Environments

  # execute/1
  test_with_mock "gets all the environments from the config and display them", IO, [write: fn(_) -> end] do
    execute([])

    assert called IO.write("  staging\n  production\n")
  end
end