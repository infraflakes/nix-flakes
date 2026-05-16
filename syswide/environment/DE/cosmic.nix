{pkgs, ...}: {
  environment.cosmic.excludePackages = with pkgs; [
    orca
    cosmic-edit
    cosmic-term
    cosmic-store
    cosmic-reader
    cosmic-player
    cosmic-files
  ];
  services.desktopManager.cosmic.enable = true;
}
