# default.nix

{ lib, buildInputs ? [] }:

lib.zig.mkDerivation {
  pname = "hello-zig";
  version = "1.0";
  src = ./hello.zig;  # Adjust this line

  nativeBuildInputs = buildInputs;

  meta = with lib; {
    description = "Zig Hello World Web Server";
    license = licenses.mit;
  };
}
