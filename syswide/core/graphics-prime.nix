{
  config,
  lib,
  pkgs,
  ...
}: {
  boot.kernelParams = ["nvidia.NVreg_PreserveVideoMemoryAllocations=0"];
  environment.variables = {
    #LIBVA_DRIVER_NAME = "iHD";
    LIBVA_DRIVER_NAME = "i965";
  };
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        libglvnd
        intel-media-driver # For Intel VA-API
        libvdpau-va-gl # VDPAU-to-VA-API translation for Intel
        nvidia-vaapi-driver
      ];
    };
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.beta;
      nvidiaSettings = false;
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = true;
      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };
}
