{
  config,
  lib,
  pkgs,
  ...
}: {
  boot.kernelParams = ["nvidia.NVreg_PreserveVideoMemoryAllocations=0"];
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        libglvnd
        nvidia-vaapi-driver
      ];
    };
    nvidia = {
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = true;
      modesetting.enable = true;
    };
  };
}
