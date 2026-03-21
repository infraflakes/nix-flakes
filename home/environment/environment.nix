{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./srwm/srwm.nix
    ./srwm/others.nix
    ./ui/fonts.nix
    ./ui/wallpapers.nix
  ];
}
