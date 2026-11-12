#!/bin/bash

choice=$(printf '%s\n' \
    "  Lock" \
    "󰤄  Suspend" \
    "󰜉  Restart" \
    "󰐥  Shutdown" |
    rofi -dmenu -i \
        -p "Power" \
        -theme ~/.config/rofi/power.rasi)

case "$choice" in
    *Lock*)
        grim "$HOME/Pictures/lockscreen.png" &&
        magick "$HOME/Pictures/lockscreen.png" \
            -resize 50% \
            -blur 0x15 \
            -resize 200% \
            "$HOME/Pictures/lockscreen-blur.png" &&
        swaylock -f \
            -i "$HOME/Pictures/lockscreen-blur.png" \
            --scaling fill \
            --ring-color 958798 \
            --key-hl-color c9b9d0
        ;;
    *Suspend*) systemctl suspend ;;
    *Restart*) systemctl reboot ;;
    *Shutdown*) systemctl poweroff ;;
esac
