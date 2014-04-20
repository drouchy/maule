defmodule ListRendererTest do
  use ExUnit.Case

  import Maule.Renderers.ListRenderer

  # render/1
  test "generate one line per entry, indexed by 2 spaces" do
    list = ["line 1", "line 2"]

    rendered = render(list)

    assert rendered == "  line 1\n  line 2\n"
  end
end