#!/bin/bash

# Get the default sink name
DEFAULT_SINK=$(pactl info | grep 'Default Sink' | cut -d' ' -f3)

# Get the mute status of the default sink
MUTE_STATUS=$(pactl list sinks | grep -A 15 "Name: $DEFAULT_SINK" | grep 'Mute:' | awk '{print $2}')

if [ "$MUTE_STATUS" = "yes" ]; then
    pactl set-sink-mute @DEFAULT_SINK@ toggle &&  dunstify "Mute Off"
else
    pactl set-sink-mute @DEFAULT_SINK@ toggle &&  dunstify "Mute On"
fi
