{ stdenv
, lib
, fetchFromGitLab
, fetchpatch
, meson
, cmake
, gnused
, pkg-config
, systemd
, gtk-doc
, docbook-xsl-nons
, ninja
, glib
, gtk3
, wrapGAppsHook
}:

stdenv.mkDerivation rec {
  pname = "appmenu-gtk3-module";
  version = "0.7.6";

  outputs = [ "out" "devdoc" ];

  src = fetchFromGitLab {
    owner = "vala-panel-project";
    repo = "vala-panel-appmenu";
    rev = version;
    sha256 = "sha256:1ywpygjwlbli65203ja2f8wwxh5gbavnfwcxwg25v061pcljaqmm";
  };

  sourceRoot = "source/subprojects/appmenu-gtk-module";

  nativeBuildInputs = [
    meson
    glib
    gnused
    cmake
    pkg-config
    systemd
    gtk-doc
    docbook-xsl-nons
    ninja
    wrapGAppsHook
  ];

  buildInputs = [
    glib
    gtk3
  ];

  preConfigure = ''
    sed -i '/emacs/d' src/blacklist.c
    substituteInPlace meson_options.txt --replace "value: ['2','3']" "value: ['3']"
  '';

  postInstall = ''
    glib-compile-schemas "$out/share/glib-2.0/schemas"
  '';

  mesonFlags = [
    "-Dgtk_doc=true"
    "--prefix=${placeholder "out"}"
  ];

  PKG_CONFIG_GTK__3_0_LIBDIR = "${placeholder "out"}/lib";
  PKG_CONFIG_SYSTEMD_SYSTEMDUSERUNITDIR = "${placeholder "out"}/lib/systemd/user";

  meta = with lib; {
    description = "Port of the Unity GTK 3 Module";
    license = licenses.lgpl3Only;
    maintainers = with maintainers; [ louisdk1 ];
  };
}
