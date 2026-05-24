{
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
      # User-specific directories
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_DATA_HOME = "$HOME/.local/share";
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_STATE_HOME = "$HOME/.local/state";

      XDG_DESKTOP_DIR = "$HOME/Desktop";
      XDG_DOWNLOAD_DIR = "$HOME/Downloads";
      XDG_DOCUMENTS_DIR = "$HOME/Documents";
      XDG_MUSIC_DIR = "$HOME/Music";
      XDG_PICTURES_DIR = "$HOME/Pictures";
      XDG_VIDEOS_DIR = "$HOME/Videos";
    };
    sessionPath = [
      "$HOME/.local/bin"
      "$HOME/.cargo/bin"
    ];
    packages = [
      inputs.sutils.packages.${pkgs.stdenv.hostPlatform.system}.default
      pkgs.home-manager
      pkgs.bottom
      pkgs.lm_sensors
      pkgs.htop
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
