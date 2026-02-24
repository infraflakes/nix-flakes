{
  config,
  pkgs,
  ...
}: {
  imports = [
    # ./wm/dms.nix
    # ./wm/hyprland/hypr.nix
    # ./wm/hyprland/swappy.nix
    # ./wm/mangowc/mangowc.nix
    # ./wm/mangowc/swappy.nix
    # ./wm/niri/niri.nix
    ./wm/swm/swm.nix
    ./wm/swm/rofi.nix
    ./wm/swm/clipboard.nix

    ./ui/fonts.nix
    ./ui/theme.nix
    ./ui/wallpapers.nix

    ./sys/autostart.nix
    ./sys/ime.nix
    ./sys/modify-desktop-entry.nix
  ];
}
