#!/bin/bash
xrandr --size 3000x1920 --output DP-0 --primary --mode 1080x1920 --pos 0x0 --output DVI-D-0 --mode 1920x1080 --pos 1080x420 --output HDMI-0 --off
sh scripts/background.sh
