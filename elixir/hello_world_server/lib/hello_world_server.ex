defmodule HelloWorldServer do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, "Hello World")
  end

  match _ do
    send_resp(conn, 404, "Not Found")
  end

  @spec start_link(keyword()) :: {:ok, pid()}
  def start_link(opts) do
    Plug.Adapters.Cowboy2.http(__MODULE__, [], opts)
  end
end
