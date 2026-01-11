{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  scriptsDir = builtins.toString ./scripts;
in {
  home.packages = with pkgs; [
    libnotify
    bc
    jq
    glib
    brightnessctl
  ];
  services.cliphist.enable = true;
  wayland.windowManager.hyprland = {
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
    package = pkgs.hyprland;
    enable = true;
    xwayland.enable = true;
    plugins = with pkgs; [
      # hyprlandPlugins.hyprspace
      # hyprlandPlugins.hyprbars
      # hyprlandPlugins.hyprscrolling
    ];
    settings = {
      monitor = [
        "eDP-2, highrr, 0x0, 1"
        "Unknown-1, disable"
        "HDMI-A, highrr, -1920x0, 1"
      ];
      exec-once = [
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "hyprctl setcursor Bibata-Modern-Classic 24"
        # "hyprctl plugin load ${pkgs.hyprlandPlugins.hyprscrolling}/lib/libhyprscrolling.so"
      ];

      decoration = {
        #   inactive_opacity = 0.85;
        #   active_opacity = 1.0;
        rounding = 10;
        blur = {
          enabled = false;
          size = 5;
          passes = 3;
          new_optimizations = "yes";
          contrast = 1;
          brightness = 1;
        };
        shadow = {
          enabled = false;
          range = 10;
          render_power = 2;
          color = "rgba(0, 0, 0, 0.25)";
        };
      };

      input = {
        kb_layout = "us";
        numlock_by_default = true;
        follow_mouse = 1;
        sensitivity = 0.4;
        touchpad = {
          natural_scroll = true;
          tap-to-click = true;
          disable_while_typing = true;
        };
      };

      general = {
        gaps_in = 5;
        gaps_out = 20;
        # gaps_in = 0;
        # gaps_out = 0;
        border_size = 3;
        "col.active_border" = "0xFF2E3337";
        "col.inactive_border" = "0xFF1B1E25";
        layout = "dwindle";
      };

      bezier = [
        "myBezier, 0.4, 0.0, 0.2, 1.0"
      ];
      animations = {
        enabled = true;
      };

      animation = [
        "windows, 1, 2.5, myBezier, popin 80%"
        "border, 1, 2.5, myBezier"
        "fade, 1, 2.5, myBezier"
        "workspaces, 1, 2.5, myBezier, slidefade 20%"
      ];

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      cursor = {
        no_hardware_cursors = false;
      };

      gesture = [
        "3, horizontal, workspace"
      ];

      misc = {
        disable_hyprland_logo = true;
        vfr = true;
        vrr = 1;
      };

      debug = {
        disable_logs = false;
      };

      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];

      bind = [
        "SUPER, Return, exec, uwsm app -- ghostty"
        ",XF86AudioLowerVolume, exec, dms ipc call audio decrement 2"
        ",XF86AudioRaiseVolume, exec, dms ipc call audio increment 2"
        ",XF86AudioMute, exec, dms ipc call audio mute"
        ",XF86MonBrightnessDown,exec, dms ipc call brightness decrement 5 ''"
        ",XF86MonBrightnessUp,exec, dms ipc call brightness increment 5 ''"

        "SUPER, Space, exec, dms ipc spotlight toggle"
        "SUPER, N, exec, dms ipc notifications toggle"
        "SUPER, Q, killactive,"
        "SUPER SHIFT, P, pin,"
        "SUPER, F, fullscreen"
        "SUPER, L, exec, dms ipc lock lock"
        "SUPER, I, exec, dms ipc call control-center toggle"
        "SUPER, R, exec, sh -c 'pkill waybar || uwsm app -- waybar'"
        "SUPER, W, togglefloating"
        "SUPER SHIFT, W, exec, dms ipc call dankdash wallpaper"
        "SUPER, M, exec, dms ipc call dash open media"
        "SUPER, V, exec, dms ipc clipboard toggle"
        "SUPER SHIFT, S, exec, ${scriptsDir}/scrshot --swappy"
        "SUPER ALT, S, exec, ${scriptsDir}/scrshot --now"
        #"SUPER, Period, exec, ${rofiScriptsDir}/emoji"
        #Hidden workspace
        #"SUPER ALT, S, movetoworkspacesilent, special"
        #"SUPER, S, togglespecialworkspace,"
        #Focus
        "SUPER, up, movefocus, l"
        "SUPER, down, movefocus, r"
        # Switch workspaces
        "SUPER, right, workspace, r+1"
        "SUPER, left, workspace, r-1"
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"
        "SUPER, 0, workspace, 10"
        # Move active window to a workspace
        "SUPER SHIFT, 1, movetoworkspacesilent, 1"
        "SUPER SHIFT, 2, movetoworkspacesilent, 2"
        "SUPER SHIFT, 3, movetoworkspacesilent, 3"
        "SUPER SHIFT, 4, movetoworkspacesilent, 4"
        "SUPER SHIFT, 5, movetoworkspacesilent, 5"
        "SUPER SHIFT, 6, movetoworkspacesilent, 6"
        "SUPER SHIFT, 7, movetoworkspacesilent, 7"
        "SUPER SHIFT, 8, movetoworkspacesilent, 8"
        "SUPER SHIFT, 9, movetoworkspacesilent, 9"
        "SUPER SHIFT, 0, movetoworkspacesilent, 10"
        "SUPER CTRL, right, movetoworkspace, +1"
        "SUPER CTRL, left, movetoworkspace, -1"
        # Move/resize windows
        "SUPER SHIFT, right, resizeactive, 50 0"
        "SUPER SHIFT, left, resizeactive, -50 0"
        "SUPER SHIFT, up, resizeactive, 0 -50"
        "SUPER SHIFT, down, resizeactive, 0 50"
        "SUPER CTRL, left, movewindow, u"
        "SUPER CTRL, right, movewindow, d"
      ];

      env = [
        "AQ_DRM_DEVICES,/dev/dri/card2:/dev/dri/card1"

        "QT_SCALE_FACTOR,1"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_QPA_PLATFORMTHEME,gtk3"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "MOZ_ENABLE_WAYLAND,1"
        "EGL_PLATFORM,wayland"

        "LIBVA_DRIVER_NAME,nvidia"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "GBM_BACKEND,nvidia-drm"
        "NVD_BACKEND,direct"
      ];

      windowrulev2 = [
        "opacity 1 1,floating:1"
        "float,class:^(Rofi|rofi)$"
        "float,class:^(imv)$"
        #"opacity 0.85 0.7, class:^(Alacritty)$ # Alacritty"
        "opacity 0.0 override, class:^(xwaylandvideobridge)$"
        "noanim, class:^(xwaylandvideobridge)$"
        "noinitialfocus, class:^(xwaylandvideobridge)$"
        "maxsize 1 1, class:^(xwaylandvideobridge)$"
        "noblur, class:^(xwaylandvideobridge)$"
      ];
    };
  };
}
