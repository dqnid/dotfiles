#!/bin/sh

HISTORY_LENGTH=8
HISTORY_FILE_PATH=~/.tmp/clipboard_history.txt

touch $HISTORY_FILE_PATH >/dev/null

while clipnotify; do
    new_clip=$(xsel -b -o)
    is_found=$(grep -Fx "$new_clip" $HISTORY_FILE_PATH)
    if [ ${#is_found} -eq 0 ]; then
        echo "$new_clip" >> $HISTORY_FILE_PATH
        file_size=$(wc -l < $HISTORY_FILE_PATH)
        if [ $file_size -gt $HISTORY_LENGTH ]; then
            sed -i '1d' $HISTORY_FILE_PATH
        fi
    fi
done
