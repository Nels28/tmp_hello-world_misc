defmodule HelloWorldServerWeb.PageController do
  use HelloWorldServerWeb, :controller

  def index(conn, _params) do
    text(conn, "Hello World")
  end
end

