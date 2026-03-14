{
  config,
  pkgs,
  ...
}: {
  programs.alacritty = {
    enable = true;
    settings = {
      # keyboard.bindings = [
      #   {
      #     key = "C";
      #     mods = "Control";
      #     action = "Copy";
      #   }
      #   {
      #     key = "V";
      #     mods = "Control";
      #     action = "Paste";
      #   }
      # ];
      font = {
        normal = {
          family = "Terminess Nerd Font";
          style = "Regular";
        };
        size = 11.3;
      };
      terminal.shell = {
        program = "bash";
        args = [
          "-c"
          "fish"
        ];
      };
      window = {
        #opacity = 0.8;
        decorations = "full";
        # padding = {
        #   x = 15;
        #   y = 15;
        # };
      };

      colors = {
        primary = {
          background = "#141415";
          foreground = "#cdcdcd";
        };
        cursor = {
          text = "#24283b";
          cursor = "#cdcdcd";
        };
        selection = {
          text = "#cdcdcd";
          background = "#283457";
        };
        normal = {
          black = "#252530";
          red = "#d8647e";
          green = "#7fa563";
          yellow = "#f3be7c";
          blue = "#6e94b2";
          magenta = "#bb9dbd";
          cyan = "#aeaed1";
          white = "#cdcdcd";
        };
        bright = {
          black = "#606079";
          red = "#e08398";
          green = "#99b782";
          yellow = "#f5cb96";
          blue = "#8ba9c1";
          magenta = "#c9b1ca";
          cyan = "#bebeda";
          white = "#d7d7d7";
        };
      };
    };
  };
}
