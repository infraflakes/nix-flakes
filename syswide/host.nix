{...}: {
  imports = [
    # System core
    /etc/nixos/hardware-configuration.nix
    ./core/sys.nix
    # ./core/graphics-prime.nix
    ./core/graphics.nix
    ./core/misc.nix

    # User environment
    ./environment/user.nix
    ./environment/profiles.nix
    # ./environment/dms.nix
    # ./environment/srwc.nix
    # ./environment/niri.nix
    ./environment/kde.nix
    # ./environment/gnome.nix

    # Programs that needs privileges
    # ./runtime/asus.nix
    # ./runtime/otd.nix
    ./runtime/ppd.nix
    ./runtime/mount.nix
    # ./runtime/virt/gnome-boxes.nix
    ./runtime/gaming.nix
    ./runtime/containerization/podman.nix
    # ./runtime/containerization/packaging.nix
  ];
}
