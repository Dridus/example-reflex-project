{ reflex-platform ? import ./reflex-platform {}, ... }:

with {
  inherit (reflex-platform.nixpkgs) fetchgitPrivate;
  inherit (builtins) fromJSON readFile;
};

reflex-platform.ghcjs.override {
  overrides = self: super: {
    # myawesomeshared        = self.callPackage ../shared/package.nix {};
  };
}
