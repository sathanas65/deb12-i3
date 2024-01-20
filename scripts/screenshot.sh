#!/bin/bash

export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"

# Extract the tmux session name to decide which command to run
session_name=$(tmux display-message -p '#S')
#session_name="screenclip"
#env >> ~/scripts/screenshot.log
#echo "Running case '${session_name}'" >> ~/scripts/screenshot.log

case "$session_name" in
	delaysave)
		# Get the output name of the currently focused workspace
		output=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).output')
		# Get the geometry of the focused monitor
		geometry=$(xrandr | grep "$output" | grep -oP '\d+x\d+\+\d+\+\d+')
		# Delay screen capture
		sleep 3
		# Capture the screen of the focused monitor
		maim --geometry="$geometry" --format=png /home/$USER/Pictures/screenshot-$(date -u +'%Y%m%d-%H%M%SZ')
		#echo "Running case screensave" >> ~/scripts/screenshot.log
		notify-send "Screen saved"
        ;;
    screenclip)
		# Get the output name of the currently focused workspace
		output=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).output')
		# Get the geometry of the focused monitor
		geometry=$(xrandr | grep "$output" | grep -oP '\d+x\d+\+\d+\+\d+')
		# Capture the screen of the focused monitor
		maim --geometry="$geometry" | xclip -selection clipboard -t image/png
		sleep 2
		notify-send "Screen clipped"
		;;
    screensave)
		# Get the output name of the currently focused workspace
		output=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).output')
		# Get the geometry of the focused monitor
		geometry=$(xrandr | grep "$output" | grep -oP '\d+x\d+\+\d+\+\d+')
		# Capture the screen of the focused monitor
		maim --geometry="$geometry" --format=png /home/$USER/Pictures/screenshot-$(date -u +'%Y%m%d-%H%M%SZ')
		#echo "Running case screensave" >> ~/scripts/screenshot.log
		notify-send "Screen saved"
        ;;
    selectclip)
		maim --format=png --select | xclip -selection clipboard -t image/png 
		#echo "Running case selectclip" >> ~/scripts/screenshot.log
		sleep 2
		notify-send "Selection clipped"
        ;;
    selectsave)
		maim --format=png --select /home/$USER/Pictures/screenshot-$(date -u +'%Y%m%d-%H%M%SZ')
		#echo "Running case selectsave" >> ~/scripts/screenshot.log
		notify-send "Selection saved" 
        ;;
    windowclip)
		maim --format=png --window $(xdotool getactivewindow) | xclip -selection clipboard -t image/png
		#echo "Running case windowclip" >> ~/scripts/screenshot.log
		sleep 2
		notify-send "Window clipped"
        ;;
    windowsave)
		maim --format=png --window $(xdotool getactivewindow) /home/$USER/Pictures/screenshot-$(date -u +'%Y%m%d-%H%M%SZ')
		#echo "Running case windowsave" >> ~/scripts/screenshot.log
		notify-send "Window saved"
		;;
    *)
        echo "Invalid session. Please use a valid tmux session name."
        exit 1
        ;;
esac

exit 0
