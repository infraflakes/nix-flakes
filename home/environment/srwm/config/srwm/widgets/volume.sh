#!/bin/sh
# srwm widget: volume (Universal PulseAudio/PipeWire)

SINK=$(pactl get-default-sink 2>/dev/null)
[ $? -ne 0 ] && printf "^c{black}^ ^b{red}^ 󰝟 Error" && exit 0

VOL_RAW=$(pactl get-sink-volume "$SINK" | awk '{print $5}' | tr -d '%')
IS_MUTED=$(pactl get-sink-mute "$SINK" | awk '{print $2}')

# Check for Mute
if [ "$IS_MUTED" = "yes" ]; then
    printf "^c{black}^ ^b{red}^ 󰝟 Muted"
    exit 0
fi

# Determine Icon based on volume integer
if [ "$VOL_RAW" -eq 0 ]; then
    ICON="󰝟"
elif [ "$VOL_RAW" -le 33 ]; then
    ICON="󰕿"
elif [ "$VOL_RAW" -le 66 ]; then
    ICON="󰖀"
else
    ICON="󰕾"
fi

printf "^c{black}^ ^b{green}^ %s ^b{darkgreen}^ %s%%" "$ICON" "$VOL_RAW"
