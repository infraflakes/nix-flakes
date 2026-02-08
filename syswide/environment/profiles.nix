{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  services.displayManager.ly = {
    enable = true;
    x11Support = true;
  };
  #services.displayManager.gdm.enable = true;
  programs.hyprland.enable = true;
  # services.displayManager.sessionPackages = [pkgs.niri];
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      pkgs.xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
      # xdg-desktop-portal-gnome
    ];
    config = {
      common = {
        default = ["gtk"];
        "org.freedesktop.portal.Settings" = ["gtk"];
      };
      gnome = {
        default = ["gnome"];
      };
      hyprland = {
        default = ["hyprland" "gtk"];
      };
      niri = {
        default = [
          "gtk"
          "gnome"
        ];
        "org.freedesktop.impl.portal.ScreenCast" = ["gnome"];
        "org.freedesktop.impl.portal.Screenshot" = ["gnome"];
      };
    };
  };
}
