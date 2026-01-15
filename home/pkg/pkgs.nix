{
  config,
  pkgs,
  ...
}: {
  imports = [
    # CLI
    ./cli/nvim.nix
    ./cli/ghostty.nix
    ./cli/file-manager.nix
    ./cli/fastfetch.nix
    ./cli/fish.nix
    ./cli/tmux.nix
    ./cli/vcs.nix
    ./cli/ide.nix

    # Media
    ./media/multimedia.nix
    ./media/social.nix
    ./media/vpn.nix
  ];
}
