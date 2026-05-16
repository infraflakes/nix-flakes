{pkgs, ...}: {
  home.packages = with pkgs; [
    playerctl
    pavucontrol
  ];
  programs.waybar.enable = true;
  home.file.".config/waybar".source = ./config/waybar;
}
