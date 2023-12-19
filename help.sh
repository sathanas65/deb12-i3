#!/bin/bash

konsole --noclose -e nano keymap.txt &
sleep 1
i3-msg floating toggle &
sleep 1 
i3-msg resize set [width] 50 px [height] 50 px &
sleep 1
i3-msg move [absolute] position center

