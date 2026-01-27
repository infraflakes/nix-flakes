{
  config,
  pkgs,
  lib,
  username,
  ...
}: {
  environment.systemPackages = with pkgs; [
    usbutils
    libimobiledevice
    ifuse
    # nemo
    # nautilus
    sushi
    android-tools
  ];
  services.gvfs.enable = true;
  services.usbmuxd = {
    enable = true;
    package = pkgs.usbmuxd2;
  };
  users.users.${username}.extraGroups = ["adbusers"];
}
