{pkgs, ...}: {
  home.packages = with pkgs; [
    libnotify
    grim
    slurp
    swappy
    brightnessctl
    wl-clipboard
    jq
    # cava
    # pulseaudio
  ];
  services.cliphist = {
    enable = true;
    allowImages = true;
  };
  home.file.".local/bin/scripts" = {
    source = ./scripts;
    executable = true;
  };
  home.file.".config/swappy/config".text = ''
    [Default]
    save_dir=$HOME/Pictures/Screenshots
    save_filename_format=swappy-%Y%m%d-%H%M%S.png
  '';
}
