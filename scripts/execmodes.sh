#!/bin/bash

cp ~/.config/i3/config.d/execmodes.conf ~/.config/i3/configbkps/execmodes.conf-$(date -u +'%Y%m%d-%H%M%SZ')
geany ~/.config/i3/config.d/execmodes.conf &
i3-msg mode "default"
