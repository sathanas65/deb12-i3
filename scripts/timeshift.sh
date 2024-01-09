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

sudo timeshift-gtk
exit 0
