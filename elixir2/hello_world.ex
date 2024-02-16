defmodule HelloWorld do
  use Plug.Router

  plug Plug.Parsers

  get "/" do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Hello World!")
  end
end

defmodule MyApp do
  use Application

  def start(_type, _args) do
    port = System.get_env("PORT") || 8080
    {:ok, Plug.Cowboy.start_link(port, [module: HelloWorld])}
  end
end

