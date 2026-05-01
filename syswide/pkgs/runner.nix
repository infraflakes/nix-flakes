{pkgs, ...}: {
  environment.systemPackages = [pkgs.git];
  services.gitlab-runner = {
    enable = true;
    services.nixos-sro = {
      authenticationTokenConfigFile = "/etc/gitlab-runner/sro-token";
      executor = "shell"; # Or "docker"
      # dockerImage = "nixos/nix:latest";
    };
  };
}
