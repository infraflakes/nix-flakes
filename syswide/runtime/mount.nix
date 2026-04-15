{
  pkgs,
  username,
  ...
}: {
  environment.systemPackages = with pkgs; [
    usbutils
    libimobiledevice
    ifuse
    # nemo
    # kdePackages.dolphin
    nautilus
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
