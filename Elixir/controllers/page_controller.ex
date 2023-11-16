defmodule HelloPhoenixWeb.PageController do
  use HelloPhoenixWeb, :controller

  def index(conn, _params) do
    text(conn, "Hello, World!")
  end
end
