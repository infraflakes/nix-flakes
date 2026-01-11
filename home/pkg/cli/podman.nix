{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [distrobox];
  services.podman = {
    enable = true;
    settings.registries.search = [
      "docker.io"
      "quay.io"
      "registry.fedoraproject.org"
      "mirror.gcr.io"
    ];
  };
}
