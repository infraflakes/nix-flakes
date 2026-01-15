{
  config,
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    zoom-us
    vesktop
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.twilight
  ];
}
