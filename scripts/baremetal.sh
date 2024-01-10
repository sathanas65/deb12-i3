#!/bin/bash

cp ~/.config/i3/config.d/baremetal.conf ~/.config/i3/configbkps/baremetal.conf-$(date -u +'%Y%m%d-%H%M%SZ')
geany ~/.config/i3/config.d/baremetal.conf &
i3-msg mode "default"
