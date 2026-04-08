{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./wm/dms.nix
    ./wm/srwc.nix

    ./ui/fonts.nix
    ./ui/theme.nix
    ./ui/wallpapers.nix

    ./sys/autostart.nix
    ./sys/ime.nix
    ./sys/modify-desktop-entry.nix
  ];
}
