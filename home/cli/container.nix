{...}: {
  # remember to install `uidmap` from host distribution or else
  # podman won't work
  services.podman = {
    enable = true;
    settings = {
      policy = {
        default = [{type = "insecureAcceptAnything";}];
      };
      registries.search = [
        "docker.io"
        "quay.io"
      ];
    };
  };
}
