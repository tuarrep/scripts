#!/bin/sh
# based on https://unix.stackexchange.com/a/209047

# Sample usage: ./change-colume-app.sh chromium 50
# Set Chromium volume at 50% (on some systems you can go up to 120%)

LANGUAGE="en_US"

app_name="$1"
volume="$2"

current_sink_num=''
sink_num_check=''
app_name_check=''

pactl list sink-inputs |while read line; do \
    sink_num_check=$(echo "$line" |sed -rn 's/^Sink Input #(.*)/\1/p')
    if [ "$sink_num_check" != "" ]; then
        current_sink_num="$sink_num_check"
    else
        app_name_check=$(echo "$line" \
            |sed -rn 's/application.name = "([^"]*)"/\1/p')
        if [ "$app_name_check" = "$app_name" ]; then
            echo "$current_sink_num" "$app_name_check"

            pactl set-sink-input-volume "$current_sink_num" "$volume"%
            notify-send -a change-volume -i multimedia-audio-player "Volume set" "$app_name volume set to $volume"
        fi
    fi
done
