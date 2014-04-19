defmodule Maule.ConsoleWriter do

  def write(data) do
    IO.puts data
  end

  def write(prefix, data) do
    color = apply(IO.ANSI, binary_to_atom(prefix[:color]), [])
    IO.puts "#{color}#{prefix[:text]}#{IO.ANSI.reset} - #{data}"
  end
end