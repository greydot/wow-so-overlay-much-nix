{ lib
, mkDerivation
, fetchFromGitHub
, fetchpatch
, cmake
, extra-cmake-modules
, kcoreaddons
, kdeclarative
, kdecoration
, plasma-framework
, plasma-workspace
, libSM
, qtx11extras
, kwindowsystem
}:

mkDerivation rec {
  pname = "applet-window-appmenu";
  version = "unstable-26-06-2022";

  src = fetchFromGitHub {
    owner = "psifidotos";
    repo = "applet-window-appmenu";
    rev = "1de99c93b0004b80898081a1acfd1e0be807326a";
    hash = "sha256-PLlZ2qgdge8o1mZOiPOXSmTQv1r34IUmWTmYFGEzNTI=";
  };

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
  ];

  buildInputs = [
    kcoreaddons
    kdeclarative
    kdecoration
    kwindowsystem
    plasma-framework
    plasma-workspace
    libSM
    qtx11extras
  ];

  meta = with lib; {
    description = "Plasma 5 applet in order to show window menu in your panels";
    homepage = "https://github.com/psifidotos/applet-window-appmenu";
    license = licenses.gpl2Plus;
    maintainers = with maintainers; [ ];
  };
}