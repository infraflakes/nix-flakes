{
  username,
  pkgs,
  inputs,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;
  home.file.".config/nix/nix.conf".text = ''
    experimental-features = nix-command flakes
  '';
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "26.11";
    sessionVariables = {
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_DATA_HOME = "$HOME/.local/share";
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_STATE_HOME = "$HOME/.local/state";
    };
    sessionPath = [
      "$HOME/.local/bin"
      "$HOME/.cargo/bin"
    ];
    packages = [
      pkgs.home-manager
      inputs.sutils.packages.${pkgs.stdenv.hostPlatform.system}.default
      pkgs.bottom
      pkgs.htop
      pkgs.ripgrep
      pkgs.bat
      pkgs.ncdu
    ];
  };
  imports = [
    ./pkg/pkgs.nix
    ./cli/editor.nix
    ./cli/file-manager.nix
    ./cli/fish.nix
    ./cli/vcs.nix
    ./cli/container.nix
    ./cli/kiru.nix
  ];
}
