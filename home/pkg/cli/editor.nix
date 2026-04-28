{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      fd
      fzf
      ripgrep
      gnumake
      stylua
      alejandra
      antigravity
      clang-tools
      tree-sitter

      # Servers
      nil
      gopls
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
