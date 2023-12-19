#!/bin/bash

konsole --noclose -e nano ~/keymap.txt &
sleep 1
i3-msg floating toggle &
sleep 1
i3-msg move position center &
sleep 1
no_focus [window_role="pop-up"]
