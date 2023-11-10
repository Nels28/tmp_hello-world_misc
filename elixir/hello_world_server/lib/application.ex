defmodule HelloWorldServer.Application do
  use Application

  def start(_type, _args) do
    HelloWorldServer.start_link(port: 8080)
  end
end
