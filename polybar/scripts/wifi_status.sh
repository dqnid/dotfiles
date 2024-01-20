#!/bin/bash

# Author by : Daniel Heras
# Mail    : dani.heras@hotmail.com

n=$(nmcli device status | grep -wc connected)
id=$(nmcli device status | grep -w connected | awk '{print $4}')

if test $n -gt 1; then
	echo "%{F#0077b6} %{F#ffffff}Multired"
elif test $n -eq 0; then
	echo "%{F#a4133c} %{F#ced4da}Sin conexión"
else 
	echo "%{F#0077b6} %{F#ffffff}$id"
fi
