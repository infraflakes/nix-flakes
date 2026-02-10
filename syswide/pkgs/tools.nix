{
  config,
  pkgs,
  inputs,
  ...
}: {
  #Sys pkgs
  environment.systemPackages = with pkgs; [
    git
    smartmontools
    yazi
    htop
    ncdu
    bottom
    lm_sensors
    ripgrep
    bat
    jq
    inputs.srn-coreutils.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.srn-cd.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}
