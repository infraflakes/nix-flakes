{
  config,
  pkgs,
  ...
}: let
  ####################################################################
  # GTK Themes
  tokyonight = "Tokyonight-Dark";
  tokyonight-pkg = pkgs.tokyonight-gtk-theme;

  ####################################################################
  # Icon Themes
  papirus = "Papirus-Dark";
  papirus-pkg = pkgs.papirus-icon-theme;

  whitesur-icon = "WhiteSur-dark";
  whitesur-icon-pkg = pkgs.whitesur-icon-theme;
  ####################################################################
  # Cursor Themes
  bibata-ice = "Bibata-Modern-Ice";
  bibata-classic = "Bibata-Modern-Classic";
  bibata-pkg = pkgs.bibata-cursors;

  ####################################################################
  # Icon
  iconname = whitesur-icon;
  pkgicon = whitesur-icon-pkg;

  # GTK
  themename = tokyonight;
  pkgtheme = tokyonight-pkg;

  # Cursor
  cursorname = bibata-ice;
  pkgcursor = bibata-pkg;

  # Font
  fontname = "JetBrainsMono Nerd Font 12";
in {
  home.packages = with pkgs; [
    pkgtheme
    pkgcursor
    adwaita-icon-theme
    pkgicon
  ];
  home.sessionVariables = {
    GTK_THEME = themename;
    XCURSOR_THEME = cursorname;
    XCURSOR_SIZE = 24;
  };
  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgcursor;
      name = cursorname;
    };
    theme = {
      package = pkgtheme;
      name = themename;
    };
    iconTheme = {
      package = pkgicon;
      name = iconname;
    };
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        gtk-theme = themename;
        icon-theme = iconname;
        color-scheme = "prefer-dark";
        font-name = fontname;
        document-font-name = fontname;
        monospace-font-name = fontname;
      };
    };
  };
}
