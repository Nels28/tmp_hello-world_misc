defmodule StartServer do
  def start do
    Application.ensure_all_started(:hello_world_web_server)

    {:ok, _} = Plug.Adapters.Cowboy.http HelloWorldWebServer, []
  end
end

StartServer.start()

