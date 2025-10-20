#!/bin/bash

# Define the text you want to paste
text="https://github.com/sathanas65/deb12-i3/"

# Copy the text to the clipboard (using the PRIMARY selection in case the CLIPBOARD is misbehaving)
echo "$text" | xclip -selection clipboard
echo "$text" | xclip -selection primary

# Wait a moment to ensure the clipboard is set (in milliseconds)
sleep 0.1

# Focus the currently active window (just to ensure focus is correct)
xdotool windowactivate $(xdotool getactivewindow)

# Simulate the paste action (Ctrl + V) into the active window
xdotool key --clearmodifiers ctrl+v
