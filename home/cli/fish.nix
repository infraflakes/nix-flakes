{ pkgs, ... }: {
  home.sessionVariables.SHELL = "${pkgs.fish}/bin/fish";
  programs.fish = {
    enable = true;
    shellAliases = {
      cd = "scd";
      cat = "bat";
      e = "nvim";
    };
    interactiveShellInit = ''
      sn cd init fish | source
      echo "Welcome to your nixified dev environment!"
    '';
    shellInit = ''
      set UID (id -u)
      set -g fish_color_command 8ab4f8 --bold
      set -g fish_color_param ccd0d9 --bold
      set -g fish_color_redirection 8ab4f8 --bold
      set -g fish_color_error cf6679 --bold
      set -g fish_color_autosuggestion 908caa --bold
      set -g fish_color_selection --reverse --bold
    '';
    functions = {
      fish_greeting = "";
      fish_prompt = ''
        echo
        set_color -o 4a4b52
        echo -n ""
        set_color normal
        set_color -o 8ab4f8
        set_color -b 4a4b52
        echo -n "  "
        set_color normal
        set_color -o 8ab4f8
        set_color -b 4a4b52
        echo -n (prompt_pwd)
        set_color normal
        set_color -o 4a4b52
        echo -n ""
        set_color normal
        echo -n (set_color -o 8ab4f8)" ❯ "
      '';
    };
  };
}
