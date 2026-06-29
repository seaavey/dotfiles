#!/usr/bin/env bash

# Terminate already running instances
killall -q hyprpanel
killall -q waybar
killall -q dunst
killall -q mako

# Wait until the processes have been shut down
while pgrep -x hyprpanel >/dev/null || pgrep -x waybar >/dev/null; do
    sleep 0.1
done

# Launch Waybar
waybar &

# Launch Dunst for notifications
dunst &
