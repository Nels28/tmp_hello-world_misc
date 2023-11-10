defmodule HelloWorldServer.MixProject do
  use Mix.Project

  def project do
    [
      app: :hello_world_server,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Specifies your project dependencies.
  defp deps do
    [
      {:plug_cowboy, "~> 2.0"}
    ]
  end
end
