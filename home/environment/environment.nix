{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./wm/hypr.nix
    ./wm/swappy.nix
    ./wm/dms.nix

    ./ui/fonts.nix
    ./ui/theme.nix
    ./ui/wallpapers.nix

    ./sys/ime.nix
    ./sys/modify-desktop-entry.nix
  ];
}
