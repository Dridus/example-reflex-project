let
  reflex-platform = import ./reflex-platform {};
  platform-customize = import ./platform.nix { inherit reflex-platform; };
in
  reflex-platform.workOn platform-customize (platform-customize.callPackage ./package.nix {})
