#!/bin/bash

# Author by : Daniel Heras
# Mail    : dani.heras@hotmail.com

if [ -f "/tmp/sleepStopped" ]; then
	echo "%{F#ef476f} stopped"
else
	echo "%{F#ced4da} sleepy"
fi
