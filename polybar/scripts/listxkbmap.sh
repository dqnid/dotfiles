#!/bin/bash

layout=$(xkb-switch)
caps_lock_status=$(xset -q | sed -n 's/^.*Caps Lock:\s*\(\S*\).*$/\1/p')
if [ $caps_lock_status == "on" ]; then
  caps="- CAPS"
fi

echo ${layout:0:2} ${caps}
