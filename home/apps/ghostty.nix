{
  config,
  pkgs,
  lib,
  ...
}: {
  # Ghostty relies on system's opengl
  # install ghostty with distro's package manager
  # Is way more hassle free
  home.file.".config/ghostty/config".text = ''
    background = 1b1e25
    font-family = JetBrains Mono Nerd Font
    font-size = 13
    theme = catppuccin-frappe
    keybind=clear
    keybind = performable:ctrl+c=copy_to_clipboard
    keybind = ctrl+v=paste_from_clipboard
    confirm-close-surface = false
    window-decoration = false
  '';
}
