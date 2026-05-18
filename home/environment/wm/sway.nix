{pkgs, ...}: {
  home.packages = with pkgs; [
    wl-clipboard
    swayidle
    brightnessctl
    rofi
    libnotify
  ];

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
  };

  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    systemd.enable = true;

    extraSessionCommands = ''
      export SDL_VIDEODRIVER=wayland
      export QT_QPA_PLATFORM=wayland
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
    '';
    extraConfig = ''
      # title_align center
      # for_window [title=".*"] move position center
      floating_modifier Mod4 normal # Use Super (Mod4) as the modifier for moving and resizing windows
      titlebar_padding 10 8
    '';
    config = {
      output = {
        "*" = {
          # scale = "1.25";
          bg = "${../ui/config/wallpapers/nixgirl.png} fill";
        };
      };
      input = {
        "*" = {
          repeat_delay = "150";
          repeat_rate = "50";
        };
        "type:touchpad" = {
          tap = "enabled";
          natural_scroll = "enabled";
        };
      };
      bars = [];
      window = {
        titlebar = true;
        border = 0;
        hideEdgeBorders = "smart";
      };
      floating = {
        border = 0;
        titlebar = false;
      };

      gaps = {
        inner = 12;
        outer = 12;
      };

      fonts = {
        names = ["JetBrainsMono Nerd Font"];
        style = "SemiBold";
        size = 12.0;
      };
      colors = {
        focused = {
          background = "#86AFEF";
          border = "#86AFEF";
          childBorder = "#86AFEF";
          text = "#1E1B25";
          indicator = "#39C5CF";
        };
        focusedInactive = {
          background = "#1E1B25";
          border = "#1E1B25";
          text = "#C9D1C9";
          indicator = "#39C5CF";
          childBorder = "#FFFFFF00";
        };
        unfocused = {
          background = "#1E1B25";
          border = "#1E1B25";
          text = "#C9D1C9";
          indicator = "#39C5CF";
          childBorder = "#FFFFFF00";
        };
      };
      startup = [
        {
          command = "${pkgs.waybar}/bin/waybar";
          always = false;
        }
        {
          command = "${pkgs.mako}/bin/mako";
          always = true;
        }

        # idle daemon (locking the screen, turning off display)
        {
          command = ''
            ${pkgs.swayidle}/bin/swayidle -w \
              timeout 300 '${pkgs.swaylock}/bin/swaylock -f -c 111116' \
              timeout 600 'swaymsg "output * power off"' \
              resume 'swaymsg "output * power on"'
          '';
          always = false; # Only run once on initial login!
        }
      ];

      # Standard clean override mapping
      keybindings = {
        "XF86MonBrightnessUp" = "exec ${./scripts/bright} up";
        "XF86MonBrightnessDown" = "exec ${./scripts/bright} down";

        "XF86AudioRaiseVolume" = "exec ${./scripts/volume} up";
        "XF86AudioLowerVolume" = "exec ${./scripts/volume} down";
        "XF86AudioMute" = "exec ${./scripts/volume} mute";

        "XF86AudioMicMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";

        "Mod4+Return" = "exec ${pkgs.ghostty}/bin/ghostty";
        "Mod4+Space" = "exec ${pkgs.rofi}/bin/rofi -show drun";
        "Mod4+q" = "kill";
        "Mod4+w" = "floating toggle";
        "Mod4+Backspace" = "exec ${pkgs.sway}/bin/swaynag -t warning -m 'Exit Sway?' -B 'Yes' 'swaymsg exit'";
        "Mod4+f" = "fullscreen";
        "Mod4+l" = "exec ${./scripts/powermenu}";
        "Mod4+p" = "exec ${./scripts/power}";
        "Mod4+shift+s" = "exec ${./scripts/scrshot} --swappy";
        "Mod4+alt+s" = "exec ${./scripts/scrshot} --now";
        "Mod4+shift+a" = "exec ${./scripts/scrshot} --window";
        "Mod4+v" = "exec ${./scripts/clip}";
        "Mod4+Period" = "exec ${./scripts/emoji}";

        "Mod4+Down" = "workspace next";
        "Mod4+Up" = "workspace prev";
        "Mod4+Right" = "focus right";
        "Mod4+Left" = "focus left";

        "Mod4+Shift+Left" = "resize grow width 10 px or 10 ppt";
        "Mod4+Shift+Right" = "resize shrink width 10 px or 10 ppt";
        "Mod4+Shift+Up" = "resize grow height 10 px or 10 ppt";
        "Mod4+Shift+Down" = "resize shrink height 10 px or 10 ppt";

        "Mod4+1" = "workspace number 1";
        "Mod4+2" = "workspace number 2";
        "Mod4+3" = "workspace number 3";
        "Mod4+4" = "workspace number 4";
        "Mod4+5" = "workspace number 5";
        "Mod4+6" = "workspace number 6";
        "Mod4+7" = "workspace number 7";
        "Mod4+8" = "workspace number 8";

        "Mod4+Shift+1" = "move container to workspace number 1";
        "Mod4+Shift+2" = "move container to workspace number 2";
        "Mod4+Shift+3" = "move container to workspace number 3";
        "Mod4+Shift+4" = "move container to workspace number 4";
        "Mod4+Shift+5" = "move container to workspace number 5";
        "Mod4+Shift+6" = "move container to workspace number 6";
        "Mod4+Shift+7" = "move container to workspace number 7";
        "Mod4+Shift+8" = "move container to workspace number 8";
      };
    };
  };
}
