{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./srwm/srwm.nix
    ./srwm/rofi.nix
    ./srwm/clipboard.nix

    ./ui/fonts.nix
    ./ui/theme.nix
    ./ui/wallpapers.nix

    ./sys/autostart.nix
    ./sys/ime.nix
    ./sys/modify-desktop-entry.nix
  ];
}
