with import <nixpkgs> { overlays = [(import ./overlay.nix)]; };

stdenv.mkDerivation {
  name = "env";

  nativeBuildInputs = [ glib ];
  buildInputs = [ appmenu-gtk3-module ];

  shellHook = ''
    export XDG_DATA_DIRS=$XDG_DATA_DIRS:${appmenu-gtk3-module}/share/gsettings-schemas/appmenu-gtk3-module-0.7.6
  '';
}
