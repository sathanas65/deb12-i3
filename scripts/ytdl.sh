#!/bin/bash

# Get the current clipboard content
CLIPBOARD_CONTENT=$(xclip -selection clipboard -o)

# Check if the clipboard content starts with the YouTube URL pattern
if [[ $CLIPBOARD_CONTENT == https://www.youtube.com/watch?v=* ]]; then
    # Download the video using youtube-dl
    youtube_output=$(youtube-dl "$CLIPBOARD_CONTENT" 2>&1)
    connect_exit_status=$?
    notify-send "Downloading $CLIPBOARD_CONTENT" "$connect_output - Exit Status: $connect_exit_status"
    
else
    notify-send "Clipboard does not contain a YouTube video URL."
fi
