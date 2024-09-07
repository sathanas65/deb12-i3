#!/bin/bash
xrandr --size 3840x4080 --output HDMI-A-0 --mode 3840x2160 --pos 0x0 --set TearFree on --output DisplayPort-1 --primary --mode 1920x1080 --rotate left --pos 0x2160 --set TearFree on --output DVI-D-0 --mode 1920x1080 --pos 1080x2160 --set TearFree on
sleep 1
sh scripts/background.sh
i3-msg focus output HDMI-A-0
i3-msg workspace "TV"
