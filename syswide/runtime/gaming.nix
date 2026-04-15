{
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    #scrcpy
    #qtscrcpy
    mangohud
  ];
  # programs.gamescope.enable = true;

  #virtualisation.waydroid.enable = true;

  # Add following string to launch arg if game fails to recognize nvidia
  # VK_ICD_FILENAMES=/run/opengl-driver/share/vulkan/icd.d/nvidia_icd.x86_64.json:run/opengl-driver-32/share/vulkan/icd.d/nvidia_icd.i686.json
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    #gamescopeSession.enable = true;
  };
  # programs.steam.package = pkgs.steam.override {
  #   extraArgs = "-system-composer";
  # };
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-original"
      "steam-unwrapped"
      "steam-run"
    ];
}
