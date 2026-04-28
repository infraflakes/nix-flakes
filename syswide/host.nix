{...}: {
  imports = [
    # System core
    /etc/nixos/hardware-configuration.nix
    ./core/sys.nix
    ./core/graphics.nix
    ./core/misc.nix
    ./core/user.nix
    ./core/networking.nix
    ./pkgs/docker.nix

    ./core/fs/fs.nix
    ./core/fs/nextcloud.nix
    ./core/fs/immich.nix
  ];
}
