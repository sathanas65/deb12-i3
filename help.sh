#!/bin/bash

konsole --noclose -e nano ~/keymap.txt &
sleep 1
i3-msg floating toggle &
no_focus [window_role="pop-up"] &
