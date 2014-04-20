defmodule Maule.Renderers.ListRenderer do

  def render(list) do
    render("", list)
  end

  defp render(rendered, []), do: rendered
  defp render(rendered, [elt|rest]) do
    render("#{rendered}  #{elt}\n", rest)
  end
end