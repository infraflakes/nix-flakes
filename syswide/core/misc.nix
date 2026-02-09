{
  config,
  pkgs,
  inputs,
  ...
}: {
  #Sys pkgs
  environment.systemPackages = with pkgs; [
    git
    smartmontools
    yazi
    tmux
    htop
    ncdu
    bottom
    lm_sensors
    ripgrep
    bat
    jq
    inputs.srn-coreutils.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.srn-cd.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  # SSH
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "prohibit-password";
      PasswordAuthentication = true;
    };
  };
  networking.firewall.allowedTCPPorts = [22];
  #Disabled systemd services
  systemd = {
    services = {
      NetworkManager-wait-online.enable = false;
      NetworkManager-dispatcher.enable = false;
    };
  };

  security = {
    sudo.enable = false;
    doas = {
      enable = true;
      extraRules = [
        {
          groups = ["wheel"];
          keepEnv = true;
          persist = true;
        }
      ];
    };
  };
}
