#!/bin/bash

cp ~/.config/i3/config ~/.config/i3/configbkps/config-$(date -u +'%Y%m%d-%H%M%SZ')
geany ~/.config/i3/config &
i3-msg mode "default"

#cp ~/.config/i3/config ~/.config/i3/configbkps/config-$(date -u +'%Y%m%d-%H%M%SZ')
#i3-msg workspace 'Config'
#sleep 0.5  # Short delay to ensure the workspace switch occurs
#geany ~/.config/i3/config



