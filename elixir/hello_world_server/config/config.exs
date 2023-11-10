use Mix.Config

config :hello_world_server, HelloWorldServer,
  http: [ip: {0,0,0,0}, port: 8080]
