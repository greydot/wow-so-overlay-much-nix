self: super:

let
  inherit (super) callPackage;
  haskellOverlay = hself: hsuper: {
    ListLike = super.haskell.lib.dontCheck hsuper.ListLike;
    hls-brittany-plugin = super.haskell.lib.dontCheck hsuper.hls-brittany-plugin;
    hls-fourmolu-plugin = super.haskell.lib.dontCheck hsuper.hls-fourmolu-plugin;
  };
in
{
  applet-window-appmenu = super.libsForQt5.callPackage ./packages/applet-window-appmenu { inherit (libsForQt5); };
  appmenu-gtk3-module = callPackage ./packages/appmenu-gtk3-module { inherit (super); };
  haskell = super.haskell // {
    packages = super.haskell.packages // {
      ghc902 = super.haskell.packages.ghc902.extend haskellOverlay;
      ghc925 = super.haskell.packages.ghc925.extend haskellOverlay;
      ghc927 = super.haskell.packages.ghc927.extend haskellOverlay;
    };
  };
}
