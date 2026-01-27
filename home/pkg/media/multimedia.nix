{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.spicetify-nix.homeManagerModules.default];
  home.packages = with pkgs; [
    # krita
    imv
    mpv
    ani-cli
    ffmpeg
    music-discord-rpc
    easytag
    nicotine-plus
    rmpc
    mpc
    mpd
    mpd-mpris
  ];
  home.file.".config/rmpc".source = ./config/rmpc;
  home.file.".config/mpd/mpd.conf".text = ''
    music_directory "~/Music"
    playlist_directory "~/Music"
    db_file "~/.config/mpd/database"
    log_file "~/.config/mpd/log"
    pid_file "~/.config/mpd/pid"
    state_file "~/.config/mpd/state"
    audio_output {
        type "pipewire"
        name "Pipewire Playback"
    }
    auto_update "yes"
    bind_to_address "127.0.0.1"
    port "6600"
    restore_paused "yes"
  '';
  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      hidePodcasts
      shuffle # shuffle+ (special characters are sanitized out of extension names)
      trashbin
    ];
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
  };
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-backgroundremoval
      obs-gstreamer
    ];
  };
}
