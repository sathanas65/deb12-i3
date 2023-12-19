#!/bin/bash
cp ~/.config/i3/config ~/.config/i3/configbkps/config-$(date -u +'%Y%m%d-%H%M%SZ')
konsole --noclose -e nano ~/.config/i3/config &
sleep 1
i3-msg fullscreen
