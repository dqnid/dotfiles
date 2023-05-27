#!/bin/bash

# Author by : Daniel Heras
# Mail    : dani.heras@hotmail.com

if [ -f "/tmp/sleepStopped" ]; then
	echo "%{F#ef476f}"
else
	echo "%{F#ced4da}"
fi
