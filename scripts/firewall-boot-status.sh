#!/bin/bash

export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"

# Get Firewall status
status_output=$(sudo ufw status 2>&1)

if [[ $status_output == *"Status: inactive"* ]]; then
	# Continuously check the firewall status
	while [[ $new_status_output != *"Status: active"* ]]; do
		
		warning=$(echo -e "UFW WARNING:\nYOUR FIREWALL IS DISABLED!\nYOUR NETWORK PORTS\nARE ALL OPEN!\nUSE SUPER + SHIFT + f\nTO ENABLE!")
		notify-send --urgency=critical "$warning" -t 0
		unset $status_output
    
		# Wait for a bit before checking again
		sleep 5
		# Check UFW status
		new_status_output=$(sudo ufw status 2>&1)
	done
	tmux kill-session -t "$(tmux display-message -p '#S')"
fi
