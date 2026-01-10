{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.ghostty = {
    enable = true;
    settings = {
      font-family = "JetBrains Mono Nerd Font";
      font-size = 13;
      theme = "Kanagawa Wave";
      confirm-close-surface = false;
      command = "${pkgs.fish}/bin/fish --login --interactive";
      keybind = [
        "clear"
        # "alt+n=new_tab"
        # "alt+a=toggle_tab_overview"
        # "alt+q=close_tab"
        # "alt+right=next_tab"
        # "alt+left=previous_tab"
        "performable:ctrl+c=copy_to_clipboard"
        "ctrl+v=paste_from_clipboard"
      ];

      #background = "1b1e25";
    };
    enableFishIntegration = true;
  };
}
