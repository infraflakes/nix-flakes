{
  config,
  pkgs,
  ...
}: {
  imports = [
    # CLI
    ./cli/editor.nix
    ./cli/ghostty.nix
    ./cli/file-manager.nix
    ./cli/fastfetch.nix
    ./cli/fish.nix
    ./cli/starship.nix
    ./cli/tmux.nix
    ./cli/vcs.nix
    # ./cli/ai.nix

    # Media
    ./media/multimedia.nix
    ./media/social.nix
    ./media/vpn.nix
  ];
}
