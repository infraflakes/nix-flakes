{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  # programs.hyprland.enable = true;
  services.displayManager = {
    gdm.enable = true;
    # ly.enable = true;
    sessionPackages = [
      pkgs.niri
      # inputs.mangowc.packages.${pkgs.stdenv.hostPlatform.system}.mango
    ];
  };
  xdg.portal = {
    enable = true;
    wlr = {
      enable = true;
      settings = {
        screencast = {
          chooser_type = "none";
          outputname = "eDP-1";
        };
      };
    };
    extraPortals = with pkgs; [
      pkgs.xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
      # xdg-desktop-portal-wlr
      xdg-desktop-portal-gnome
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
      mangowc = {
        default = ["wlr"];
        "org.freedesktop.impl.portal.ScreenCast" = ["wlr"];
        "org.freedesktop.impl.portal.Screenshot" = ["wlr"];
        "org.freedesktop.impl.portal.FileChooser" = ["gtk"];
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
