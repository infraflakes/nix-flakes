{ pkgs, ... }: {
  home = {
    packages = with pkgs; [
      fd
      fzf
      ripgrep
      gcc
      gnumake
      opencode
      tree-sitter
      nil
      nixfmt
      stylua
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

  xdg.configFile."nvim".source = ./config/nvim;
}
