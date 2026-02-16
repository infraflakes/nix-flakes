{
  config,
  pkgs,
  lib,
  ...
}: {
  home.sessionVariables.SHELL = "${pkgs.zsh}/bin/zsh";
  programs.zsh = {
    enable = true;
    initContent = ''
      bindkey '^[[1;5D' backward-word
      bindkey '^[[1;5C' forward-word
      bindkey '^[OD' backward-word
      bindkey '^[OC' forward-word
      bindkey '^[[D' backward-word
      bindkey '^[[C' forward-word
      bindkey "^[[D" backward-char          # Left
      bindkey "^[[C" forward-char           # Right
      bindkey "^[[1;2D" backward-word    # Shift + Left
      bindkey "^[[1;2C" forward-word     # Shift + Right
      bindkey "^[[1;2A" up-line-or-history # Shift + Up
      bindkey "^[[1;2B" down-line-or-history # Shift + Down
      eval "$(scd init zsh)"
      setopt MENU_COMPLETE
      zmodload zsh/complist
      zstyle ':completion:*' menu yes select
      ${pkgs.fastfetch}/bin/fastfetch
      printf "\t\t\tWelcome back, %s!\n" "$USER"
    '';
    enableCompletion = true;
    autocd = true;
    autosuggestion = {
      enable = true;
      strategy = [
        "history"
        "completion"
        "match_prev_cmd"
      ];
    };

    history = {
      size = 100000;
      save = 100000;
      share = true;
      append = true;
      ignoreDups = true;
      expireDuplicatesFirst = true;
      extended = true;
    };

    historySubstringSearch = {
      enable = true;
      searchUpKey = [
        "^[[A"
      ];
      searchDownKey = [
        "^[[B"
      ];
    };

    shellAliases = {
      tm = "tmux new-session -A -s default";
      cd = "scd";
      smd = "srn music download";
      cat = "bat";
      grep = "rg";
      se = "sudo -E -s nvim";
      ls = "lsd -l";
      nvidia-gpu = "__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia";
    };

    syntaxHighlighting = {
      enable = true;
      package = pkgs.zsh-syntax-highlighting;
      styles = {
        default = "fg=#ccd0d9,bold";
        precommand = "fg=#ccd0d9,bold";
        command = "fg=#8ab4f8,bold";
        alias = "fg=#8ab4f8,bold";
        builtin = "fg=#8ab4f8,bold";
        reserved = "fg=#8ab4f8,bold";
        function = "fg=#8ab4f8,bold";
        path = "fg=#ccd0d9,bold";
        single-quoted-argument = "fg=#ccd0d9,bold";
        double-quoted-argument = "fg=#ccd0d9,bold";
        redirection = "fg=#8ab4f8,bold";
        unknown-token = "fg=#cf6679,bold";
        globbing = "fg=#8ab4f8,bold";
        comment = "fg=#908caa,bold";
      };
    };
  };
}
