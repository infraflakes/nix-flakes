{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.dms.homeModules.dankMaterialShell.default
    #inputs.dms.homeModules.niri
  ];
  programs.dank-material-shell = {
    enable = true;
    enableSystemMonitoring = true; # System monitoring widgets (dgop)
    enableDynamicTheming = true; # Wallpaper-based theming (matugen)
    enableAudioWavelength = true; # Audio visualizer (cava)
    enableCalendarEvents = true; # Calendar integration (khal)
    systemd.enable = true; # Systemd service for auto-start
    #niri.enableSpawn = true; # Auto-start DMS with niri
  };
}
