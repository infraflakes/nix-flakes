{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.cosmic.excludePackages = with pkgs; [
    orca
    cosmic-edit
    cosmic-term
    cosmic-store
    cosmic-reader
    cosmic-player
  ];
  services.desktopManager.cosmic.enable = true;
}
