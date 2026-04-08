{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  services.displayManager.sessionPackages = [srwc];
  environment.systemPackages = [
    inputs.srwc.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
