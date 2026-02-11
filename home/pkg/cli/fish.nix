{
  config,
  pkgs,
  ...
}: {
  home.sessionVariables.SHELL = "${pkgs.fish}/bin/fish";
  programs.fish = {
    enable = true;
    shellAliases = {
      tm = "tmux new-session -A";
      cd = "scd";
      smd = "srn music download";
      cat = "bat";
      grep = "rg";
      se = "sudo -E -s nvim";
      ls = "lsd -l";
      nvidia-gpu = "__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia";
    };
    interactiveShellInit = ''
      scd init fish | source
      fastfetch
      set username (whoami)
      echo "				Welcome back, $username!"
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
      fish_greeting = '''';
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
