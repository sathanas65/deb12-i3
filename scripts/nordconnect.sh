#!/bin/bash

# Connect to NordVPN and capture the output
connect_output=$(nordvpn connect 2>&1)
connect_exit_status=$?

# Check if the output contains "you are not logged in"
if [[ $connect_output == *"You are not logged in"* ]]; then
	notify-send --urgency=critical "NordVPN Connection:
	YOU ARE NOT LOGGED IN AND KILLSWITCH IS DISABLED!
	YOUR REAL IP IS VISIBLE!"
	
	# Disable the killswitch
	nordvpn set killswitch disabled
    	# Run nordvpn login and capture the output
	output=$(nordvpn login 2>&1)

	# Extract the URL from the output
	url=$(echo "$output" | grep -o 'https://[a-zA-Z0-9./?=_-]*')

	# Check if the URL was found
	if [ -n "$url" ]; then
		# Open the URL in Chromium
		chromium "$url" &> /dev/null
	else
		echo "Login URL not found."
	fi
else 
	# Enable the killswitch and capture the output
	killswitch_output=$(nordvpn set killswitch enabled 2>&1)
	killswitch_exit_status=$?
	notify-send "NordVPN Connection:" "$connect_output - Exit Status: $connect_exit_status"
	sleep 4
	notify-send "$killswitch_output - Exit Status: $killswitch_exit_status" 
fi
