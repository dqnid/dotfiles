#!/bin/bash

# pactl list sinks | grep -e "Name" -e "Description"
# pactl set-default-sink
# HiFi__Headphones__sink -> laptop
# bluez_sink -> bluetooth
# USB_Audio_Device -> usb headset
# usb-Synaptics -> usb-c headset
# <HDMI1/HDMI2/HDMI3>__sink -> Screen
getFormalNameFromSink() {
    case "$1" in
        *HiFi__Headphones__sink*)
            echo "Laptop speakers"
            ;;
        *bluez*)
            echo "Bluetooth audio"
            ;;
        *usb-Synaptics*)
            echo "USB-c audio"
            ;;
        *USB*)
            echo "USB audio"
            ;;
        *HDMI*)
            echo "External screen audio"
            ;;
    esac
}

declare -A sink_map
declare menu_options

sink_list=$(pactl list sinks | grep -e "Name" | awk -F: '{print $2}' | xargs)

for sink in $sink_list; do
    formal_name=$(getFormalNameFromSink $sink)
    sink_map["$formal_name"]="$sink"
    if [[ ${#menu_options} -ne 0 ]]; then
        menu_options="$menu_options|"
    fi
    menu_options="$menu_options$formal_name"
done

chosen_option="$(rofi -no-config -no-lazy-grab -sep "|" -dmenu -i -p 'Audio outputs' -width 12 -line-padding 3 -lines 6 <<< "$menu_options")"

[[ "$chosen_option" == "" ]] && exit 0

chosen_sink="${sink_map["$chosen_option"]}"

pactl set-default-sink $chosen_sink

notify-send -t 3500 "Default Audio output" "$chosen_option"
