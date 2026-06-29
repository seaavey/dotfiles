#!/usr/bin/env bash
case "$1" in
  up)
    wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
    ;;
  down)
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
    ;;
  mute)
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    ;;
esac

vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed 's/.*: //' | sed 's/\.//' | sed 's/^0*//')
mute=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -o "MUTED" || true)

if [ -n "$mute" ]; then
  dunstify -a "Volume" -u low -r 9993 -h int:value:0 "Volume Muted"
else
  dunstify -a "Volume" -u low -r 9993 -h int:value:"$vol" "Volume: ${vol}%"
fi
