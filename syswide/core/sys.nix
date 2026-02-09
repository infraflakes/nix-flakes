{
  config,
  lib,
  pkgs,
  ...
}: {
  nix.settings = {
    cores = 0;
    max-jobs = "auto";
    auto-optimise-store = true;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
  system.stateVersion = "26.05";
  nixpkgs.config.allowUnfree = true;
  #Bootloader
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
      };
    };
  };
  # Enable trim
  services.fstrim = {
    enable = true;
    interval = "weekly";
  };
  #ZRAM Swap
  zramSwap.enable = true;
  swapDevices = [
    {
      device = "/swapfile";
      size = 24 * 1024;
      priority = 1;
    }
  ];
  boot.kernel.sysctl = {
    "vm.swappiness" = 10;
  };
}
