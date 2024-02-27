defmodule HelloWorldServerWeb.Router do
  use HelloWorldServerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
  end

  scope "/", HelloWorldServerWeb do
    pipe_through :browser

    get "/", PageController, :index
  end
end

