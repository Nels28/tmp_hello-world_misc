{ stdenv, fetchFromGitHub, zig, zlib }:

stdenv.mkDerivation rec {
  pname = "hello-world-server";
  version = "1.0";
  src = fetchFromGitHub {
    owner = "your-github-username";
    repo = "hello-world-server";
    rev = "master";  # Or use a specific commit or tag
    sha256 = "";  # Replace with the actual sha256 hash
  };

  nativeBuildInputs = [ zlib ];

  buildInputs = [ zig ];

  installPhase = ''
    mkdir -p $out/bin
    cp $src/server $out/bin/
  '';

  meta = with stdenv.lib; {
    description = "Simple Hello World web server written in Zig";
    license = licenses.mit;
    maintainers = [ "Your Name <your.email@example.com>" ];
  };
}
