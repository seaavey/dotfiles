#!/usr/bin/env bash
case "$1" in
  up)
    brightnessctl set 5%+
    ;;
  down)
    brightnessctl set 5%-
    ;;
esac

val=$(brightnessctl -m | awk -F, '{print $4}' | tr -d '%')
dunstify -a "Brightness" -u low -r 9994 -h int:value:"$val" "Brightness: ${val}%"
