{
  config,
  pkgs,
  ...
}: {
  imports = [
    # System core
    /etc/nixos/hardware-configuration.nix
    ./core/sys.nix
    ./core/graphics-prime.nix
    ./core/misc.nix

    # User environment
    ./environment/user.nix
    ./environment/profiles.nix
    ./environment/gnome.nix
    ./environment/cosmic.nix

    # Programs that needs privileges
    # ./runtime/asus.nix
    # ./runtime/otd.nix
    ./runtime/ppd.nix
    ./runtime/mount.nix
    ./runtime/virt/virt-qemu.nix
    ./runtime/gaming.nix
    ./runtime/containerization/podman.nix
    ./runtime/containerization/packaging.nix
  ];
}
