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

    # Dev
    ./cli/dev/podman.nix
    ./cli/dev/tmux.nix
    ./cli/dev/vcs.nix

    # Media
    ./media/media.nix
    ./media/mpd.nix
    ./media/misc.nix
    ./media/social.nix
    ./media/vpn.nix
  ];
}
