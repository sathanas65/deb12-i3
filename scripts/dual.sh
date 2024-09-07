#!/bin/bash
xrandr --size 3840x1080 --output DisplayPort-1 --primary --mode 1920x1080 --rotate normal --pos 0x0 --set TearFree on --output DVI-D-0 --mode 1920x1080 --pos 1920x0 --set TearFree on --output HDMI-A-0 --off
sh scripts/background.sh
