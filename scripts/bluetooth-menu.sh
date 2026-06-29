#!/usr/bin/env bash

# Rofi Bluetooth Menu Script
# Description: Manages Bluetooth connections, pairing, and power states
#              using bluetoothctl and Rofi.

power_status=$(bluetoothctl show | grep "Powered:" | awk '{print $2}')

if [ "$power_status" = "no" ]; then
    chosen=$(echo -e "Turn On\nExit" | rofi -dmenu -i -p "Bluetooth is Off" -width 30 -lines 2)
    if [ "$chosen" = "Turn On" ]; then
        bluetoothctl power on
        notify-send "Bluetooth" "Bluetooth turned on" -i bluetooth
    fi
    exit 0
fi

paired_devices=$(bluetoothctl devices)

options="Scan / Pair (Terminal)\nTurn Off\n"
while read -r line; do
    if [ -z "$line" ]; then
        continue
    fi
    mac=$(echo "$line" | awk '{print $2}')
    name=$(echo "$line" | cut -d' ' -f3-)

    info=$(bluetoothctl info "$mac")
    if echo "$info" | grep -q "Connected: yes"; then
        options="${options}*[Connected] $name\n"
    else
        options="${options}$name\n"
    fi
done <<< "$paired_devices"

options=$(echo -e "$options" | sed '/^$/d')

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Bluetooth Devices" -width 40 -lines 10)

if [ -z "$chosen" ]; then
    exit 0
fi

if [ "$chosen" = "Turn Off" ]; then
    bluetoothctl power off
    notify-send "Bluetooth" "Bluetooth turned off" -i bluetooth
    exit 0
fi

if [ "$chosen" = "Scan / Pair (Terminal)" ]; then
    notify-send "Bluetooth" "Opening bluetoothctl..." -i bluetooth
    kitty -e bluetoothctl &
    exit 0
fi

is_connected=false
if [[ "$chosen" == *"[Connected]"* ]]; then
    is_connected=true
    name=$(echo "$chosen" | sed 's/^\*\[Connected\] //')
else
    name="$chosen"
fi

mac=""
while read -r line; do
    if [ -z "$line" ]; then
        continue
    fi
    m=$(echo "$line" | awk '{print $2}')
    n=$(echo "$line" | cut -d' ' -f3-)
    if [ "$n" = "$name" ]; then
        mac="$m"
        break
    fi
done <<< "$paired_devices"

if [ -z "$mac" ]; then
    notify-send "Bluetooth" "Device not found" -i bluetooth
    exit 1
fi

if [ "$is_connected" = true ]; then
    notify-send "Bluetooth" "Disconnecting from $name..." -i bluetooth
    if bluetoothctl disconnect "$mac"; then
        notify-send "Bluetooth" "Disconnected from $name" -i bluetooth
    else
        notify-send "Bluetooth" "Failed to disconnect" -i bluetooth
    fi
else
    notify-send "Bluetooth" "Connecting to $name..." -i bluetooth
    if bluetoothctl connect "$mac"; then
        notify-send "Bluetooth" "Connected to $name" -i bluetooth
    else
        notify-send "Bluetooth" "Failed to connect" -i bluetooth
    fi
fi
