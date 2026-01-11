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
    ./cli/podman.nix
    ./cli/tmux.nix
    ./cli/vcs.nix

    # Media
    ./media/media.nix
    ./media/mpd.nix
    ./media/misc.nix
    ./media/social.nix
    ./media/vpn.nix
  ];
}
