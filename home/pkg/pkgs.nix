{...}: {
  imports = [
    ./cli/editor.nix
    ./cli/file-manager.nix
    ./cli/fastfetch.nix
    ./cli/zsh.nix
    ./cli/vcs.nix
    ./cli/container.nix
    ./cli/kiru.nix
    ./cli/tmux.nix
    ./configs/ghostty.nix
  ];
}
