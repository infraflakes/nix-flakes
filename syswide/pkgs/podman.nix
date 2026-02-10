{
  config,
  lib,
  pkgs,
  username,
  ...
}: {
  environment.systemPackages = with pkgs; [distrobox];
  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      dockerSocket.enable = true;
      defaultNetwork.settings.dns_enabled = true; # Required for containers under podman-compose to be able to talk to each other.
    };
  };

  environment.etc."containers/registries.conf".text = lib.mkForce ''
    unqualified-search-registries = ["docker.io", "quay.io"]

    [[registry]]
    location = "docker.io"
  '';

  users.users.${username}.extraGroups = ["podman"];
}
