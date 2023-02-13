self: super:

let
  inherit (super) callPackage;
  haskellOverlay = hself: hsuper: {
    ListLike = super.haskell.lib.dontCheck hsuper.ListLike;
    hls-brittany-plugin = super.haskell.lib.dontCheck hsuper.hls-brittany-plugin;
  };
in
{
  appmenu-gtk3-module = callPackage ./packages/appmenu-gtk3-module { inherit (super); };
  haskell = super.haskell // {
    packages = super.haskell.packages // {
      ghc925 = super.haskell.packages.ghc925.extend haskellOverlay;
    };
  };
}
