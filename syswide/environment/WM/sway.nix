{
  pkgs,
  lib,
  ...
}: {
  programs.sway = {
    enable = true;
    package = pkgs.sway;
    wrapperFeatures.gtk = true;
    extraPackages = lib.mkForce [];
    extraOptions = ["--unsupported-gpu"];
  };
}
