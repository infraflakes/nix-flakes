{
  config,
  lib,
  pkgs,
  ...
}: let
  grubTheme = builtins.toString ../../home/assets/hollow-grub;
in {
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
    # kernelParams = ["acpi_backlight=native"];
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
        #theme = grubTheme;
      };
    };
    #blacklistedKernelModules = ["kvm" "kvm-intel" "bridge" "macvlan" "tap" "tun"];
  };
  # boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelPackages = pkgs.linuxPackages_zen;
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

  #Bluetooth
  hardware.bluetooth.enable = true;
  #Sound
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  #Nix-LD
  programs.nix-ld.enable = true;
}
