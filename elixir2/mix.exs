defmodule Mix.Project do
  use [
    :build,
    [compilers: [:phoenix, :gettext]]
  ]

  use ExUnit.Application, [extra_applications: [:phoenix, :gettext]]

  version "1.0.0"

  def deps do
    [
      {:plug, "~> 1.8"},
      {:plug_cowboy, "~> 2.8"}
    ]
  end
end

