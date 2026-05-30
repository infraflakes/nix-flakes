{
  pkgs,
  lib,
  ...
}: {
  home.sessionVariables = {
    TMUX_TMPDIR = lib.mkForce "/tmp";
  };
  programs.tmux = {
    enable = true;
    historyLimit = 50000;
    baseIndex = 1;
    mouse = true;
    escapeTime = 10;
    keyMode = "vi";
    sensibleOnTop = false;
    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
    ];
    # Extra lines that don’t have first-class options
    extraConfig = ''
      set -g default-shell "$SHELL"
      set -g renumber-windows on
      set-option -g allow-rename off
      set -g detach-on-destroy off
      set -s set-clipboard on
      set -s escape-time 0

      # ----- begin custom no-prefix binds -----

      bind -n C-Left  switch-client -p
      bind -n C-Right switch-client -n
      bind -n C-n new-session
      bind -n C-x confirm-before -p "kill session #S? (y/n)" "kill-session"

      bind -n M-v split-window -h
      bind -n M-h split-window -v
      bind -n M-Down    select-pane -t :.+
      bind -n M-Up  select-pane -t :.-

      # vi selection keys inside copy-mode
      bind -T copy-mode-vi v send-keys -X begin-selection
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel
      bind -n M-y copy-mode
      bind -T copy-mode-vi M-y send-keys -X cancel

      bind -n M-x kill-pane
      bind -n M-a choose-tree -s
      bind -n M-n new-window
      bind -n M-q detach-client
      bind -n M-Left  previous-window
      bind -n M-Right next-window

      bind -n C-r command-prompt -I '#S' 'rename-session -- "%%"'   # session
      bind -n M-r command-prompt -I '#W' 'rename-window "%%"' 	#window

      # 1.  Alt-m enters the “move” table
      bind -n M-m switch-client -T move

      # 2.  while in that table < / > shift the window, then drop back to root
      bind -T move Left swap-window -d -t -1 \; switch-client -T root
      bind -T move Right swap-window -d -t +1 \; switch-client -T root

      # 3.  any other key (or Escape) just cancels the mode
      bind -T move Escape switch-client -T root
    '';
  };
}
