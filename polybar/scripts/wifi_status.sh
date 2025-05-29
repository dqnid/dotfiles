#!/bin/bash

# Author by : Daniel Heras
# Mail    : dani.heras@hotmail.com

n=$(nmcli device status | grep -wc connected)
#id=$(nmcli device status | grep -w connected | awk '{print $4}')
id=$(nmcli -t -f active,ssid dev wifi | grep -E '^yes' | cut -d\' -f2)
final_id=$(echo "${id#*:}")

if test $n -gt 1; then
	echo "%{F#ffffff} %{F#ced4da}$final_id"
elif test $n -eq 0; then
	echo "%{F#a4133c} %{F#ced4da}Sin conexión"
else 
	echo "%{F#ffffff} %{F#ced4da}$final_id"
fi
