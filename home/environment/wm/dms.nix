{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.dms.homeModules.dank-material-shell
  ];
  programs.dank-material-shell = {
    enable = true;
    systemd = {
      enable = true; # Systemd service for auto-start
      #   restartIfChanged = true; # Auto-restart dms.service when dank-material-shell changes
    };
    enableSystemMonitoring = true; # System monitoring widgets (dgop)
    enableDynamicTheming = true; # Wallpaper-based theming (matugen)
    enableAudioWavelength = true; # Audio visualizer (cava)
  };
  #services.cliphist.enable = true;
  #Ikhal
  xdg.desktopEntries."khal" = {
    name = "ikhal";
    exec = "ikhal";
    terminal = false;
    type = "Application";
    noDisplay = true;
  };
}
