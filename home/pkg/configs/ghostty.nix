{...}: {
  # Ghostty relies on system's opengl
  # install ghostty with distro's package manager
  # Is way more hassle free
  home.file.".config/ghostty/config".text = ''
    confirm-close-surface = false
    font-family = JetBrains Mono Nerd Font
    font-size = 11
    keybind = clear
    keybind = performable:ctrl+c=copy_to_clipboard
    keybind = ctrl+v=paste_from_clipboard
    keybind = ctrl+shift+r=reload_config
    theme = Ayu Light
    window-decoration = server

    background = #FFFFEA
    foreground = #000000
    cursor-color = #000000
    cursor-text = #FFFFEA
    selection-background = #EEEE9E
    selection-foreground = #000000

    palette = 0=#000000
    palette = 1=#990000
    palette = 2=#009900
    palette = 3=#999900
    palette = 4=#000000
    palette = 5=#000000
    palette = 6=#000000
    palette = 7=#EEEEEE

    palette = 8=#555555
    palette = 9=#FF5555
    palette = 10=#55FF55
    palette = 11=#000000
    palette = 12=#000000
    palette = 13=#000000
    palette = 14=#000000
    palette = 15=#FFFFFF

  '';
}
