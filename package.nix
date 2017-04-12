{ mkDerivation, base, classy-prelude, reflex-dom, stdenv }:
mkDerivation {
  pname = "myawesomeclient";
  version = "0.0.1";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [ base classy-prelude reflex-dom ];
  executableHaskellDepends = [ base classy-prelude reflex-dom ];
  homepage = "https://github.com/ConferHealth";
  description = "It's a client!";
  license = stdenv.lib.licenses.bsd3;
}
