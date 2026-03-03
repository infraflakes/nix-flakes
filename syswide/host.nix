{
  config,
  pkgs,
  ...
}: {
  imports = [
    # System core
    /etc/nixos/hardware-configuration.nix
    ./core/sys.nix
    ./core/graphics.nix
    ./core/misc.nix
    ./core/user.nix
    ./core/networking.nix
    ./core/fs.nix

    # ./pkgs/podman.nix
    ./pkgs/docker.nix
    ./pkgs/tmux.nix
    ./pkgs/tools.nix
    ./pkgs/vcs.nix
    ./pkgs/nextcloud.nix
    ./pkgs/immich.nix
  ];
}
