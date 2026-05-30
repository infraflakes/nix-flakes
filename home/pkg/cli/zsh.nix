{pkgs, ...}: {
  home.sessionVariables.SHELL = "${pkgs.zsh}/bin/zsh";
  programs.zsh = {
    enable = true;
    shellAliases = {
      tm = "tmux new-session -A -s default";
      cd = "scd";
      cat = "bat";
      e = "nvim";
    };

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
      setopt MENU_COMPLETE
      zmodload zsh/complist
      zstyle ':completion:*' menu yes select
      eval "$(sn cd init zsh)"
      ${pkgs.fastfetch}/bin/fastfetch
      printf "\t\t\tWelcome back, %s!\n" "$USER"
      function prompt_fish_style() {
        print ""
        PROMPT="%B%F{black}  %~ ❯ %b%f"
      }
      autoload -Uz add-zsh-hook
      add-zsh-hook precmd prompt_fish_style
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
      highlight = "fg=8";
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

    syntaxHighlighting = {
      enable = true;
      package = pkgs.zsh-syntax-highlighting;
      styles = {
        "command" = "normal,bold";
        "builtin" = "normal,bold";
        "alias" = "normal,bold";
        "function" = "normal,bold";
        "precommand" = "normal,bold";
        "default" = "fg=black";
        "single-quoted-argument" = "fg=black";
        "double-quoted-argument" = "fg=black";
        "path" = "fg=black";
        "redirection" = "fg=blue";
        "commandseparator" = "fg=blue";
        "unknown-token" = "fg=red,bold";
      };
    };
  };
}
