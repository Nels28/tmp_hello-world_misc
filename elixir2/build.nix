{ pkgs }: stdenv.mkDerivation rec {
  name = "hello-world";
  src = ./.;
  buildInputs = with pkgs; [
    elixir
    git
  ];
  shellHook = "mix deps.get";
  stdenvFlags = with pkgs; [
    compilerFlags = with p; [ optimize = -O3 ];
  ];
}

