#!/bin/bash

cp ~/.config/i3/config.d/start.conf ~/.config/i3/configbkps/start.conf-$(date -u +'%Y%m%d-%H%M%SZ')
geany ~/.config/i3/config.d/start.conf &
i3-msg mode "default"
