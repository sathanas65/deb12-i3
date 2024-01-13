#!/bin/bash

# Extract the tmux session name to decide which command to run
session_name=$(tmux display-message -p '#S')

case "$session_name" in
    i3config)
        i3-msg workspace "Config"
        cp ~/.config/i3/config ~/.config/i3/configbkps/config-$(date -u +'%Y%m%d-%H%M%SZ')
		geany -i ~/.config/i3/config
        ;;
    i3workspaces)
        i3-msg workspace "Config"
        cp ~/.config/i3/config.d/workspaces.conf ~/.config/i3/configbkps/workspaces.conf-$(date -u +'%Y%m%d-%H%M%SZ')
		geany -i ~/.config/i3/config.d/workspaces.conf
        ;;
    i3containers)
        i3-msg workspace "Config"
        cp ~/.config/i3/config.d/containers.conf ~/.config/i3/configbkps/containers.conf-$(date -u +'%Y%m%d-%H%M%SZ')
		geany -i ~/.config/i3/config.d/containers.conf
        ;;
    i3execmodes)
        i3-msg workspace "Config"
        cp ~/.config/i3/config.d/execmodes.conf ~/.config/i3/configbkps/execmodes.conf-$(date -u +'%Y%m%d-%H%M%SZ')
		geany -i ~/.config/i3/config.d/execmodes.conf
        ;;
    i3keybinds)
        i3-msg workspace "Config"
        cp ~/.config/i3/config.d/keybinds.conf ~/.config/i3/configbkps/keybinds.conf-$(date -u +'%Y%m%d-%H%M%SZ')
		geany -i ~/.config/i3/config.d/keybinds.conf
        ;;
    i3start)
        i3-msg workspace "Config"
        cp ~/.config/i3/config.d/start.conf ~/.config/i3/configbkps/start.conf-$(date -u +'%Y%m%d-%H%M%SZ')
		geany -i ~/.config/i3/config.d/start.conf
        ;;
	i3baremetal)
		i3-msg workspace "Config"
        cp ~/.config/i3/config.d/baremetal.conf ~/.config/i3/configbkps/baremetal.conf-$(date -u +'%Y%m%d-%H%M%SZ')
		geany -i ~/.config/i3/config.d/baremetal.conf
		;;
	i3vmguest)
        i3-msg workspace "Config"
        cp ~/.config/i3/config.d/vmguest.conf ~/.config/i3/configbkps/vmguest.conf-$(date -u +'%Y%m%d-%H%M%SZ')
		geany -i ~/.config/i3/config.d/vmguest.conf
        ;;
    autostart)
        i3-msg workspace "Config"
        cp ~/.config/i3/autostart.sh ~/.config/i3/configbkps/autostart-$(date -u +'%Y%m%d-%H%M%SZ')
		geany -i ~/.config/i3/autostart.sh
        ;;
    dunstconfig)
        i3-msg workspace "Config"
        cp ~/.config/dunst/dunstrc ~/.config/i3/configbkps/dunstrc-$(date -u +'%Y%m%d-%H%M%SZ')
		geany -i ~/.config/dunst/dunstrc
        ;;
    keymap)
        i3-msg workspace "Config"
        cp ~/scripts/keymap.txt ~/scripts/keymap-$(date -u +'%Y%m%d-%H%M%SZ')
		geany -i ~/scripts/keymap.txt
        ;;
    *)
        echo "Invalid session. Please use a valid tmux session name."
        exit 1
        ;;
esac

exit 0
