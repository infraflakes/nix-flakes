{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  services.displayManager.sessionPackages = [
    inputs.srwc.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
  environment.systemPackages = [
    inputs.srwc.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
