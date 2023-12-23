#!/bin/bash

# Disable the killswitch and capture the output
killswitch_output=$(nordvpn set killswitch disabled 2>&1)
killswitch_exit_status=$?

# Connect to NordVPN and capture the output
disconnect_output=$(nordvpn disconnect 2>&1)
disconnect_exit_status=$?

# Send a notification with the output of the both commands
notify-send "NordVPN Pause Connection" "$killswitch_output - Exit Status: $killswitch_exit_status" 
notify-send "$disconnect_output - Exit Status: $disconnect_exit_status"
