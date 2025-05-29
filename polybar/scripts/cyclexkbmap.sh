#!/bin/bash

layouts=("es" "us")
variants=("none" "intl")

currentLayout=$(xkb-switch)
currentLayoutCleaned=${currentLayout:0:2}
for i in "${!layouts[@]}"; do
  if test ${layouts[i]} == $currentLayoutCleaned; then
    nextLayout=${layouts[(i+1)%${#layouts}]}
    nextVariant=${variants[(i+1)%${#variants}]}
    setxkbmap -layout $nextLayout -variant $nextVariant
  fi
done

