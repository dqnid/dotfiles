#!/bin/sh

# Author by : Daniel Heras
# Mail    : dani.heras@hotmail.com

if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
  echo "%{F#415a77}"
else
  if [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]
  then 
    echo ""
  else
    echo "%{F#40916c}"
  fi
fi

