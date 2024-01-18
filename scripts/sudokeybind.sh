#!/bin/bash

export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"

# Extract the tmux session name to decide which command to run
session_name=$(tmux display-message -p '#S')

# Function to ask for password and run sudo -v
ask_for_password() {
    yad --entry --title="Authentication Required" --text="Enter password for $session_name:" \
    --button=gtk-ok:0 --width=300 --height=100 --center \
    --undecorated --on-top --skip-taskbar --skip-pager --hide-text | sudo -S -v

    # Check if the sudo credential update was successful
    if [ $? -ne 0 ]; then
        yad --text="Authentication failed. Exiting." --button=gtk-ok:0
        tmux kill-session -t "$(tmux display-message -p '#S')"
        exit 1
    fi
}

case "$session_name" in
	shutdown)
        ask_for_password
        sudo shutdown now
        ;;
	reboot)
        ask_for_password
        sudo reboot now
        ;;
    sudo_thunar)
        ask_for_password
        sudo thunar
        ;;
    synaptic)
        ask_for_password
        sudo synaptic
        ;;
    timeshift)
        ask_for_password
        sudo timeshift-gtk
        ;;
    sudo_disks)
        ask_for_password
        sudo gnome-disks
        ;;
    xconfig)
        konsole --profile "Profile 1" --noclose -e sh -c 'sudo cp /etc/X11/xorg.conf /etc/X11/xorg.conf.bkp && sudo nano /etc/X11/xorg.conf'
        ;;
    grubconfig)
        konsole --profile "Profile 1" --noclose -e sh -c 'sudo cp /etc/default/grub /etc/default/grub.bkp && sudo nano /etc/default/grub'
        ;;
    fstab)
        konsole --profile "Profile 1" --noclose -e sh -c 'sudo cp /etc/fstab /etc/fstab.bkp && sudo nano /etc/fstab'

        ;;
    crypttab)
        konsole --profile "Profile 1" --noclose -e sh -c 'sudo cp /etc/crypttab /etc/crypttab.bkp && sudo nano /etc/crypttab'
        ;;
    sudoers)
        konsole --profile "Profile 1" --noclose -e sh -c 'sudo cp /etc/sudoers /etc/sudoers.bkp && sudo nano /etc/sudoers'
        ;;
    ldmconfig)
        ask_for_password
        sudo cp /etc/lightdm/lightdm.conf /etc/lightdm/lightdm.conf.bkp && sudo geany -i /etc/lightdm/lightdm.conf
        ;;
    ldmgreetconfig)
        ask_for_password
        sudo cp /usr/share/lightdm/lightdm-gtk-greeter.conf.d/01_debian.conf /usr/share/lightdm/lightdm-gtk-greeter.conf.d/01_debian.conf.bkp && sudo geany -i /usr/share/lightdm/lightdm-gtk-greeter.conf.d/01_debian.conf
        ;;
    ldmdisplay)
        ask_for_password
        sudo cp /usr/share/display.sh /usr/share/display.sh.bkp && sudo geany -i /usr/share/display.sh
        ;;
    interfaces)
        konsole --profile "Profile 1" --noclose -e sh -c 'sudo cp /etc/network/interfaces /etc/network/interfaces.bkp && sudo nano /etc/network/interfaces'
        ;;
    networks)
        konsole --profile "Profile 1" --noclose -e sh -c 'sudo cp /etc/networks /etc/networks.bkp && sudo nano /etc/networks'
        ;;
    netmanage)
        konsole --profile "Profile 1" --noclose -e sh -c 'sudo cp /etc/NetworkManager/NetworkManager.conf /etc/NetworkManager/NetworkManager.conf.bkp && sudo nano /etc/NetworkManager/NetworkManager.conf'
        ;;
    *)
        echo "Invalid session. Please use a valid tmux session name."
        exit 1
        ;;
esac

exit 0
