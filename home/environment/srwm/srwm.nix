{
  config,
  pkgs,
  inputs,
  ...
}: {
  home.packages = [
    pkgs.xset
    pkgs.feh
    pkgs.sx
    pkgs.iw
    pkgs.xclip
    pkgs.bc
    inputs.srwm.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
  home.file.".config/srwm".source = ./config/srwm;
}
