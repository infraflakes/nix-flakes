{
  config,
  pkgs,
  inputs,
  username,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  home.file.".config/nix/nix.conf".text = ''
    experimental-features = nix-command flakes
  '';
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "26.05";
    sessionVariables = {
      EDITOR = "nvim";
    };
    sessionPath = [
      "$HOME/.local/bin"
      "$HOME/.cargo/bin"
    ];
    packages = [
      inputs.srn-coreutils.packages.${pkgs.stdenv.hostPlatform.system}.default
      inputs.srn-cd.packages.${pkgs.stdenv.hostPlatform.system}.default
      pkgs.lsd
      pkgs.home-manager
      pkgs.bottom
      pkgs.lm_sensors
      pkgs.bluetuith
      pkgs.pulsemixer
      pkgs.nmap
      pkgs.ripgrep
      pkgs.bat
    ];
  };
  imports = [
    ./pkg/pkgs.nix
    ./environment/environment.nix
  ];
}
