{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./wm/hyprland/hypr.nix
    ./wm/hyprland/swappy.nix
    ./wm/dms.nix

    ./ui/fonts.nix
    ./ui/theme.nix
    ./ui/wallpapers.nix

    ./sys/autostart.nix
    ./sys/ime.nix
    ./sys/modify-desktop-entry.nix
  ];
}
