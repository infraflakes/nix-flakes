{
  config,
  pkgs,
  ...
}: {
  boot.kernelParams = [
    "acpi_backlight=native"
    # "nvidia.NVreg_PreserveVideoMemoryAllocations=0"
  ];
  services.xserver.videoDrivers = ["nvidia"];
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
      package = config.boot.kernelPackages.nvidiaPackages.beta;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = true;
      # modesetting.enable = true;
    };
  };
}
