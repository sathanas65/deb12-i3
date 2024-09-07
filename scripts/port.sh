#!/bin/bash
xrandr --size 3840x1080 --output DisplayPort-1 --primary --mode 1920x1080 --rotate left --pos 0x0 --output DVI-D-0 --mode 1920x1080 --pos 1080x420 --output HDMI-A-0 --off
sh scripts/background.sh
