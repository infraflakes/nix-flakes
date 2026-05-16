{pkgs, ...}: {
  services.displayManager.sessionPackages = with pkgs; [niri];
  programs.niri.enable = true;
}
