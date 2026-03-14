{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.xset
    pkgs.feh
    pkgs.sx
    pkgs.iw
    pkgs.flameshot
    pkgs.xclip
    pkgs.bc
  ];
}
