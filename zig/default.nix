{ lib, buildInputs ? [] }:

lib.zig.mkDerivation {
  pname = "hello-world";
  version = "1.0";
  src = ./.;

  nativeBuildInputs = [ buildInputs ];
  buildInputs = [ ];

  meta = with lib; {
    description = "Hello World Zig Web Server";
    license = licenses.mit;
  };
}
