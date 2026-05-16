{...}: {
  programs.dms-shell = {
    enable = true;
    systemd = {
      # enable = true; # Systemd service for auto-start
      #   restartIfChanged = true; # Auto-restart dms.service when dank-material-shell changes
    };
    enableSystemMonitoring = true; # System monitoring widgets (dgop)
    enableDynamicTheming = true; # Wallpaper-based theming (matugen)
    enableAudioWavelength = true; # Audio visualizer (cava)
    enableClipboardPaste = true; # needs wtype
  };
}
