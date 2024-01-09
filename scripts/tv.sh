#!/bin/bash
xrandr --size 3840x3240 --output HDMI-0 --mode 3840x2160 --pos 0x0 --output DP-0 --primary --mode 1920x1080 --pos 0x2160 --output DVI-D-0 --mode 1920x1080 --pos 1920x2160
sh scripts/background.sh
i3-msg focus output HDMI-0
i3-msg workspace "TV"
