#!/bin/bash

# Author by : Daniel Heras
# Mail    : dani.heras@hotmail.com

grafica="$(sensors | grep 'Sensor 2' | awk '{print $3}')"
cpu="$(sensors | grep -A 10 'gigabyte' | grep 'temp3' | awk '{print $2}')"

echo "%{F#ffffff} %{F#c4c7c5}CPU: $cpu  %{F#c4c7c5}GPU: $grafica"
