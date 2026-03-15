srwm.spawn_once("xset r rate 200 50 &")
srwm.spawn_once("copyq &")
srwm.spawn_once("feh --bg-scale ~/.config/wallpapers/wave.png &")
srwm.spawn_once("flameshot &")
srwm.spawn_once("fcitx5 &")

srwm.key.bind("Mod4", "space", function()
	srwm.spawn("rofi -show drun -theme $HOME/.config/rofi/launcher.rasi")
end)

srwm.key.bind("Mod4+Mod1", "s", function()
	srwm.spawn("flameshot full")
end)

srwm.key.bind("Mod4+Shift", "s", function()
	srwm.spawn("flameshot gui")
end)

srwm.key.bind("Mod4", "l", function()
	srwm.spawn("slock")
end)

srwm.key.bind("Mod4", "v", function()
	srwm.spawn("copyq menu")
end)
