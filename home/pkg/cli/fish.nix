{pkgs, ...}: {
  home.sessionVariables.SHELL = "${pkgs.fish}/bin/fish";
  programs.fish = {
    enable = true;
    shellAliases = {
      tm = "tmux new-session -A -s default";
      cd = "scd";
      cat = "bat";
      grep = "rg";
      se = "doas -E -s nvim";
      e = "nvim";
      nvidia-gpu = "__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia";
    };
    interactiveShellInit = ''
      sn cd init fish | source
      fastfetch
      set username (whoami)
      echo "				Welcome back, $username!"
    '';
    shellInit = ''
      set UID (id -u)
      set -g fish_color_command normal --bold
      set -g fish_color_param black
      set -g fish_color_redirection blue
      set -g fish_color_error red --bold
      set -g fish_color_autosuggestion brblack
      set -g fish_color_selection --reverse
    '';
    functions = {
      fish_greeting = '''';
      fish_prompt = ''
        echo
        set_color normal
        set_color -o black
        echo -n "  "
        echo -n (prompt_pwd)
        echo -n " ❯ "
        set_color normal
      '';
    };
  };
}
