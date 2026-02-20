{
  config,
  pkgs,
  ...
}: {
  home = {
    packages = with pkgs; [rofi];
    file.".config/rofi" = {
      source = ./config/rofi;
    };
  };
}
