#!/bin/bash

export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"

# Extract the tmux session name to decide which command to run
session_name=$(tmux display-message -p '#S')
#env >> ~/scripts/nordvpn.log
#echo "Running case '${session_name}'" >> ~/scripts/nordvpn.log

case "$session_name" in
    norddouble)
		#echo "Running case norddouble" >> ~/scripts/nordvpn.log
        # Connect to NordVPN and capture the output
		connect_output=$(nordvpn connect double vpn 2>&1)
		connect_exit_status=$?

		# Disable the killswitch and capture the output
		killswitch_output=$(nordvpn set killswitch enabled 2>&1)
		killswitch_exit_status=$?

		# Send a notification with the output of the both commands
		notify-send "Nord Double VPN Connection" "$connect_output - Exit Status: $connect_exit_status"
		notify-send "$killswitch_output - Exit Status: $killswitch_exit_status"
        ;;
    nordlogin)
		#echo "Running case nordlogin" >> ~/scripts/nordvpn.log
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
        ;;
    nordpause)
		#echo "Running case nordpause" >> ~/scripts/nordvpn.log
        # Disable the killswitch and capture the output
		killswitch_output=$(nordvpn set killswitch disabled 2>&1)
		killswitch_exit_status=$?

		# Connect to NordVPN and capture the output
		disconnect_output=$(nordvpn disconnect 2>&1)
		disconnect_exit_status=$?

		# Send a notification with the output of the both commands
		notify-send "NordVPN Pause Connection" "$killswitch_output - Exit Status: $killswitch_exit_status" 
		notify-send "$disconnect_output - Exit Status: $disconnect_exit_status"
        ;;
    nordresume)
		#echo "Running case nordresume" >> ~/scripts/nordvpn.log
		# Connect to NordVPN and capture the output
		connect_output=$(nordvpn connect 2>&1)
		connect_exit_status=$?

		# Disable the killswitch and capture the output
		killswitch_output=$(nordvpn set killswitch enabled 2>&1)
		killswitch_exit_status=$?

		# Send a notification with the output of the both commands
		notify-send "NordVPN Resume Connection" "$connect_output - Exit Status: $connect_exit_status"
		notify-send "$killswitch_output - Exit Status: $killswitch_exit_status" 
        ;;
    nordpnp)
		#echo "Running case nordpnp" >> ~/scripts/nordvpn.log
		# Connect to NordVPN and capture the output
		connect_output=$(nordvpn connect p2p 2>&1)
		connect_exit_status=$?

		# Disable the killswitch and capture the output
		killswitch_output=$(nordvpn set killswitch enabled 2>&1)
		killswitch_exit_status=$?

		# Send a notification with the output of the both commands
		notify-send "NordVPN P2P Connection" "$connect_output - Exit Status: $connect_exit_status"
		notify-send "$killswitch_output - Exit Status: $killswitch_exit_status"
        ;;
    nordstatus)
		#echo "Running case nordstatus" >> ~/scripts/nordvpn.log
		konsole --profile "Profile 1" --noclose -e nordvpn status --title "NordStatus"
		;;
    *)
        echo "Invalid session. Please use a valid tmux session name."
        exit 1
        ;;
esac

exit 0
