{
  config,
  pkgs,
  inputs,
  ...
}: {
  services.cliphist.enable = true;
  imports = [
    inputs.dms.homeModules.dankMaterialShell.default
  ];
  programs.dankMaterialShell = {
    enable = true;
    enableSystemMonitoring = true; # System monitoring widgets (dgop)
    enableDynamicTheming = true; # Wallpaper-based theming (matugen)
    enableAudioWavelength = true; # Audio visualizer (cava)
    enableCalendarEvents = true; # Calendar integration (khal)
  };
}
