{pkgs, ...}: {
  home.pointerCursor = {
    name = "Bibata-Modern-Ice";
    size = 24;
    package = pkgs.bibata-cursors;
    gtk.enable = true;
    x11.enable = true;
  };
  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.bibata-cursors;
      size = 24;
      name = "Bibata-Modern-Classic";
    };
    theme = {
      package = pkgs.tokyonight-gtk-theme;
      name = "Tokyonight-Dark";
    };
    iconTheme = {
      package = pkgs.whitesur-icon-theme;
      name = "WhiteSur-dark";
    };
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        gtk-theme = "Tokyonight-Dark";
        icon-theme = "WhiteSur-dark";
        color-scheme = "prefer-dark";
        font-name = "JetBrainsMono Nerd Font 12";
        document-font-name = "JetBrainsMono Nerd Font 12";
        monospace-font-name = "JetBrainsMono Nerd Font 12";
      };
    };
  };
}
