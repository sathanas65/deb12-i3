#!/bin/bash

cp ~/.config/i3/config.d/vmguest.conf ~/.config/i3/configbkps/vmguest.conf-$(date -u +'%Y%m%d-%H%M%SZ')
geany ~/.config/i3/config.d/vmguest.conf &
i3-msg mode "default"
