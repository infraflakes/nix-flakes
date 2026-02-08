{
  config,
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    zoom-us
    vesktop
    firefox
  ];
}
