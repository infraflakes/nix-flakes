{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  services.xserver = {
    enable = true;
    videoDrivers = [
      "modesetting"
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
}
