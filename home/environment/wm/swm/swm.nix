{
  config,
  pkgs,
  ...
}: let
  swm = pkgs.dwm.overrideAttrs (oldAttrs: {
    src = ./config/swm;

    buildInputs =
      oldAttrs.buildInputs
      ++ [
        pkgs.imlib2
      ];
  });
in {
  home.packages = [
    swm
    pkgs.xset
    pkgs.xsetroot
    pkgs.feh
    pkgs.sx
    pkgs.dash
    pkgs.iw
    pkgs.slock
    pkgs.maim
    pkgs.xclip
    pkgs.bc
  ];

  # Scripts
  home.file.".local/bin/swm-scripts" = {
    source = ./config/scripts;
    recursive = true;
    executable = true;
  };

  home.sessionPath = ["$HOME/.local/bin/swm-scripts"];
}
