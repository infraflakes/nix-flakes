{
  config,
  pkgs,
  lib,
  ...
}: {
  # services.displayManager.ly.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
    config = {
      common = {
        default = ["gtk"];
        "org.freedesktop.impl.portal.OpenURI" = ["gtk"];
      };
      srwc = {
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
