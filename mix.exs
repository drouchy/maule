defmodule Maule.Mixfile do
  use Mix.Project

  def project do
    [app: :maule,
     version: "0.0.1",
     elixir: "~> 0.13.0-dev",
     escript_main_module: Maule.Cli,
     escript_path: "_build/maule",
     elixirc_options: options(Mix.env),
     deps: deps(Mix.env)]
  end

  def options(:dev) do
    [exlager_level: :debug]
  end

  def options(:test) do
    [exlager_level: :emergency]
  end

  def options(:prod) do
    [exlager_level: :warning]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [
      applications: [
        :exlager
      ],
      mod: { Maule, [] }
    ]
  end

  # List all dependencies in the format:
  #
  # { :foobar, git: "https://github.com/elixir-lang/foobar.git", tag: "0.1" }
  #
  # Type `mix help deps` for more examples and options
  defp deps(:test) do
    [
      { :mock,    github: "jjh42/mock"   },
      { :webtest, github: "d0rc/webtest" }
    ] ++ deps(:default)
  end

  defp deps(_) do
    [
      { :exlager, github: "khia/exlager"       },
      { :jsex,    github: "talentdeficit/jsex" }
    ]
  end
end
