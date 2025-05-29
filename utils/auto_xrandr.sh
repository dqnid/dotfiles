#!/bin/bash

## open if opened
is_lid_open="$(cat /proc/acpi/button/lid/LID0/state | awk '{print $2}')"

# Only allow 1 extra monitor
aditional_monitor_option=""
clean_monitor_option=""

output_new="$(xrandr | grep "HDMI-A-0 connected")"
if [[ ${#output_new} -ne 0 ]]; then
    aditional_monitor_option="--output HDMI-A-0 --auto --above eDP"
else
    clean_monitor_option+="--output HDMI-A-0 --off "
fi

output_new="$(xrandr | grep "DisplayPort-0 connected")"
if [[ ${#output_new} -ne 0 ]]; then
    aditional_monitor_option="--output DisplayPort-0 --auto --above eDP"
else
    clean_monitor_option+="--output DisplayPort-0 --off "
fi

output_new="$(xrandr | grep "DisplayPort-1 connected")"
if [[ ${#output_new} -ne 0 ]]; then
   aditional_monitor_option="--output DisplayPort-1 --auto --above eDP"
else
    clean_monitor_option+="--output DisplayPort-1 --off "
fi

base_monitor_option="--output eDP --auto --primary"
[[ "$is_lid_open" != "open" && ${#aditional_monitor_option} -ne 0 ]] && base_monitor_option="--output eDP --off"

xrandr $clean_monitor_option $base_monitor_option $aditional_monitor_option

if [[ ${#aditional_monitor_option} -eq 0 && $is_lid_open != "open" ]]; then
    betterlockscreen -l -w &
    systemctl suspend
    exit 1
fi

bash ~/.config/bspwm/bspwmrc
bash ~/.config/polybar/launch.sh
