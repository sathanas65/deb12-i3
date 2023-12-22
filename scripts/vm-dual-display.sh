#!/bin/bash
xrandr --size 3840x1080 --output Virtual-1 --primary --mode 1920x1080 --pos 0x0 --output Virtual-2 --mode 1920x1080 --pos 1920x0 --output HDMI-0 --off
sh scripts/background.sh
