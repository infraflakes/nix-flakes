#!/usr/bin/env sh

BG="#FFFFEB"
FG="#000000"

LAST_OUTPUT=""

while true; do
    # 1. Get Battery
    if [ -d /sys/class/power_supply/BAT0 ]; then
        BAT=$(cat /sys/class/power_supply/BAT0/capacity)
        BAT_STR="[${BAT}%]"
    else
        BAT_STR="NO BAT"
    fi

    # 2. Get Date and Time (with seconds)
    DATE=$(date "+[%Y-%m-%d]")
    TIME=$(date "+[%H:%M:%S]")

    CURRENT_OUTPUT="%{r}%{B${BG}}%{F${FG}} ${TIME} ${BAT_STR} ||||||||||| ${DATE}  "

    # 4. Only pipe if the text updates
    if [ "$CURRENT_OUTPUT" != "$LAST_OUTPUT" ]; then
        echo "$CURRENT_OUTPUT"
        LAST_OUTPUT="$CURRENT_OUTPUT"
    fi

    sleep 1
done | lemonbar -p -n lemonbar -g "x28" -f "monospace:weight=bold:size=10" -B "$BG" -F "$FG"
