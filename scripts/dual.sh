#!/bin/bash
xrandr --size 3840x1080 --output DP-0 --primary --mode 1920x1080 --pos 0x0 --output DVI-D-0 --mode 1920x1080 --pos 1920x0 --output HDMI-0 --off
sh scripts/background.sh

