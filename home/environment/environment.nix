{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./swm/swm.nix
    ./swm/rofi.nix
    ./swm/clipboard.nix

    ./ui/fonts.nix
    ./ui/theme.nix
    ./ui/wallpapers.nix

    ./sys/autostart.nix
    ./sys/ime.nix
    ./sys/modify-desktop-entry.nix
  ];
}
