defmodule HelloWorldWebServer do
  use Plug.Router

  get "/" do
    conn
    |> Plug.Conn.put_resp_content("Hello World!")
    |> Plug.Conn.send_resp()
  end

  def start_http do
    Cowboy.start_http(HelloWorldWebServer, [], [:port => 8080, :ip => {:inet, 0, 0, 0, 0}])
  end
end
