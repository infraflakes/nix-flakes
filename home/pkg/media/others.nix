{pkgs, ...}: {
  home.packages = with pkgs; [
    # zoom-us
    vesktop
    firefox
    obsidian
    proton-vpn
  ];
}
