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

    # Programs that needs privileges
    ./runtime/podman.nix
  ];
}
