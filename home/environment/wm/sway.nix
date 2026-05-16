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
    package = pkgs.sway;
    wrapperFeatures.gtk = true;

    # lspci | grep -i vga
    extraSessionCommands = ''
      export SDL_VIDEODRIVER=wayland
      export QT_QPA_PLATFORM=wayland
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
    '';
    extraConfig = ''
      workspace_layout tabbed
      title_align center
    '';
    config = {
      terminal = "${pkgs.ghostty}/bin/ghostty";
      output = {
        "*" = {
          # scale = "1.25";
          bg = "${../ui/config/wallpapers/nixgirl.png} fill";
        };
      };
      bars = [];
      fonts = {
        names = ["JetBrainsMono Nerd Font"];
        style = "SemiBold";
        size = 12.0;
      };
      colors = {
        # The active tab/title bar window
        focused = {
          border = "#313244"; # Subtle slate border
          background = "#313244"; # Matte dark gray title background
          text = "#ffffff"; # Crisp, pure white text for readability!
          indicator = "#a6adc8";
          childBorder = "#313244";
        };
        # Inactive background tabs
        unfocused = {
          border = "#1e1e2e";
          background = "#181825"; # Deep obsidian gray for background tabs
          text = "#6c7086"; # Muted ash gray text so it doesn't distract you~
          indicator = "#181825";
          childBorder = "#181825";
        };
      };

      # Standard clean override mapping
      keybindings = {
        "XF86MonBrightnessUp" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set +5%";
        "XF86MonBrightnessDown" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 5%-";

        # 2. Audio Volume Control (via wireplumber wpctl)
        "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ -l 1.0"; # Caps maximum hardware volume at 100%~
        "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";

        # 3. Microphone Control
        "XF86AudioMicMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";

        "Mod4+Return" = "exec ${pkgs.ghostty}/bin/ghostty";
        "Mod4+Space" = "exec ${pkgs.rofi}/bin/rofi -show drun";
        "Mod4+q" = "kill";
        "Mod4+Backspace" = "exec ${pkgs.sway}/bin/swaynag -t warning -m 'Exit Sway?' -B 'Yes' 'swaymsg exit'";
        "Mod4+f" = "fullscreen enable";
        "Mod4+l" = "exec ${pkgs.swaylock}/bin/swaylock";

        "Mod4+Left" = "focus left";
        "Mod4+Right" = "focus right";

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

      startup = [
        # Launch a status bar (like Waybar) on startup and reload
        {
          command = "${pkgs.waybar}/bin/waybar";
          always = true;
        }
        {
          command = "${pkgs.mako}/bin/mako";
          always = true;
        }
        {
          command = "${pkgs.fcitx5}/bin/fcitx5";
          always = false;
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

      window = {
        titlebar = true;
        border = 0;
        hideEdgeBorders = "smart"; # Cleans up edges if a window takes up the full screen
      };
      floating = {
        border = 0;
        titlebar = false;
      };

      gaps = {
        inner = 8; # Space between windows
        outer = 4; # Space between windows and screen edges
        smartGaps = true; # Collapse gaps automatically if only one window is open
      };
    };
  };
}
