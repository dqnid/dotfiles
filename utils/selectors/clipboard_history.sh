#!/bin/bash

HISTORY_FILE_PATH=~/.tmp/clipboard_history.txt

clip_options=$(cat $HISTORY_FILE_PATH)

chosen_option="$(rofi -no-config -no-lazy-grab -sep "\n" -dmenu -i -p 'Audio outputs' -width 12 -line-padding 3 -lines 8 <<< "$clip_options")"

echo -n $chosen_option | xsel -b
