{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [inputs.mangowc.hmModules.mango];
  wayland.windowManager.mango = {
    enable = true;
    settings = ''
       ██████╗ ███████╗███╗   ██╗███████╗██████╗  █████╗ ██╗
      ██╔════╝ ██╔════╝████╗  ██║██╔════╝██╔══██╗██╔══██╗██║
      ██║  ███╗█████╗  ██╔██╗ ██║█████╗  ██████╔╝███████║██║
      ██║   ██║██╔══╝  ██║╚██╗██║██╔══╝  ██╔══██╗██╔══██║██║
      ╚██████╔╝███████╗██║ ╚████║███████╗██║  ██║██║  ██║███████╗
       ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝
      tagrule=id:1,layout_name:scroller
      tagrule=id:2,layout_name:scroller
      tagrule=id:3,layout_name:scroller
      tagrule=id:4,layout_name:scroller
      tagrule=id:5,layout_name:scroller
      tagrule=id:6,layout_name:scroller
      tagrule=id:7,layout_name:scroller
      tagrule=id:8,layout_name:scroller
      tagrule=id:9,layout_name:scroller
      adaptive_sync=1
      disable_while_typing=1
      trackpad_natural_scrolling=1
      gappih=30
      gappiv=30
      gappoh=30
      gappov=30

      ████████╗██╗  ██╗███████╗███╗   ███╗██╗███╗   ██╗ ██████╗
      ╚══██╔══╝██║  ██║██╔════╝████╗ ████║██║████╗  ██║██╔════╝
         ██║   ███████║█████╗  ██╔████╔██║██║██╔██╗ ██║██║  ███╗
         ██║   ██╔══██║██╔══╝  ██║╚██╔╝██║██║██║╚██╗██║██║   ██║
         ██║   ██║  ██║███████╗██║ ╚═╝ ██║██║██║ ╚████║╚██████╔╝
         ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝

      focuscolor=0x86AFEFFF
      cursor_size=24
      cursor_theme=Bibata-Modern-Classic
      border_radius=12

       █████╗ ███╗   ██╗██╗███╗   ███╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
      ██╔══██╗████╗  ██║██║████╗ ████║██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
      ███████║██╔██╗ ██║██║██╔████╔██║███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗
      ██╔══██║██║╚██╗██║██║██║╚██╔╝██║██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║
      ██║  ██║██║ ╚████║██║██║ ╚═╝ ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║
      ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
      tag_animation_direction=0
      animations=1
      layer_animations=1
      animation_type_open=slide
      animation_type_close=slide
      animation_fade_in=1
      animation_fade_out=1
      zoom_initial_ratio=0.3
      zoom_end_ratio=0.8
      fadein_begin_opacity=0.5
      fadeout_begin_opacity=0.8
      animation_duration_move=400
      animation_duration_open=200
      animation_duration_tag=300
      animation_duration_close=150
      animation_duration_focus=0
      animation_curve_open=0.46,1.0,0.29,1
      animation_curve_move=0.46,1.0,0.29,1
      animation_curve_tag=0.46,1.0,0.29,1
      animation_curve_close=0.08,0.92,0,1
      animation_curve_focus=0.46,1.0,0.29,1


      ██╗  ██╗███████╗██╗   ██╗██████╗ ██╗███╗   ██╗██████╗ ███████╗
      ██║ ██╔╝██╔════╝╚██╗ ██╔╝██╔══██╗██║████╗  ██║██╔══██╗██╔════╝
      █████╔╝ █████╗   ╚████╔╝ ██████╔╝██║██╔██╗ ██║██║  ██║███████╗
      ██╔═██╗ ██╔══╝    ╚██╔╝  ██╔══██╗██║██║╚██╗██║██║  ██║╚════██║
      ██║  ██╗███████╗   ██║   ██████╔╝██║██║ ╚████║██████╔╝███████║
      ╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═════╝ ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝
      bind=SUPER,Return,spawn,ghostty
      bind=SUPER,space,spawn,dms ipc spotlight toggle
      bind=SUPER,q,killclient,
      bind=SUPER,r,reload_config
      bind=NONE,XF86AudioLowerVolume, spawn, dms ipc call audio decrement 2
      bind=NONE,XF86AudioRaiseVolume, spawn, dms ipc call audio increment 2
      bind=NONE,XF86AudioMute, spawn, dms ipc call audio mute
      bind=NONE,XF86MonBrightnessDown,spawn, dms ipc call brightness decrement 5 ""
      bind=NONE,XF86MonBrightnessUp,spawn, dms ipc call brightness increment 5 ""
      bind=SUPER+SHIFT, s, spawn, ${./scrshot} --swappy
      bind=SUPER+ALT, s, spawn, ${./scrshot} --now
      bind=SUPER, n, spawn, dms ipc notifications toggle
      bind=SUPER, l, spawn, dms ipc lock lock
      bind=SUPER, TAB, spawn, dms ipc call dash open overview
      bind=SUPER, s, spawn, dms ipc call control-center toggle
      bind=SUPER, i, spawn, dms ipc settings toggle
      bind=SUPER+SHIFT, w, spawn, dms ipc call dankdash wallpaper
      bind=SUPER, m, spawn, dms ipc call dash open media
      bind=SUPER, v, spawn, dms ipc clipboard toggle
      bind=SUPER+SHIFT,p,toggleglobal,
      bind=SUPER,a,toggleoverview,
      bind=SUPER,w,togglefloating,
      bind=SUPER,f,togglefullscreen,
      bind=SUPER,Left,focusdir,left
      bind=SUPER,Right,focusdir,right

      # swap window
      bind=SUPER+CTRL,Up,exchange_client,up
      bind=SUPER+CTRL,Down,exchange_client,down
      bind=SUPER+CTRL,Left,exchange_client,left
      bind=SUPER+CTRL,Right,exchange_client,right

      # resizewin
      bind=SUPER+SHIFT,Up,resizewin,+0,-50
      bind=SUPER+SHIFT,Down,resizewin,+0,+50
      bind=SUPER+SHIFT,Left,resizewin,-50,+0
      bind=SUPER+SHIFT,Right,resizewin,+50,+0

      bind=SUPER,Up,viewtoleft,0
      bind=SUPER,Down,viewtoright,0
      bind=CTRL+SUPER,Up,tagtoleft,0
      bind=CTRL+SUPER,Down,tagtoright,0

      mousebind=SUPER,btn_left,moveresize,curmove
      mousebind=SUPER,btn_right,moveresize,curresize
      gesturebind=none,Down,3,viewtoleft,0
      gesturebind=none,Up,3,viewtoright,0
      gesturebind=none,Right,3,focusdir,left
      gesturebind=none,Left,3,focusdir,right

      bind=CTRL+SUPER,s,setlayout,scroller

       █████╗ ██╗   ██╗████████╗ ██████╗ ███████╗████████╗ █████╗ ██████╗ ████████╗
      ██╔══██╗██║   ██║╚══██╔══╝██╔═══██╗██╔════╝╚══██╔══╝██╔══██╗██╔══██╗╚══██╔══╝
      ███████║██║   ██║   ██║   ██║   ██║███████╗   ██║   ███████║██████╔╝   ██║
      ██╔══██║██║   ██║   ██║   ██║   ██║╚════██║   ██║   ██╔══██║██╔══██╗   ██║
      ██║  ██║╚██████╔╝   ██║   ╚██████╔╝███████║   ██║   ██║  ██║██║  ██║   ██║
      ╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝ ╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝

      exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots
      exec-once=bash -c 'until ${pkgs.mpc}/bin/mpc > /dev/null 2>&1; do sleep 1; done; exec mpd-mpris'
      exec-once=mpd ${config.xdg.configHome}/mpd/mpd.conf
      exec-once=music-discord-rpc
      exec-once=dms run
      exec-once=fcitx5
    '';
  };
}
