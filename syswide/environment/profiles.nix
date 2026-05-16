{
  pkgs,
  lib,
  ...
}: {
  services.displayManager = {
    # ly.enable = true;
    # gdm.enable = true;
  };
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
      # xdg-desktop-portal-gnome
    ];
    config = {
      common = {
        default = ["gtk"];
        "org.freedesktop.impl.portal.OpenURI" = ["gtk"];
      };
      sway = {
        default = lib.mkForce [
          "gtk"
          "wlr"
        ];
        "org.freedesktop.impl.portal.ScreenCast" = ["wlr"];
        "org.freedesktop.impl.portal.Screenshot" = ["wlr"];
      };
      srwc = {
        default = [
          "gnome"
          "gtk"
        ];
        "org.freedesktop.impl.portal.ScreenCast" = ["gnome"];
        "org.freedesktop.impl.portal.Screenshot" = ["gnome"];
      };
      niri = {
        default = [
          "gnome"
          "gtk"
        ];
        "org.freedesktop.impl.portal.ScreenCast" = ["gnome"];
        "org.freedesktop.impl.portal.Screenshot" = ["gnome"];
      };
    };
  };
}
