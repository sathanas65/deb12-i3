#!/bin/bash
xrandr --size 3840x2160 --output HDMI-A-0 --mode 3840x2160 --rotate normal --pos 0x0 --set TearFree on --output DisplayPort-1 --off --output DVI-D-0 --off
sh scripts/background.sh
i3-msg focus output HDMI-A-0
i3-msg workspace "TV"
