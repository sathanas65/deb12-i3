#!/bin/bash

# Get action from first argument (increase or decrease)
ACTION=$1
STEP=5
MAX_VOLUME=120

# Adjust volume
if [ "$ACTION" == "up" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ +${STEP}%
elif [ "$ACTION" == "down" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ -${STEP}%
fi

# Get the actual volume level (first percentage found)
VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1 | tr -d '%')

# Cap at MAX_VOLUME to prevent overshooting
if [ "$VOLUME" -gt "$MAX_VOLUME" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ ${MAX_VOLUME}%
    VOLUME=$MAX_VOLUME
fi

# Send notification
dunstify -r 9993 "Volume" "${VOLUME}%"
