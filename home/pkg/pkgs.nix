{...}: {
  imports = [
    ./cli/editor.nix
    ./cli/file-manager.nix
    ./cli/fastfetch.nix
    ./cli/fish.nix
    ./cli/vcs.nix
    ./cli/container.nix
    ./cli/sro.nix
    ./cli/zellij.nix

    ./configs/ghostty.nix

    ./media/multimedia.nix
    ./media/others.nix

    ./modify-desktop-entry.nix
  ];
}
