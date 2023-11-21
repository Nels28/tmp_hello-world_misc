{ lib, buildHaskellPackage, fetchFromGitHub }:

buildHaskellPackage rec {
  pname = "HelloWorldServer";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "your-github-username";
    repo = "your-repo-name";
    rev = "master";  # or use a specific commit hash or tag
    sha256 = "...";  # replace with the actual sha256 hash
  };

  meta = with lib; {
    description = "Hello World Web Server in Haskell";
    license = licenses.mit;
  };
}
