{ haskellPackages ? haskellPackages_ghc884
, stack ? import (haskellPackages.fetchFromGitHub {
    owner = "commercialhaskell";
    repo = "stack";
    rev = "v2.7.3";
    sha256 = "1bkr3q2v20dzj5x1fx4xl3q9cjhdbnxyllzg59pwyw1w0aqljvwg";
  }) {}
}:

haskellPackages.callPackage ./HelloWorldServer.nix { }
