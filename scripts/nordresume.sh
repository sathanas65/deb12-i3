#!/bin/bash

# Connect to NordVPN and capture the output
connect_output=$(nordvpn connect 2>&1)
connect_exit_status=$?

# Disable the killswitch and capture the output
killswitch_output=$(nordvpn set killswitch enabled 2>&1)
killswitch_exit_status=$?

# Send a notification with the output of the both commands
notify-send "NordVPN Resume Connection" "$connect_output - Exit Status: $connect_exit_status"
notify-send "$killswitch_output - Exit Status: $killswitch_exit_status" 

