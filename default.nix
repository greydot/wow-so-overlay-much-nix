self: super:

let
  inherit (super) callPackage;
in
{
  appmenu-gtk3-module = callPackage ./packages/appmenu-gtk3-module { inherit (super); };
}
