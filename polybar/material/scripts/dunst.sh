#!/bin/sh

# Author by : Daniel Heras
# Mail    : dani.heras@hotmail.com

if [ $(dunstctl is-paused) == 'false' ]
then
	echo "%{F#FFFFFF}"
else
	echo "%{F#ffbe0b} Pausadas"
fi
