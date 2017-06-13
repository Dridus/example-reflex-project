{ reflex-platform ? import ./reflex-platform {}
, base-platform ? reflex-platform.ghcjs
, ... }:

base-platform.override {
  overrides = self: super: {
    # myawesomeshared        = self.callPackage ../shared/package.nix {};
  };
}
