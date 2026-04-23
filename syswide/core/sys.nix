{pkgs, ...}: {
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
      limine.enable = true;
      # grub = {
      #   enable = true;
      #   device = "nodev";
      #   efiSupport = true;
      #   useOSProber = true;
      # };
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
  swapDevices = [
    {
      device = "/swapfile";
      size = 16384;
    }
  ];
  boot.kernelParams = [
    "zswap.enabled=1"
    "zswap.compressor=zstd" # Best ratio for CPU
    "zswap.max_pool_percent=20" # 20% of 24GB is ~4.8GB
    "zswap.zpool=zsmalloc" # More efficient memory allocator
  ];
  boot.kernel.sysctl."vm.swappiness" = 60;

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
