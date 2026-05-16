{pkgs, ...}: {
  home.packages = with pkgs; [
    libnotify
    grim
    slurp
    swappy
    brightnessctl
    wl-clipboard
    wf-recorder
    cava
  ];
  services.cliphist = {
    enable = true;
    allowImages = true;
  };
  home.file.".local/bin/scripts" = {
    source = ./scripts;
    executable = true;
  };
}
