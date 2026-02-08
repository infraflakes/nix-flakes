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
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
    config = {
      common = {
        default = ["gtk"];
      };
      gnome = {
        default = ["gnome"];
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
