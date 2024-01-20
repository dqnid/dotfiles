#!/bin/bash

# Author by : Daniel Heras
# Mail    : dani.heras@hotmail.com

id=$(xinput list | grep Touchpad | awk '{print $6}' | grep -o '[0-9]\+')
prop=$(xinput list-props $id | grep "Device Enabled (" | awk '{print $3}' | grep -o '[0-9]\+')
val=$(xinput list-props $id | grep "Device Enabled (" | awk '{print $4}' | grep -o '[0-9]\+')
if [ $val = 0 ]; then
	echo "%{F#ce4257}"
else
	echo "%{F#40916c}"
fi
