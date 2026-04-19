{pkgs, ...}: {
  home.packages = with pkgs; [xwayland-satellite];
  home.file.".config/niri/config.kdl".text = ''
        cursor {
            xcursor-theme "Bibata-Modern-Classic"
            xcursor-size 24
        }
        screenshot-path "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png"
        hotkey-overlay {
            skip-at-startup
        }
        overview {
            workspace-shadow {
                off
            }
        }
        input {
            keyboard {
                repeat-delay 150
                repeat-rate 50
                numlock
            }

            touchpad {
                tap
                dwt
                natural-scroll
                accel-speed 0.2
                disabled-on-external-mouse
            }
            focus-follows-mouse max-scroll-amount="0%"
        }

        animations {}
        layer-rule {
            match namespace="waybar"
            match at-startup=true
            opacity 0.99999
            //block-out-from "screencast"
            geometry-corner-radius 12
            place-within-backdrop true
        }
        layer-rule {
            match namespace="^quickshell$"
            place-within-backdrop true
        }
        layer-rule {
            match namespace="^notifications$"

            block-out-from "screencast"
        }
        output "eDP-1" {
            variable-refresh-rate on-demand=true
            mode "1920x1080@144.000"
            scale 1
            transform "normal"
            position x=0 y=0
        }
        layout {
            gaps 16
            background-color "transparent"
            //center-focused-column "always"
            preset-column-widths {
                proportion 0.33333
                proportion 0.5
                proportion 0.66667
            }

            default-column-width { proportion 0.5; }

            focus-ring {
                width 4
                active-color "#7aa2f7"
                inactive-color "#505050"
            }
        }
        // prefer-no-csd

    window-rule {
        match app-id=r#"firefox$"# title="^Picture-in-Picture$"
        open-floating true
    }

    window-rule {
        match app-id=r#"imv$"#
        open-floating true
    }
    window-rule {
        geometry-corner-radius 10
        clip-to-geometry true
    }
    window-rule {
       shadow {
                off
                draw-behind-window true
                softness 30
                spread 10
                offset x=0 y=5
                color "#0007"
            }
        }

        environment {
          DISPLAY ":0"
        }

        spawn-at-startup "fcitx5"
        spawn-at-startup "dms run"

        binds {
            XF86AudioRaiseVolume allow-when-locked=true { spawn "dms" "ipc" "call" "audio" "increment" "2"; }
            XF86AudioLowerVolume allow-when-locked=true { spawn "dms" "ipc" "call" "audio" "decrement" "2"; }
            XF86AudioMute allow-when-locked=true { spawn "dms" "ipc" "call" "audio" "mute"; }
            XF86AudioMicMute allow-when-locked=true { spawn "dms" "ipc" "call" "audio" "micmute"; }
            XF86MonBrightnessUp allow-when-locked=true { spawn "dms" "ipc" "call" "brightness" "increment" "5" ""; }
            XF86MonBrightnessDown allow-when-locked=true { spawn "dms" "ipc" "call" "brightness" "decrement" "5" ""; }

            Mod+Space hotkey-overlay-title="Run an Application" { spawn "dms" "ipc" "spotlight" "toggle"; }
            Mod+V hotkey-overlay-title="Clipboard Manager" { spawn "dms" "ipc" "clipboard" "toggle"; }
            Mod+L hotkey-overlay-title="Lock Screen" { spawn "dms" "ipc" "lock" "lock"; }
            Mod+N hotkey-overlay-title="Notification" { spawn "dms" "ipc" "notifications" "toggle"; }
            Mod+I hotkey-overlay-title="Settings" { spawn "dms" "ipc" "settings" "toggle"; }
            Mod+S hotkey-overlay-title="Control Center" { spawn "dms" "ipc" "call" "control-center" "toggle"; }
            Mod+P hotkey-overlay-title="Processes" { spawn "dms" "ipc" "processlist" "toggle"; }

            Mod+Return hotkey-overlay-title="Open a Terminal: ghostty" { spawn "ghostty"; }
            Mod+Q { close-window; }
            Mod+W repeat=false { toggle-overview; }
            Mod+Shift+W       { toggle-window-floating; }

            Mod+Left  { focus-column-left; }
            Alt+Down  { focus-window-down; }
            Alt+Up    { focus-window-up; }
            Mod+Right { focus-column-right; }

            Mod+Ctrl+Left  { consume-or-expel-window-left; }
            Mod+Ctrl+Right { consume-or-expel-window-right; }

            Mod+Down              { focus-workspace-down; }
            Mod+Up              { focus-workspace-up; }
            Mod+WheelScrollDown      cooldown-ms=150 { focus-workspace-down; }
            Mod+WheelScrollUp        cooldown-ms=150 { focus-workspace-up; }

            Mod+Ctrl+Down         { move-column-to-workspace-down; }
            Mod+Ctrl+Up         { move-column-to-workspace-up; }
            Mod+Ctrl+WheelScrollDown cooldown-ms=150 { move-column-to-workspace-down; }
            Mod+Ctrl+WheelScrollUp   cooldown-ms=150 { move-column-to-workspace-up; }

            Mod+Shift+U         { move-workspace-down; }
            Mod+Shift+I         { move-workspace-up; }

            Mod+F { maximize-column; }
            Mod+Shift+F { fullscreen-window; }

            Mod+Shift+Left { set-column-width "-10%"; }
            Mod+Shift+Right { set-column-width "+10%"; }

            Mod+Shift+Up { set-window-height "-10%"; }
            Mod+Shift+Down { set-window-height "+10%"; }

            Mod+Shift+S { screenshot; }
            Mod+Alt+S { screenshot-screen; }
            Alt+Print { screenshot-window; }
            Mod+Escape allow-inhibiting=false { toggle-keyboard-shortcuts-inhibit; }
        }
  '';
}
