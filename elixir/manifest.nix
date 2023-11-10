{
  name = "hello-world-web-server";
  version = "0.1.0";
  buildInputs = [
    nixpkgs.elixir,
    nixpkgs.cowboy,
    nixpkgs.plug
  ];
  buildSystem = "elixir";
  script = "lib/hello_world_web_server.ex";
}
