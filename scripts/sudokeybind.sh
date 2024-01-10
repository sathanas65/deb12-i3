#!/bin/bash

export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"

# Function to ask for password and run sudo -v
ask_for_password() {
    yad --entry --title="Authentication Required" --text="Enter your password:" \
    --button=gtk-ok:0 --width=300 --height=100 --center \
    --undecorated --on-top --skip-taskbar --skip-pager --hide-text | sudo -S -v

    # Check if the sudo credential update was successful
    if [ $? -ne 0 ]; then
        yad --text="Authentication failed. Exiting." --button=gtk-ok:0
        tmux kill-session -t "$(tmux display-message -p '#S')"
        exit 1
    fi
}

# Extract the tmux session name to decide which command to run
session_name=$(tmux display-message -p '#S')

case "$session_name" in
    thunar_sudo_script)
        ask_for_password
        sudo thunar
        ;;
    synaptic_script)
        ask_for_password
        sudo synaptic
        ;;
    timeshift_bkp_script)
        ask_for_password
        sudo timeshift-gtk
        ;;
    gnomedisks_sudo_script)
        ask_for_password
        sudo gnome-disks
        ;;
    *)
        echo "Invalid session. Please use a valid tmux session name."
        exit 1
        ;;
esac

exit 0
