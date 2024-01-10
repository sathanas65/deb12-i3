#!/bin/bash

cp ~/.config/i3/config.d/workspaces.conf ~/.config/i3/configbkps/workspaces.conf-$(date -u +'%Y%m%d-%H%M%SZ')
geany ~/.config/i3/config.d/workspaces.conf &
i3-msg mode "default"
