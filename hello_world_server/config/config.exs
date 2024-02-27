use Mix.Config

config :hello_world_server, HelloWorldServerWeb.Endpoint,
  http: [port: 8080],
  server: true,
  code_reloader: true,
  check_origin: false,
  watchers: []

