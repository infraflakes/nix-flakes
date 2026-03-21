{
  config,
  pkgs,
  ...
}: {
  home.file.".config/rofi".source = ./config/rofi;
  home.file.".config/picom/picom.conf".source = ./config/picom.conf;
}
