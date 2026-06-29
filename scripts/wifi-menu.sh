#!/usr/bin/env bash

# Rofi Wi-Fi Menu Script
# Description: Scans for nearby Wi-Fi networks, displays them via Rofi,
#              handles password input, and manages connections/disconnections
#              using nmcli (NetworkManager).

notify-send "Wi-Fi" "Scanning for nearby networks..." -i network-wireless &

wifi_list=$(nmcli -t -f "ACTIVE,SSID,BARS,SECURITY" device wifi list | grep -v '^:[^:]')

if [ -z "$wifi_list" ]; then
    notify-send "Wi-Fi" "No networks found." -i network-error
    exit 1
fi

options=""
while IFS=: read -r active ssid bars security; do
    if [ -z "$ssid" ]; then
        continue
    fi

    if [ -z "$security" ]; then
        sec_str="Open"
    else
        sec_str="$security"
    fi

    if [ "$active" = "yes" ]; then
        options="${options}*[Connected] $bars  $ssid ($sec_str)\n"
    else
        options="${options}$bars  $ssid ($sec_str)\n"
    fi
done <<< "$wifi_list"

options=$(echo -e "$options" | awk '!seen[$0]++' | sed '/^$/d')

chosen_line=$(echo -e "$options" | rofi -dmenu -i -p "Select Wi-Fi:" -width 40 -lines 10)

if [ -z "$chosen_line" ]; then
    exit 0
fi

if [[ "$chosen_line" == *"[Connected]"* ]]; then
    disconnect=$(echo -e "Yes\nNo" | rofi -dmenu -i -p "Disconnect from current Wi-Fi?" -width 30 -lines 2)
    if [ "$disconnect" = "Yes" ]; then
        active_connection=$(nmcli -t -f "ACTIVE,NAME" connection show | grep "^yes:" | cut -d: -f2)
        if [ -n "$active_connection" ]; then
            nmcli connection down id "$active_connection"
            notify-send "Wi-Fi" "Connection disconnected." -i network-wireless
        fi
    fi
    exit 0
fi

target_ssid=""
target_security=""

while IFS=: read -r active ssid bars security; do
    if [ -z "$ssid" ]; then
        continue
    fi

    if [ -z "$security" ]; then
        sec_str="Open"
    else
        sec_str="$security"
    fi

    disp_str="$bars  $ssid ($sec_str)"

    if [ "$chosen_line" = "$disp_str" ]; then
        target_ssid="$ssid"
        target_security="$security"
        break
    fi
done <<< "$wifi_list"

if [ -z "$target_ssid" ]; then
    notify-send "Wi-Fi" "Error: Network not found." -i network-error
    exit 1
fi

notify-send "Wi-Fi" "Connecting to $target_ssid..." -i network-wireless

if [ -z "$target_security" ]; then
    if nmcli device wifi connect "$target_ssid"; then
        notify-send "Wi-Fi" "Successfully connected to $target_ssid" -i network-wireless
    else
        notify-send "Wi-Fi" "Failed to connect to $target_ssid" -i network-error
    fi
else
    has_saved=$(nmcli -t -f "NAME" connection show | grep -Fwx "$target_ssid")

    if [ -n "$has_saved" ]; then
        if nmcli connection up id "$target_ssid"; then
            notify-send "Wi-Fi" "Successfully connected to $target_ssid" -i network-wireless
            exit 0
        fi
    fi

    password=$(rofi -dmenu -password -p "Enter password for $target_ssid:")

    if [ -z "$password" ]; then
        exit 0
    fi

    if nmcli device wifi connect "$target_ssid" password "$password"; then
        notify-send "Wi-Fi" "Successfully connected to $target_ssid" -i network-wireless
    else
        notify-send "Wi-Fi" "Connection failed. Please check the password." -i network-error
    fi
fi
