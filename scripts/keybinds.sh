#!/bin/bash

cp ~/.config/i3/config.d/keybinds.conf ~/.config/i3/configbkps/keybinds.conf-$(date -u +'%Y%m%d-%H%M%SZ')
geany ~/.config/i3/config.d/keybinds.conf &
i3-msg mode "default"
