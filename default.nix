let
  reflex-platform = import ./reflex-platform {};
  platform-customize = import ./platform.nix { inherit reflex-platform; };
  build = platform-customize.callPackage ./package.nix {};

  indexHtml = ''
    <!DOCTYPE html>
    <html>
      <head>
        <title>myawesomeclient</title>
      </head>
      <body>
      </body>
      <script language="javascript" src="app.min.js.gz"></script>
    </html>
  '';

  releaseBuild = reflex-platform.nixpkgs.stdenv.mkDerivation {
    inherit (build) name version;
    buildCommand = ''
      mkdir -p $out
      cp ${build}/bin/myawesomeclient-exe.jsexe/{rts,lib,out,runmain}.js $out
      ${reflex-platform.nixpkgs.closurecompiler}/bin/closure-compiler ${build}/bin/myawesomeclient-exe.jsexe/all.js \
        --compilation_level=ADVANCED_OPTIMIZATIONS \
        --externs=${build}/bin/myawesomeclient-exe.jsexe/all.js.externs \
        > $out/app.min.js
      gzip $out/app.min.js
      cat <<EOF > $out/index.html
      ${indexHtml}
      EOF
    '';
  };
in
  releaseBuild
