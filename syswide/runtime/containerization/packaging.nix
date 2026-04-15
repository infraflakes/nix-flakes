{pkgs, ...}: {
  environment.systemPackages = with pkgs; [appimage-run];
  programs.appimage = {
    enable = true;
    binfmt = true;
  };
  services.flatpak.enable = true;
}
