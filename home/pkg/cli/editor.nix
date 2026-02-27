{
  config,
  pkgs,
  lib,
  ...
}: {
  home = {
    packages = with pkgs; [
      fd
      fzf
      ripgrep
      gcc
      gnumake
      stylua
      alejandra
      antigravity
      clang-tools
    ];
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  home.file.".config/nvim".source = ./config/srnvim;
}
