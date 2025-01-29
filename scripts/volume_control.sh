#!/bin/bash

# Get action from first argument (increase or decrease)
ACTION=$1
STEP=5

# Adjust volume
if [ "$ACTION" == "up" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ +${STEP}%
elif [ "$ACTION" == "down" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ -${STEP}%
fi

# Get the actual volume level (first percentage found)
VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1 | tr -d '%')

# Cap at 100% (avoids jumping bug)
if [ "$VOLUME" -gt 100 ]; then
    pactl set-sink-volume @DEFAULT_SINK@ 100%
    VOLUME=100
fi

# Send notification
dunstify -r 9993 "Volume" "${VOLUME}%"
