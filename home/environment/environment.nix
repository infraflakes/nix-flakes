{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./wm/hypr.nix
    ./wm/swappy.nix

    ./shell/dms.nix
    ./shell/fonts.nix
    ./shell/theme.nix
    ./shell/wallpapers.nix

    ./sys/autostart.nix
    ./sys/ime.nix
    ./sys/modify-desktop-entry.nix
  ];
}
