defmodule Maule.Commands.Environments do
  def execute(args) do
    envs = :gen_server.call :maule_config, :environments
    IO.write Maule.Renderers.ListRenderer.render(envs)
  end
end