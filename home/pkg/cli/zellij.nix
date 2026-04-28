{...}: {
  programs.zellij = {
    enable = true;
    extraConfig = ''
      show_startup_tips false
    '';
    settings = {
      theme = "tokyo-night-dark";
      default_layout = "compact"; # Similar to the clean tmux look
      pane_frames = false; # Keeps it sleek like your tmux setup
      ui = {
        pane_frames = {
          rounded_corners = true;
        };
      };
    };
  };
}
