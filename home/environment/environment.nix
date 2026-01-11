{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./wm/hypr.nix
    ./wm/swappy.nix

    ./ui/dms.nix
    ./ui/fonts.nix
    ./ui/theme.nix
    ./ui/wallpapers.nix

    ./sys/autostart.nix
    ./sys/ime.nix
    ./sys/modify-desktop-entry.nix
  ];
}
