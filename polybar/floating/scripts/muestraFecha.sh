#!/bin/bash

# Author by : Daniel Heras
# Mail    : dani.heras@hotmail.com

dia="$(date +"%a %d")"
mes="$(date +"%B")"
hora="$(date +"%R")"
echo "%{F#ffffff} %{F#c4c7c5}$dia de $mes %{F#ffffff} %{F#ffffff}$hora"
