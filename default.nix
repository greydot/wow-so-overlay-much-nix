self: super:

let
  inherit (super) callPackage;
in
{
  appmenu-gtk3-module = callPackage ./packages/appmenu-gtk3-module { inherit (super); };
  wrapAppmenuHook = callPackage ./hooks/wrapAppmenuHook { inherit (super); };

  solo5 = callPackage ./packages/solo5 { inherit (super); };
}
