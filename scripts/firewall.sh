#!/bin/bash

export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"

yad --entry --title="Authentication Required" --text="Enter your password:" \
--button=gtk-ok:0 --width=300 --height=100 --center \
--undecorated --on-top --skip-taskbar --skip-pager --hide-text | sudo -S -v

# Check if the sudo credential update was successful
if [ $? -ne 0 ]; then
    yad --text="Authentication failed. Exiting." --button=gtk-ok:0
    tmux kill-session -t "$(tmux display-message -p '#S')"
fi

# Get Firewall status
status_output=$(sudo ufw status 2>&1)
#echo $status_output
# Check if the output contains "Status: active"
if [[ $status_output == *"Status: active"* ]]; then
	shopt -s nocasematch
	confirmation=$(yad --entry --title="Warning!" --text="Are you sure you want to disable your firewall?" \
	--button=gtk-ok:0 --width=300 --height=100 --center \
	--undecorated --on-top --skip-taskbar --skip-pager)
	# Check if confirmation was entered	
	if [ -z "$confirmation" ]; then
		yad --text="No response entered. Exiting." --button=gtk-ok:0
		tmux kill-session -t "$(tmux display-message -p '#S')"
	fi
	
	if [[ $confirmation == "y" || $confirmation == "yes" ]]; then
		sudo ufw disable
		new_status_output=$(sudo ufw status 2>&1)
		if [[ $new_status_output == *"Status: inactive"* ]]; then
			# Continuously check the firewall status
			#exec tmux new-session -d -s firewall_script '~/scripts/firewall.sh'
			#sudo tmux new-session -d -s check_firewall_script '~/scripts/check-firewall-loop.sh'
			#sudo bash /home/user/scripts/check-firewall-loop.sh
			while [[ $new_status_output != *"Status: active"* ]]; do
				# Check UFW status
				warning=$(echo -e "UFW WARNING:\nYOUR FIREWALL IS DISABLED!\nYOUR NETWORK PORTS\nARE ALL OPEN!\nUSE SUPER + SHIFT + f\nTO ENABLE!")
				notify-send --urgency=critical "$warning" -t 0
				unset $status_output
    
				# Wait for a bit before checking again
				sleep 5
				new_status_output=$(sudo ufw status 2>&1)
			done
			tmux kill-session -t "$(tmux display-message -p '#S')"
		else
			notify-send --urgency=critical "UFW TOGGLE ERROR!"
			tmux kill-session -t "$(tmux display-message -p '#S')"
		fi
	else
		yad --text="Firewall disable request was not confirmed. Exiting." --button=gtk-ok:0
		tmux kill-session -t "$(tmux display-message -p '#S')"
	fi
fi
	
if [[ $status_output == *"Status: inactive"* ]]; then
	sudo ufw enable
	new_status_output=$(sudo ufw status 2>&1)
	#echo $new_status_output
	if [[ $new_status_output == *"Status: active"* ]]; then
		notify-send "UFW:" "$new_status_output" 
		tmux kill-session -t "$(tmux display-message -p '#S')"
	else
		notify-send --urgency=critical "UFW TOGGLE ERROR!"
		tmux kill-session -t "$(tmux display-message -p '#S')"
	fi 
else
    notify-send --urgency=critical "UFW STATUS ERROR!"
    tmux kill-session -t "$(tmux display-message -p '#S')"
fi





