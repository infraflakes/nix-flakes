{
  config,
  pkgs,
  inputs,
  username,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = "26.05";
    packages = [
      pkgs.htop
      pkgs.home-manager
      pkgs.ncdu
      pkgs.bottom
      pkgs.lsd
      pkgs.ripgrep
      pkgs.bat
      pkgs.jq
      inputs.srn-coreutils.packages.${pkgs.stdenv.hostPlatform.system}.default
      inputs.srn-cd.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
  imports = [
    ./apps/vcs.nix
    ./apps/fish.nix
    ./apps/starship.nix
    ./apps/editor.nix
    ./apps/yazi.nix
    ./apps/tmux.nix
  ];
}
