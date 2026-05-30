{pkgs, ...}: {
  home.packages = with pkgs; [
    copyq
    cwm
    xclip
    nwg-look
    lemonbar-xft
    brightnessctl
  ];
  home.file.".xinitrc" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash
      xset r rate 200 50 &
      if command -v systemctl --user >/dev/null 2>&1; then
          systemctl --user import-environment DISPLAY XAUTHORITY
          dbus-update-activation-environment --systemd DISPLAY XAUTHORITY
      fi
      export XMODIFIERS=@im=fcitx
      export GTK_IM_MODULE=fcitx
      export QT_IM_MODULE=fcitx
      export SDL_IM_MODULE=fcitx
      export GLFW_IM_MODULE=fcitx
      xsetroot -solid "#FFFFEB"
      ${./scripts/bar.sh} &
      fcitx5 &
      copyq &
      # xrandr --output DP-2 --mode 1920x1080 --rate 144.00
      # export __GLX_VENDOR_LIBRARY_NAME=nvidia
      # export __NV_PRIME_RENDER_OFFLOAD=1
      exec cwm
    '';
  };
  home.file.".cwmrc".text = ''
    unbind-key all
    unbind-mouse all

    fontname "JetBrainsMono Nerd Font:pixelsize=13:bold"
    borderwidth 3

    color activeborder   "#1e1b25"
    # color inactiveborder "#1e1b25"
    # color menubg         "#1e1b25"
    # color menufg         "#f8f8f2"
    # color selfont        "#86afef"
    ignore lemonbar

    sticky yes # New windows automatically join current workspace

    bind-key XF86AudioRaiseVolume "pactl set-sink-volume @DEFAULT_SINK@ +2%"
    bind-key XF86AudioLowerVolume "pactl set-sink-volume @DEFAULT_SINK@ -2%"
    bind-key XF86AudioMute "pactl set-sink-mute @DEFAULT_SINK@ toggle"
    bind-key XF86MonBrightnessUp "brightnessctl set +5%"
    bind-key XF86MonBrightnessDown "brightnessctl set 5%-"

    bind-key 4-Return    "ghostty"  # Direct fast path to terminal
    bind-key 4-l     "slock"
    bind-key M-space         menu-exec     # Built-in system app path launcher
    bind-key 4-slash menu-window

    bind-key 4-space menu-cmd
    bind-mouse 3 menu-cmd
    command terminal   "ghostty"
    command editor   "ghostty -e nvim"
    command files      "ghostty -e yazi"
    command browser    "firefox"
    command music    "pear-desktop"
    command vesktop    "vesktop"
    command monitor    "ghostty -e htop"
    command screenshot    "flameshot gui"
    command clipboard    "copyq show"
    command "-------------" "true"
    command suspend    "${./scripts/suspend.sh}"
    command logout     quit
    command reboot     "reboot"
    command shutdown   "shutdown -P now"


    bind-key 4-q         window-close
    bind-key M-Tab window-cycle

    bind-mouse 4-1 window-move
    bind-mouse 4-3 window-resize

    bind-key 4-Right group-cycle
    bind-key 4-Left group-rcycle

    bind-key 4S-f        window-fullscreen
    bind-key 4-f         window-maximize

    bind-key 4-1         group-only-1
    bind-key 4-2         group-only-2
    bind-key 4-3         group-only-3
    bind-key 4-4         group-only-4
    bind-key 4-5         group-only-5
    bind-key 4-6         group-only-6
    bind-key 4-7         group-only-7
    bind-key 4-8         group-only-8

    bind-key 4S-1        window-movetogroup-1
    bind-key 4S-2        window-movetogroup-2
    bind-key 4S-3        window-movetogroup-3
    bind-key 4S-4        window-movetogroup-4
    bind-key 4S-5        window-movetogroup-5
    bind-key 4S-6        window-movetogroup-6
    bind-key 4S-7        window-movetogroup-7
    bind-key 4S-8        window-movetogroup-8

    bind-key 4S-r        restart            # Live-reload
    bind-key 4-BackSpace        quit               # Clean log-out out of X11 session
  '';
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
    config = {
      common = {
        default = ["gtk"];
      };
    };
  };
}
