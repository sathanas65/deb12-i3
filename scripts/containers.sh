#!/bin/bash

cp ~/.config/i3/config.d/containers.conf ~/.config/i3/configbkps/containers-$(date -u +'%Y%m%d-%H%M%SZ')
geany ~/.config/i3/config.d/containers.conf &
i3-msg mode "default"
