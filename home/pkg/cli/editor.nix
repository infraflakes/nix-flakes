{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      fd
      fzf
      ripgrep
      gnumake
      stylua
      alejandra
      tree-sitter
      nil
      gcc
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
