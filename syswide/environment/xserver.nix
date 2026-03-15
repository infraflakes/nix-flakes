{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  services.xserver = {
    enable = true;
    excludePackages = with pkgs; [xterm];
    videoDrivers = [
      "nvidia"
    ];
    displayManager.startx.enable = true;
  };
  services.libinput = {
    enable = true;
    touchpad = {
      naturalScrolling = true;
      tapping = true;
      tappingButtonMap = "lrm";
      accelSpeed = "0.5";
      disableWhileTyping = true;
    };
  };
  programs.slock.enable = true;
  programs.ssh.enableAskPassword = false;
}
