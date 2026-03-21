{
  config,
  pkgs,
  ...
}: {
  imports = [
    # CLI
    ./cli/editor.nix
    ./cli/alacritty.nix
    ./cli/file-manager.nix
    ./cli/fastfetch.nix
    ./cli/fish.nix
    ./cli/starship.nix
    ./cli/tmux.nix
    ./cli/vcs.nix
    # ./cli/ai.nix
    ./modify-desktop-entry.nix
  ];
}
